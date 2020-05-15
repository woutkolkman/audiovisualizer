library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audiovisualizer is
	port(CLOCK_50    : in    std_logic;					        -- voor clock
		  KEY		     : in    std_logic_vector(0 downto 0);  -- voor reset 
		  SW			  : in    std_logic_vector(17 downto 0); -- switches voor i2c en FPGA
		  LEDR		  : out   std_logic_vector(7 downto 0);
		  AUD_ADCLRCK : inout std_logic; -- WM8731 pins (audio-chip)
		  AUD_ADCDAT  : out   std_logic; -- output audio 
		  AUD_DACLRCK : inout std_logic; 
		  AUD_DACDAT  : in    std_logic; -- input audio 
	     AUD_BCLK    : inout std_logic; -- clock voor ADC component
		  I2C_SCLK    : out   std_logic; -- clock en data-lijn I2C
	     I2C_SDAT    : inout std_logic);
end entity;

architecture rtl of audiovisualizer is

component nios_processor is
	port(audio_ADCDAT  : in  std_logic                    := '0'; 
		  audio_ADCLRCK : in  std_logic                    := '0'; 
		  audio_BCLK    : in  std_logic                    := '0'; 
		  audio_DACDAT  : out std_logic;                           
		  audio_DACLRCK : in  std_logic                    := '0'; 
		  clk_clk       : in  std_logic                    := '0'; 
		  leds_export   : out std_logic_vector(7 downto 0);       
		  reset_reset_n : in  std_logic                    := '0');  
end component nios_processor;

	-- signals nios_processor
	signal reset_pin	    : std_logic; -- reset signal
	signal leds				 : std_logic_vector(7 downto 0);

component ad_converter_i2c is
	port(SCL_line   : out   std_logic;
		  SDA_line   : inout std_logic; -- inout: deze port is bi-directioneel; je kunt zowel lezen als schrijven
		  flag       : in    std_logic;
		  busy       : out   std_logic;
		  clock_50   : in    std_logic; -- i2c met clock van 50 MHz
		  address    : in    std_logic_vector(7 downto 0);   -- het adres bedraagt 8 bits (volgens datasheet)
		  data_frame : in    std_logic_vector(15 downto 0)); -- data frame bestaat uit 16 bits 
end component ad_converter_i2c;
	
	-- signals i2c component
	signal send_flag      : std_logic;
	signal is_busy        : std_logic;
	signal framed_data    : std_logic_vector(15 downto 0);

begin
		

	nios_iii : nios_processor port map (clk_clk => CLOCK_50, reset_reset_n => reset_pin, leds_export => leds,
												   audio_ADCDAT => AUD_DACDAT, audio_DACDAT => AUD_ADCDAT, audio_DACLRCK =>
													AUD_DACLRCK, audio_ADCLRCK => AUD_ADCLRCK, audio_BCLK => AUD_BCLK);
	
	audio_chip : ad_converter_i2c port map (SCL_line => I2C_SCLK, SDA_line => I2C_SDAT, flag => send_flag, busy => is_busy,
														 clock_50 => CLOCK_50, address => "00110100", data_frame => framed_data);
	
	LEDR <= leds;
	reset_pin <= KEY(0); -- reset_pin verbinden met KEY 0 
	
	process(CLOCK_50, reset_pin) -- proces voor starten communicatie FPGA audio-chip (i2c) 
	begin	
		if (rising_edge(CLOCK_50)) then -- (passed)
			case reset_pin is
				when '1' => send_flag <= '0';
				when others => null;
			end case;
		end if;
		if (rising_edge(CLOCK_50)) and is_busy = '0' then -- (passed)
			if (SW(17) = '1') then -- enable ADC (audio aan) (passed)
				framed_data(15 downto 9) <= "0000110"; -- volgens data sheet
				framed_data(8 downto 0) <= "000000111";
				send_flag <= '1';
			elsif (SW(16) = '1') then -- reset process (audio uit) (passed)
				framed_data(15 downto 9) <= "0001111"; -- volgens data sheet
				framed_data(8 downto 0) <= "000000000";
				send_flag <= '1';
			else 
				null;
			end if;
		end if;
	end process;
	
end architecture rtl;