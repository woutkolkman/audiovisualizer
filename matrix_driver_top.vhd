--Matrix_driver_top is de toplevel van de driver.
--Deze verbind een paar componenten (ledcontrol en memory) aan elkaar, zodat de matrix kan worden aangestuurd

library ieee;
USE ieee.std_logic_1164.ALL;
use work.rgbmatrix.all;	--config bestand: bevat standaardwaarden en definities voor kleuren voor de matrix.

entity matrix_driver_top is
	port(
		CLOCK	:IN STD_LOGIC;			
		RESET	: in std_logic;
		DATA : in std_logic_vector(DATA_WIDTH-1 downto 0);
		ADDR : in std_logic_vector(ADDR_WIDTH-1 downto 0);
		RESETLED : out std_logic;								--led om te tonen dat de reset 1 is
		PINSOUT		: OUT STD_LOGIC_VECTOR(12 downto 0)
		);
end entity;

architecture behaviour of matrix_driver_top is

	signal s_addr : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal data_incoming : std_logic_vector(DATA_WIDTH-1 downto 0);	--ingaande data
	signal data_outgoing : std_logic_vector(DATA_WIDTH-1 downto 0);	--uitgaande data
	signal readready : std_logic;													--flag wanneer klaar om te lezen
	
	component matrix_ledcontrol is												--leest data uit en geeft deze weer op de matrix
		port (
			clk_in 			: in std_logic;
			reset 			: in std_logic;
			clk_out 		: out std_logic;
			rgb1_out		: out std_logic_vector(2 downto 0);
			rgb2_out		: out std_logic_vector(2 downto 0);
			ledaddr_out 	: out std_logic_vector(3 downto 0);
			lat_out 		: out std_logic;
			oe_out 			: out std_logic;
			addr     		: out std_logic_vector(ADDR_WIDTH-1 downto 0);
			data     		: in  std_logic_vector(DATA_WIDTH-1 downto 0);
			readready		: out std_logic
        );
	end component;
	
	component matrix_datamemory is												--bevat geheugenblok om data in op te slaan
		port (
			reset : in std_logic;
			clock : in std_logic;
			data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
			address_read : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
			address_in : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
			data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
			readready	: in std_logic
	);
	end component;
	
	begin
	
	RESETLED <= reset;
	data_incoming <= DATA;					--ingaande data wordt op data_incoming gezet
		
	memory : matrix_datamemory port map(
		reset => reset,
		clock => CLOCK,
		data_in => data_incoming,
		address_read => s_addr,
		address_in => ADDR,
		data_out => data_outgoing,
		readready => readready
	);		
	
	matrix : matrix_ledcontrol port map(
		clk_in => CLOCK,
		reset => reset,
		clk_out => PINSOUT(10),			--clk
		rgb1_out(0) => PINSOUT(2),		--b1
		rgb1_out(1) => PINSOUT(0),		--g1
		rgb1_out(2) => PINSOUT(1),		--r1
		rgb2_out(0) => PINSOUT(5),		--b2
		rgb2_out(1) => PINSOUT(4),		--g2
		rgb2_out(2) => PINSOUT(3),		--r2
		ledaddr_out(0) => PINSOUT(6),	--a
		ledaddr_out(1) => PINSOUT(7),	--b
		ledaddr_out(2) => PINSOUT(8),	--c
		ledaddr_out(3) => PINSOUT(9),	--d
		lat_out => PINSOUT(11),			--lat
		oe_out => PINSOUT(12),			--oe
		addr => s_addr,
		data => data_outgoing,
		readready => readready
		);
end architecture;