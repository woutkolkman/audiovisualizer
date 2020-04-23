library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity audiovisualizer is
	port(
		  CLOCK_50 : in std_logic;							--voor clock
		  KEY		  : in std_logic_vector(3 downto 0)	--voor reset
		 );
end entity;

architecture gedrag of audiovisualizer is

	component nios_processor is
		port (
			adc_0_external_interface_sclk : out std_logic;        --voor ADC
			adc_0_external_interface_cs_n : out std_logic;        --voor ADC
			adc_0_external_interface_dout : in  std_logic := '0'; --voor ADC
			adc_0_external_interface_din  : out std_logic;        --voor ADC
			clk_clk                       : in  std_logic := '0'; --clk
			reset_reset_n                 : in  std_logic := '0'  --reset
		);
	end component;
	
	signal tijdelijk : std_logic;

begin
	NiosII : nios_processor PORT MAP(
		clk_clk => CLOCK_50,
		reset_reset_n => KEY(0),
		adc_0_external_interface_sclk => tijdelijk,
		adc_0_external_interface_cs_n => tijdelijk,
		adc_0_external_interface_dout => KEY(0), --moet naar fft?
		adc_0_external_interface_din => tijdelijk --komt vanaf audio-jack?
	);
end architecture;