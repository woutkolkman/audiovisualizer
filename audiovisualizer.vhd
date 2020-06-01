library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.rgbmatrix.all;	

entity audiovisualizer is
	port(CLOCK_50	  : in    std_logic;
		  KEY			  : in    std_logic_vector(0 downto 0);
		  LEDG 		  : out   std_logic_vector(0 downto 0);
		  GPIO 		  : out   std_logic_vector(12 downto 0);
		  AUD_ADCLRCK : in	 std_logic; 
		  AUD_ADCDAT  : out   std_logic; 
		  AUD_DACLRCK : in	 std_logic;
		  AUD_DACDAT  : in    std_logic; 
	     AUD_BCLK    : inout std_logic; 
		  I2C_SCLK    : out   std_logic; 
	     I2C_SDAT 	  : inout std_logic);
end entity;

architecture behaviour of audiovisualizer is

	component matrix_driver_top is
		port(CLOCK	  : in  std_logic;
			  RESET	  : in  std_logic;
			  DATA     : in  std_logic_vector(DATA_WIDTH-1 downto 0);
			  ADDR     : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
			  RESETLED : out std_logic;
			  PINSOUT  : out std_logic_vector(12 downto 0));
	end component;

	--signals matrix_driver_top
	signal tempData : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal tempAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
	
	component frame_generator_dynamic is 
		port(clock, reset   	     : in  std_logic;
		     addr_matrix          : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
		     data_matrix    	     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
	  	     freq_sep1, freq_sep2 : in  std_logic_vector(23 downto 0));
	end component frame_generator_dynamic;
	
	component nios_processor is
	   port(i2c_SDAT         : inout std_logic := '0'; 
		     i2c_SCLK         : out   std_logic;    
			  audio_ADCDAT     : in    std_logic := '0';     
			  audio_ADCLRCK    : in    std_logic := '0';          
			  audio_BCLK       : in    std_logic := '0';          
			  audio_DACDAT     : out   std_logic;                                      
			  audio_DACLRCK    : in    std_logic := '0';                         
	        clk_clk          : in    std_logic := '0'; 
			  reset_reset_n    : in    std_logic := '0'; 
			  freqsep_1_export : out   std_logic_vector(23 downto 0);
			  freqsep_2_export : out   std_logic_vector(23 downto 0));
	end component;
	
	--signals nios_processor								  								
	signal fs_1, fs_2 : std_logic_vector(23 downto 0);	
	
begin

	matrixdriver : matrix_driver_top port map (CLOCK => CLOCK_50,
															 RESET => not KEY(0),
															 RESETLED => LEDG(0),
															 PINSOUT => GPIO,
															 DATA => tempData,
															 ADDR => tempAddr);
	
	dynamic_frame : frame_generator_dynamic port map (clock => CLOCK_50, reset => not KEY(0), addr_matrix => tempAddr, data_matrix => tempData,
																	  freq_sep1(23 downto 18) => fs_1(23 downto 18), freq_sep1(17 downto 12) => fs_1(17 downto 12), 
																	  freq_sep1(11 downto 6) => fs_1(11 downto 6),  freq_sep1(5 downto 0) => fs_1(5 downto 0),
																	  freq_sep2(23 downto 18) => fs_2(23 downto 18), freq_sep2(17 downto 12) => fs_2(17 downto 12),
																	  freq_sep2(11 downto 6) => fs_2(11 downto 6), freq_sep2(5 downto 0) => fs_2(5 downto 0)
																	  );
	
	nios_ii : nios_processor port map (clk_clk => CLOCK_50, reset_reset_n => KEY(0), 
												  audio_ADCDAT => AUD_DACDAT, audio_DACDAT => AUD_ADCDAT, 
												  audio_ADCLRCK => AUD_ADCLRCK, audio_DACLRCK =>AUD_DACLRCK, audio_BCLK => AUD_BCLK,
												  freqsep_1_export => fs_1, i2c_SDAT => I2C_SDAT, i2c_SCLK => I2C_SCLK,
											     freqsep_2_export => fs_2);

end architecture;
