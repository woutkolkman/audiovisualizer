library ieee;
USE ieee.std_logic_1164.ALL;
use work.rgbmatrix.all;		--config bestand: bevat standaardwaarden en definities voor kleuren voor de matrix.

entity audiovisualizer is
	port(
		CLOCK_50	:IN STD_LOGIC;
		KEY	: in std_logic_vector(0 downto 0);
		LEDG : out std_logic_vector(0 downto 0);
		GPIO : out std_logic_vector(12 downto 0)
	);
end entity;

architecture behaviour of audiovisualizer is

	component matrix_driver_top is
		port(
			CLOCK	:IN STD_LOGIC;
			RESET	: in std_logic;
			DATA : in std_logic_vector(DATA_WIDTH-1 downto 0);
			ADDR : in std_logic_vector(ADDR_WIDTH-1 downto 0);
			RESETLED : out std_logic;
			PINSOUT		: OUT STD_LOGIC_VECTOR(12 downto 0)
		);
	end component;
	
	component frame_generator is
	port(
		clock : in std_logic;
		reset : in std_logic;
		data_matrix : out std_logic_vector(DATA_WIDTH-1 downto 0);
		Address_matrix : out std_logic_vector(ADDR_WIDTH-1 downto 0)
		);
	end component;
	
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
		
		signal reset : std_logic;
		signal tempData : std_logic_vector(DATA_WIDTH-1 downto 0);
		signal tempAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
		
		signal tijdelijk : std_logic;
	
	begin
		reset <= not KEY(0);
		
		matrixdriver : matrix_driver_top port map (
		CLOCK => CLOCK_50,
		RESET => reset,
		RESETLED => LEDG(0),
		PINSOUT => GPIO,
		DATA => tempData,
		ADDR => tempAddr
		);
		
--		justexample : frame_generator port map (
--			clock => CLOCK_50,
--			reset => reset,
--			data_matrix => tempData,
--			Address_matrix => tempAddr
--		);
		
		NiosII : nios_processor PORT MAP(
			clk_clk => CLOCK_50,
			reset_reset_n => KEY(0),
			adc_0_external_interface_sclk => tijdelijk,
			adc_0_external_interface_cs_n => tijdelijk,
			adc_0_external_interface_dout => KEY(0), --moet naar fft?
			adc_0_external_interface_din => tijdelijk --komt vanaf audio-jack?
		);
end architecture;
			