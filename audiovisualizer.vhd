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
	
		signal reset : std_logic;
		signal tempData : std_logic_vector(DATA_WIDTH-1 downto 0);
		signal tempAddr : std_logic_vector(ADDR_WIDTH-1 downto 0);
	
	component frame_generator is
	port(clock : in std_logic;
		  reset : in std_logic;
		  data_matrix : out std_logic_vector(DATA_WIDTH-1 downto 0);
		  address_matrix : out std_logic_vector(ADDR_WIDTH-1 downto 0));
	end component;
	
	component frame_generator_dynamic is 
		port(clock, reset   		  : in  std_logic;
			  addr_matrix	  		  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
			  data_matrix    		  : out std_logic_vector(DATA_WIDTH - 1 downto 0);
			  freq_sep1, freq_sep2 : in  std_logic_vector(23 downto 0));
	end component frame_generator_dynamic;
	
		signal freq_sep_one, freq_sep_two : std_logic_vector(23 downto 0);
	
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
		
		dynamic : frame_generator_dynamic port map (clock => CLOCK_50, reset => reset, addr_matrix => tempAddr, data_matrix => tempData,
																  freq_sep1(23 downto 18) => "010100", freq_sep1(17 downto 12) => "011111", 
																  freq_sep1(11 downto 6) => "010000", 
																  freq_sep2 => freq_sep_two);
		
--		justexample : frame_generator port map (
--			clock => CLOCK_50,
--			reset => reset,
--			data_matrix => tempData,
--			Address_matrix => tempAddr);
end architecture;
			