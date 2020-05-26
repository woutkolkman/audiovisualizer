-- unnamed.vhd

-- Generated using ACDS version 16.1 203

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity unnamed is
	port (
		ADC_SCLK  : out std_logic;                            -- adc_signals.SCLK
		ADC_CS_N  : out std_logic;                            --            .CS_N
		ADC_SDAT  : in  std_logic                     := '0'; --            .SDAT
		ADC_SADDR : out std_logic;                            --            .SADDR
		CLOCK     : in  std_logic                     := '0'; --         clk.clk
		CH0       : out std_logic_vector(11 downto 0);        --    readings.CH0
		CH1       : out std_logic_vector(11 downto 0);        --            .CH1
		CH2       : out std_logic_vector(11 downto 0);        --            .CH2
		CH3       : out std_logic_vector(11 downto 0);        --            .CH3
		CH4       : out std_logic_vector(11 downto 0);        --            .CH4
		CH5       : out std_logic_vector(11 downto 0);        --            .CH5
		CH6       : out std_logic_vector(11 downto 0);        --            .CH6
		CH7       : out std_logic_vector(11 downto 0);        --            .CH7
		RESET     : in  std_logic                     := '0'  --       reset.reset
	);
end entity unnamed;

architecture rtl of unnamed is
	component unnamed_adc_mega_0 is
		generic (
			board     : string  := "DE1-SoC";
			board_rev : string  := "Autodetect";
			tsclk     : integer := 0;
			numch     : integer := 0
		);
		port (
			CLOCK     : in  std_logic                     := 'X'; -- clk
			RESET     : in  std_logic                     := 'X'; -- reset
			CH0       : out std_logic_vector(11 downto 0);        -- export
			CH1       : out std_logic_vector(11 downto 0);        -- export
			CH2       : out std_logic_vector(11 downto 0);        -- export
			CH3       : out std_logic_vector(11 downto 0);        -- export
			CH4       : out std_logic_vector(11 downto 0);        -- export
			CH5       : out std_logic_vector(11 downto 0);        -- export
			CH6       : out std_logic_vector(11 downto 0);        -- export
			CH7       : out std_logic_vector(11 downto 0);        -- export
			ADC_SCLK  : out std_logic;                            -- export
			ADC_CS_N  : out std_logic;                            -- export
			ADC_SDAT  : in  std_logic                     := 'X'; -- export
			ADC_SADDR : out std_logic                             -- export
		);
	end component unnamed_adc_mega_0;

begin

	adc_mega_0 : component unnamed_adc_mega_0
		generic map (
			board     => "DE1-SoC",
			board_rev => "Autodetect",
			tsclk     => 3,
			numch     => 0
		)
		port map (
			CLOCK     => CLOCK,     --         clk.clk
			RESET     => RESET,     --       reset.reset
			CH0       => CH0,       --    readings.export
			CH1       => CH1,       --            .export
			CH2       => CH2,       --            .export
			CH3       => CH3,       --            .export
			CH4       => CH4,       --            .export
			CH5       => CH5,       --            .export
			CH6       => CH6,       --            .export
			CH7       => CH7,       --            .export
			ADC_SCLK  => ADC_SCLK,  -- adc_signals.export
			ADC_CS_N  => ADC_CS_N,  --            .export
			ADC_SDAT  => ADC_SDAT,  --            .export
			ADC_SADDR => ADC_SADDR  --            .export
		);

end architecture rtl; -- of unnamed
