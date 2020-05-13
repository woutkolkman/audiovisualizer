--matrix_datamemory is een component voor de matrix driver
--Dit component bevat een ram blokje.
--Hierin wordt data opgeslagen voor de aansturing van de matrix.
--De data die wordt geschreven, komt buiten de matrix_driver_top.
--Ook het adres, waar de data opgeslagen moet worden, komt van buitenaf.
--Op deze manier kan de driver / het component ledcontrol altijd bij de data van alle adressen.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use work.rgbmatrix.all;				--config bestand: bevat standaardwaarden en definities voor kleuren voor de matrix.

entity matrix_datamemory is
	port (
		reset : in std_logic;
		clock : in std_logic;
		data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
		address_read : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		address_in : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
		data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0);
		readready	: in std_logic
	);
end matrix_datamemory;

architecture behaviour of matrix_datamemory is

	signal s_address_write : std_logic_vector(ADDR_WIDTH-1 downto 0);			

	type ram is array(2**ADDR_WIDTH-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ramblck : ram;
	begin
	process(reset, clock, s_address_write, readready)
	begin
		if(reset = '1') then
			s_address_write <= (others => '0');
		elsif(rising_edge(clock)) then
			s_address_write <= address_in;
			ramblck(conv_integer(s_address_write)) <= data_in;			--op het adres in het ramblok wordt de data geschreven.
		end if;
		if(rising_edge(readready)) then
			data_out <= ramblck(conv_integer(address_read));			--De uitgaande data wordt gelezen uit het ramblok.
		end if;
	end process;
	
end architecture;