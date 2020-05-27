library ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
use work.rgbmatrix.all;		-- config bestand: bevat standaardwaarden en definities voor kleuren voor de matrix.

entity audiovisualizer is
	port(CLOCK_50	  : IN STD_LOGIC;
		  KEY			  : in std_logic_vector(0 downto 0);
		  LEDG 		  : out std_logic_vector(0 downto 0);
		  GPIO 		  : out std_logic_vector(12 downto 0);
		  SW 			  : in std_logic_vector(17 downto 0);
		  AUD_ADCLRCK : inout std_logic; -- WM8731 pins (audio-chip)
		  AUD_ADCDAT  : out std_logic; -- output audio
		  AUD_DACLRCK : inout std_logic;
		  AUD_DACDAT  : in std_logic; -- input audio
	     AUD_BCLK    : inout std_logic; -- clock voor ADC component
		  AUD_XCK 	  : out std_logic;
		  I2C_SCLK    : out std_logic; -- clock en data-lijn I2C
	     I2C_SDAT 	  : inout std_logic);
end entity;

architecture behaviour of audiovisualizer is

component matrix_driver_top is
		port(CLOCK	  : IN STD_LOGIC;
			  RESET	  : in std_logic;
			  DATA     : in std_logic_vector(DATA_WIDTH-1 downto 0);
			  ADDR     : in std_logic_vector(ADDR_WIDTH-1 downto 0);
			  RESETLED : out std_logic;
			  PINSOUT  : OUT STD_LOGIC_VECTOR(12 downto 0));
end component;
	
component frame_generator_dynamic is 
		port(clock, reset   	     : in  std_logic;
		     addr_matrix          : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
		     data_matrix    	     : out std_logic_vector(DATA_WIDTH - 1 downto 0);
	  	     freq_sep1, freq_sep2 : in  std_logic_vector(23 downto 0));
end component frame_generator_dynamic;
	
component nios_processor is
--		port(adc_0_external_interface_sclk : out std_logic;        -- voor ADC
--			  adc_0_external_interface_cs_n : out std_logic;        -- voor ADC
--			  adc_0_external_interface_dout : in  std_logic := '0'; -- voor ADC
--			  adc_0_external_interface_din  : out std_logic;        -- voor ADC
	   port(clk_clk                       : in  std_logic := '0'; -- clk
			  reset_reset_n                 : in  std_logic := '0'; -- reset
			  freqsep_1_export              : out std_logic_vector(23 downto 0);
			  freqsep_2_export              : out std_logic_vector(23 downto 0));
end component;
	
	-- signals nios_processor
	signal chip_selection : std_logic; 								 
	signal reset_pin 		 : std_logic; 								
	signal fs_1, fs_2 	 : std_logic_vector(23 downto 0);	-- signals voor verbinden frequency separator met frame generator
	
	component ad_converter_i2c is
		port(SCL_line   : out   std_logic;
			  SDA_line   : inout std_logic; 
			  flag       : in    std_logic;
			  busy       : out   std_logic;
			  clock_50   : in    std_logic; 
			  address    : in    std_logic_vector(7 downto 0);   -- het adres bedraagt 8 bits (volgens datasheet)
			  data_frame : in    std_logic_vector(15 downto 0)); -- data frame bestaat uit 16 bits 
	end component ad_converter_i2c;
		
	signal reset : std_logic;
	signal tempData : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal tempAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
	
	-- signals i2c component
	signal send_flag      : std_logic;
	signal is_busy        : std_logic;
	signal framed_data    : std_logic_vector(15 downto 0);
	
begin

	reset <= not KEY(0);
		
	matrixdriver : matrix_driver_top port map (CLOCK => CLOCK_50,
															 RESET => reset,
															 RESETLED => LEDG(0),
															 PINSOUT => GPIO,
															 DATA => tempData,
															 ADDR => tempAddr);
		
	dynamic_frame : frame_generator_dynamic port map (clock => CLOCK_50, reset => reset, addr_matrix => tempAddr, data_matrix => tempData,
							  freq_sep1(23 downto 18) => fs_1(23 downto 18), freq_sep1(17 downto 12) => fs_1(17 downto 12), 
				  			  freq_sep1(11 downto 6) => fs_1(11 downto 6),  freq_sep1(5 downto 0) => fs_1(5 downto 0),
							  freq_sep2(23 downto 18) => fs_2(23 downto 18), freq_sep2(17 downto 12) => fs_2(17 downto 12),
							  freq_sep2(11 downto 6) => fs_2(11 downto 6), freq_sep2(5 downto 0) => fs_2(5 downto 0));
							  
	
	nios_ii : nios_processor port map (clk_clk => CLOCK_50, 
												  reset_reset_n => reset_pin, 
--												  adc_0_external_interface_sclk => AUD_BCLK,
--												  adc_0_external_interface_cs_n => chip_selection, 
--												  adc_0_external_interface_dout => AUD_DACDAT, 
--												  adc_0_external_interface_din => AUD_ADCDAT,
												  freqsep_1_export => fs_1,
											     freqsep_2_export => fs_2);
	
	reset_pin <= KEY(0); 
	chip_selection <= '0'; 
	
--	audio_chip : ad_converter_i2c port map (SCL_line => I2C_SCLK, SDA_line => I2C_SDAT, flag => send_flag, busy => is_busy,
--														 clock_50 => CLOCK_50, address => "00110100", data_frame => framed_data);
--		
--	process(CLOCK_50, reset_pin) 
--	begin	
--		if (rising_edge(CLOCK_50)) then 							
--			case reset_pin is
--				when '1' => send_flag <= '0';
--				when others => null;
--			end case;
--		end if;
--		if (rising_edge(CLOCK_50)) and is_busy = '0' then 	
--			if (SW(17) = '1') then 							-- enable ADC (audio aan) (passed)
--				framed_data(15 downto 9) <= "0000110"; 		-- volgens data sheet
--				framed_data(8 downto 0) <= "000000111";
--				send_flag <= '1';
--			elsif (SW(16) = '1') then 						-- reset process (audio uit) (passed)
--				framed_data(15 downto 9) <= "0001111"; 		-- volgens data sheet
--				framed_data(8 downto 0) <= "000000000";
--				send_flag <= '1';
--			else 
--				null;
--			end if;
--		end if;
--	end process;
end architecture;
