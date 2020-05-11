library ieee;
USE ieee.std_logic_1164.ALL;
use work.rgbmatrix.all;

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
			READYTOWRITE : in std_logic;
			RESETLED : out std_logic;
			PINSOUT		: OUT STD_LOGIC_VECTOR(12 downto 0)
		);
	end component;
	
	component matrix_frame is
	port(
		clk : in std_logic;
		reset : in std_logic;
		--data_in : in std_logic_vector(DATA_WIDTH-1 downto 0);
		--address_in : in std_logic_vector(ADDR_WIDTH-1 downto 0);
		data_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
		Address_out : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		ready : out std_logic
		);
	end component;
		
		signal reset : std_logic;
		signal tempData : std_logic_vector(DATA_WIDTH-1 downto 0);
		signal tempAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
		signal tempReady : std_logic;
	
	begin
		reset <= not KEY(0);
		
		matrixdriver : matrix_driver_top port map (
		CLOCK => CLOCK_50,
		RESET => reset,
		RESETLED => LEDG(0),
		PINSOUT => GPIO,
		DATA => tempData,
		ADDR => tempAddr,
		READYTOWRITE => tempReady
		);
		
		justexample : matrix_frame port map (
			clk => CLOCK_50,
			reset => reset,
			data_out => tempData,
			Address_out => tempAddr,
			ready => tempReady
		);
	end architecture;
			