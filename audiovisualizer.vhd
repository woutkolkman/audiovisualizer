library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.rgbmatrix.all;	

entity audiovisualizer is
	port(CLOCK_50	  : in    std_logic;
		  KEY			  : in    std_logic_vector(0 downto 0);
--		  SW 			  : in    std_logic_vector(17 downto 16);
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
	
	component i2c is
		port(SCL_line   : out   std_logic;
			  SDA_line   : inout std_logic; 
			  flag       : in    std_logic;
			  busy       : out   std_logic;
			  clock_50   : in    std_logic; 
			  address    : in    std_logic_vector(7 downto 0);   
			  data_frame : in    std_logic_vector(15 downto 0)); 
	end component i2c;
	
	-- signals i2c
	signal audio_chip_address : std_logic_vector(7 downto 0);
	signal send_flag          : std_logic;
	signal is_busy            : std_logic;
	signal framed_data        : std_logic_vector(15 downto 0);
	signal reset				  : std_logic;
	
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
	
--	audio_chip : i2c port map (SCL_line => I2C_SCLK, SDA_line => I2C_SDAT, flag => send_flag, busy => is_busy,
--										clock_50 => CLOCK_50, address => audio_chip_address, data_frame => framed_data);
--	audio_chip_address <= "00110100";
	
--	process(CLOCK_50, reset, is_busy) 
--	begin	
--		if (rising_edge(CLOCK_50)) then 							
--			case reset is
--				 when '1' => send_flag <= '0';
--				 when others => null;
--			end case;
--		end if;
--		if (rising_edge(CLOCK_50)) and is_busy = '0' then 	
--			if (SW(17) = '1') then -- audio hoorbaar
--				framed_data(15 downto 9) <= "0000110"; 
--				framed_data(8 downto 0) <= "000000111";
--				send_flag <= '1';
--			elsif (SW(16) = '1') then -- audio gedempt
--				framed_data(15 downto 9) <= "0001111"; 		
--				framed_data(8 downto 0) <= "000000000";
--				send_flag <= '1';
--			end if;
--		end if;
--	end process;
end architecture;
