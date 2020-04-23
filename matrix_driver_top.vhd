library ieee;
USE ieee.std_logic_1164.ALL;
use work.rgbmatrix.all;

entity matrix_driver_top is
	port(
		CLOCK_50	:IN STD_LOGIC;
		KEY	: in std_logic_vector(1 downto 0);
		SW		: in std_logic_vector(17 downto 0);
		LEDR : out std_logic_vector(17 downto 0);
		LEDG : out std_logic_vector(0 downto 0);
		GPIO		: OUT STD_LOGIC_VECTOR(12 downto 0)
		);
end entity;

architecture behaviour of matrix_driver_top is

	signal addr : std_logic_vector(ADDR_WIDTH-1 downto 0);
   signal data_incoming : std_logic_vector(DATA_WIDTH-1 downto 0);
   signal data_outgoing : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal reset : std_logic;
	signal devidedclk25 : std_logic;
	
	component matrix_clkdivider is
		generic (
			in_freq : natural;			
			out_freq : natural			
		);
		
		port (
			clk_in : in std_logic;
			reset : in std_logic;
			clk_out : out std_logic
		);
	end component;
	
	
	component matrix_ledcontrol is
		port (
		clk_in 			: in std_logic;
		reset 			: in std_logic;
		
		clk_out 			: out std_logic;
		rgb1_out			: out std_logic_vector(2 downto 0);
		rgb2_out			: out std_logic_vector(2 downto 0);
		ledaddr_out 	: out std_logic_vector(3 downto 0);
		lat_out 			: out std_logic;
		oe_out 			: out std_logic;
		addr     		: out std_logic_vector(ADDR_WIDTH-1 downto 0);
      data     		: in  std_logic_vector(DATA_WIDTH-1 downto 0)
        );
	end component;
	
	begin
	ledr <= sw;
	
	reset <= not KEY(0);
	ledg(0) <= reset;																	--
	data_outgoing(DATA_WIDTH - 1 downto 18) <= (others => '1');
	data_outgoing(17 downto 0) <= sw;
	clk : matrix_clkdivider 
		generic map (
			in_freq => 50000000,
			out_freq => 25000000
		)
		port map (
			clk_in => CLOCK_50,
			reset => reset,
			clk_out => devidedclk25
		);
	
	matrix : matrix_ledcontrol port map(
		clk_in => devidedclk25,
		reset => reset,
		clk_out => GPIO(10),			--clk
		rgb1_out(0) => GPIO(2),		--b1
		rgb1_out(1) => GPIO(0),		--g1
		rgb1_out(2) => GPIO(1),		--r1
		rgb2_out(0) => GPIO(5),		--b2
		rgb2_out(1) => GPIO(4),		--g2
		rgb2_out(2) => GPIO(3),		--r2
		ledaddr_out(0) => GPIO(6),	--a
		ledaddr_out(1) => GPIO(7),	--b
		ledaddr_out(2) => GPIO(8),	--c
		ledaddr_out(3) => GPIO(9),	--d
		lat_out => GPIO(11),			--lat
		oe_out => GPIO(12),			--oe
		
		addr => addr,
		data => data_outgoing
		);
			
end architecture;