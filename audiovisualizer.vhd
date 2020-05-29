library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audiovisualizer is
	port(CLOCK_50    : in    std_logic;					        -- voor clock
		  KEY		     : in    std_logic_vector(0 downto 0);  -- voor reset 
		  SW			  : in    std_logic_vector(17 downto 0); -- switches voor i2c en FPGA
		  AUD_ADCLRCK : inout   std_logic; -- WM8731 pins (audio-chip)
		  AUD_ADCDAT  : in   std_logic; -- output audio 
		  AUD_DACLRCK : inout   std_logic; 
		  AUD_DACDAT  : out    std_logic; -- input audio 
	     AUD_BCLK    : inout   std_logic; -- clock voor ADC component
		  AUD_XCK     : out   std_logic; 
		  I2C_SCLK    : out   std_logic; -- clock en data-lijn I2C
	     I2C_SDAT    : inout std_logic);
end entity;

architecture rtl of audiovisualizer is

	component nios_processor is
		port(
--			  adc_0_external_interface_sclk : out std_logic; 		   -- ADC eigen clock                                  
--			  adc_0_external_interface_cs_n : out std_logic; 		   -- ADC chip selection (?)                               
--			  adc_0_external_interface_dout : in  std_logic := '0';  -- ADC audio-input 
--	   	  adc_0_external_interface_din  : out std_logic; 	 	   -- DAC audio-output (16-bits)   
			  adc_data_pio_in_port  		  : in  std_logic_vector(5 downto 0) := (others => '0'); --   adc_data_pio.in_port
			  adc_data_pio_out_port 		  : out std_logic_vector(5 downto 0);                    --               .out_port
			  adc_links_pio_export  		  : in std_logic_vector(31 downto 0) := (others => '0'); --  adc_links_pio.export
			  adc_rechts_pio_export 		  : in std_logic_vector(31 downto 0) := (others => '0'); -- adc_rechts_pio.export
			  clk_clk                       : in  std_logic := '0';  -- clock
			  reset_reset_n                 : in  std_logic := '0'); -- reset     
	end component nios_processor;

	-- signals nios_processor
	signal chip_selection					: std_logic; -- chip selection signal 
	signal reset_pin, dmy_in, dmy_out	: std_logic; -- reset signal
	signal adc_links, dmy_vect				: std_logic_vector(31 downto 0);
	signal adc_rechts							: std_logic_vector(31 downto 0);
	signal adc_data_in, adc_data_out		: std_logic_vector(5 downto 0); --IN gaat naar processor, OUT gaat naar ADC (benaming door Qsys)
	
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

	component avconf is
		port(
			  reset 		: in std_logic;
			  CLOCK_50 	: in std_logic;
			  I2C_SCLK 	: out std_logic;
			  I2C_SDAT 	: out std_logic
			  );
	end component;
	
	signal avconf_reset : std_logic;
	
	component Audio_Controller is
		port(
			  read_audio_in 				: in std_logic;
			  clear_audio_in_memory		: in std_logic;
			  left_channel_audio_out	: in std_logic_vector(32 downto 1);
			  reset							: in std_logic; --high = reset
			  clear_audio_out_memory	: in std_logic;
			  right_channel_audio_out	: in std_logic_vector(32 downto 1);
			  write_audio_out				: in std_logic;
			  audio_in_available			: out std_logic;
			  left_channel_audio_in		: out std_logic_vector(32 downto 1);
			  right_channel_audio_in	: out std_logic_vector(32 downto 1);
			  audio_out_allowed			: out std_logic;
			  AUD_ADCDAT					: in std_logic; --seriëel
			  CLOCK_50						: in std_logic;
			  AUD_XCK						: out std_logic;
			  AUD_BCLK						: inout std_logic;
			  AUD_ADCLRCK					: inout std_logic;
			  AUD_DACDAT					: out std_logic;
			  AUD_DACLRCK					: inout std_logic
		);
	end component;

	signal left_channel, right_channel : std_logic_vector(31 downto 0);
	signal AC_signal_array : std_logic_vector(6 downto 0);
	signal audio_controller_reset : std_logic;
	
begin
		
	nios_ii : nios_processor port map (clk_clk => CLOCK_50, reset_reset_n => reset_pin, 
--												  adc_0_external_interface_sclk => AUD_BCLK, adc_0_external_interface_cs_n => chip_selection, adc_0_external_interface_dout => AUD_DACDAT, adc_0_external_interface_din => AUD_ADCDAT
												  adc_links_pio_export => adc_links, adc_rechts_pio_export => adc_rechts,
												  adc_data_pio_in_port => adc_data_in, adc_data_pio_out_port => adc_data_out
												  );
	
	reset_pin <= KEY(0);
	chip_selection <= '0'; -- (?)
	
--	audio_chip : ad_converter_i2c port map (SCL_line => I2C_SCLK, SDA_line => I2C_SDAT, flag => send_flag, busy => is_busy,
--														 clock_50 => CLOCK_50, address => "00110100", data_frame => framed_data);
	
	codec : avconf port map(
									reset 	=> avconf_reset,
									CLOCK_50 => CLOCK_50,
									I2C_SCLK => I2C_SCLK,
									I2C_SDAT => I2C_SDAT
									);
	
	avconf_reset <= NOT KEY(0);
	
	audio_ctrl : Audio_Controller port map(
														read_audio_in 					=> adc_data_out(0),
														clear_audio_in_memory 		=> adc_data_out(1),
														left_channel_audio_out 		=> dmy_vect, --not connected
														reset 							=> audio_controller_reset,
														clear_audio_out_memory 		=> adc_data_out(2),
														right_channel_audio_out 	=> dmy_vect, --not connected
														write_audio_out 				=> adc_data_out(3),
														audio_in_available 			=>	adc_data_in(4),
														left_channel_audio_in 		=> left_channel,
														audio_out_allowed 			=> adc_data_in(5),
														right_channel_audio_in 		=> right_channel,
														AUD_ADCDAT 		=> AC_signal_array(0),
														CLOCK_50 		=> AC_signal_array(1),
														AUD_XCK 			=> AC_signal_array(2),
														AUD_BCLK 		=> AC_signal_array(3),
														AUD_ADCLRCK 	=> AC_signal_array(4),
														AUD_DACDAT 		=> AC_signal_array(5),
														AUD_DACLRCK 	=> AC_signal_array(6)
														);
	
	audio_controller_reset <= NOT KEY(0);
	adc_links		 	 <= left_channel;
	adc_rechts		 	 <= right_channel;
	AC_signal_array(0) <= AUD_ADCDAT;
	AC_signal_array(1) <= CLOCK_50;
	AUD_XCK				 <= AC_signal_array(2);
--	AC_signal_array(3) <= AUD_BCLK;
	AUD_BCLK				 <= AC_signal_array(3);
--	AC_signal_array(4) <= AUD_ADCLRCK;
	AUD_ADCLRCK			 <= AC_signal_array(4);
	AUD_DACDAT			 <= AC_signal_array(5);
--	AC_signal_array(6) <= AUD_DACLRCK;
	AUD_DACLRCK			 <= AC_signal_array(6);
	
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