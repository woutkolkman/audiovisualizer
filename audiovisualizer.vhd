library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audiovisualizer is
	port(CLOCK_50    : in    std_logic;					       
		  KEY		     : in    std_logic_vector(0 downto 0);  
		  SW			  : in    std_logic_vector(17 downto 0); 
		  LEDR		  : out   std_logic_vector(7 downto 0);
		  AUD_ADCLRCK : inout std_logic; 
		  AUD_ADCDAT  : out   std_logic; 
		  AUD_DACLRCK : inout std_logic; 
		  AUD_DACDAT  : in    std_logic; 
	     AUD_BCLK    : inout std_logic; 
		  I2C_SCLK    : out   std_logic; 
	     I2C_SDAT    : inout std_logic);
end entity;

architecture rtl of audiovisualizer is

component nios_processor is
--	port(adc_sclk         				: out   std_logic;   
--		  adc_cs_n         			   : out   std_logic;       
--		  adc_dout        			   : in    std_logic := '0'; 
--		  adc_din          				: out   std_logic;        
	port(audio_ADCDAT    			   : in    std_logic := '0'; 
		  audio_ADCLRCK   			   : in    std_logic := '0'; 
		  audio_BCLK       				: in    std_logic := '0'; 
		  audio_DACDAT     			   : out   std_logic;        
		  audio_DACLRCK    			   : in    std_logic := '0'; 
		  audio_video_SDAT 				: inout std_logic := '0'; 
		  audio_video_SCLK 				: out   std_logic;       
		  clk_clk       					: in    std_logic := '0';   
		  reset_reset_n 					: in    std_logic := '0'); 
end component nios_processor;

	-- signals nios_processor
	signal reset_pin	    			  : std_logic; 
	signal cs, sclk 		 			  : std_logic;
	signal dout, din		 			  : std_logic;
	signal config_SDAT, config_SCLK : std_logic;

component ad_converter_i2c is
	port(SCL_line   : out   std_logic;
		  SDA_line   : inout std_logic; 
		  flag       : in    std_logic;
		  busy       : out   std_logic;
		  clock_50   : in    std_logic; 
		  address    : in    std_logic_vector(7 downto 0);   
		  data_frame : in    std_logic_vector(15 downto 0)); 
end component ad_converter_i2c;
	
	-- signals i2c component
	signal send_flag      : std_logic;
	signal is_busy        : std_logic;
	signal framed_data    : std_logic_vector(15 downto 0);

begin
		
	
	nios_ii : nios_processor port map (clk_clk => CLOCK_50, reset_reset_n => reset_pin, 
											  -- adc_sclk => sclk, adc_cs_n => cs, adc_dout => dout, adc_din => din, 
												  audio_ADCDAT => AUD_DACDAT, audio_DACDAT => AUD_ADCDAT,
												  audio_ADCLRCK => AUD_ADCLRCK, audio_DACLRCK => AUD_DACLRCK, audio_BCLK => AUD_BCLK,
												  audio_video_SDAT => I2C_SDAT,
												  audio_video_SCLK => I2C_SCLK);
	
	
--	audio_chip : ad_converter_i2c port map (SCL_line => I2C_SCLK, SDA_line => I2C_SDAT, flag => send_flag, busy => is_busy,
--														 clock_50 => CLOCK_50, address => "00110100", data_frame => framed_data);
	
	reset_pin <= KEY(0); 
	
--	process(CLOCK_50, reset_pin) 
--	begin	
--		if (rising_edge(CLOCK_50)) then 
--			case reset_pin is
--				when '1' => send_flag <= '0';
--				when others => null;
--			end case;
--		end if;
--		
--		-- [15:9] --> control address bits
--		-- [8:0]  --> control data bits
--		
--		if (rising_edge(CLOCK_50)) and is_busy = '0' then
--			if (SW(17) = '1') then -- enable ADC (audio aan)
--				framed_data(15 downto 9) <= "0000110";  
--				framed_data(8 downto 0) <= "000000111"; 		 			 
--				send_flag <= '1';
--			elsif (SW(16) = '1') then -- reset process (audio uit)
--				framed_data(15 downto 9) <= "0001111"; 
--				framed_data(8 downto 0) <= "000000000";						 
--				send_flag <= '1';
--			elsif (SW(15) = '1') then -- enable ADC high pass filter
--				framed_data(15 downto 9) <= "0000101"; 
--				framed_data(8 downto 0) <= "000000000";
--				send_flag <= '1';
--			elsif (SW(14) = '1') then -- slave mode 
--				framed_data(15 downto 9) <= "0000111";
--				framed_data(8 downto 0) <= "000010011";
--				send_flag <= '1';
--			elsif (SW(13) = '1') then -- headphone volume
--				framed_data(15 downto 9) <= "0000010";
--				framed_data(8 downto 0) <= "101111001";
--				send_flag <= '1';
--			elsif (SW(12) = '1') then -- USB mode
--				framed_data(15 downto 9) <= "0001000";
--				framed_data(8 downto 0) <= "000000001";
--				send_flag <= '1';
--			elsif (SW(11) = '1') then -- active interface
--				framed_data(15 downto 9) <= "0001001";
--				framed_data(8 downto 0) <= "111111111";
--			elsif (SW(10) = '1') then -- enable DAC
--				framed_data(15 downto 9) <= "0000100";
--				framed_data(8 downto 0) <= "000010010";
--				send_flag <= '1';
--			else 
--				null;
--			end if;
--		end if;
--	end process;
	
end architecture rtl;