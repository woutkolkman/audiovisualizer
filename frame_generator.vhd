library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rgbmatrix.all;
 
-- vhdl component om de frequency bands (8) op de LED-matrix visueel weer te geven
entity frame_generator is
   port(clock          : in std_logic;
        reset          : in std_logic;
        address_matrix : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
        data_matrix    : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end entity frame_generator;

architecture rtl of frame_generator is

	signal address, next_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal intaddr : integer range 0 to 1023;	
	
begin

	address_matrix <= address;
	intaddr <= to_integer(unsigned(address));
	
	process(clock, reset)
   begin
			if (reset = '1') then
				 address <= (others => '0');
			elsif (rising_edge(clock)) then
				 address <= next_address;
			end if;
 end process;
    
    process(address, intaddr)
    begin 
      next_address <= address;
			case intaddr is
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & WHITE);
				when 704 to 711 => data_matrix <= (OFF & WHITE);
				when 640 to 647 => data_matrix <= (OFF & WHITE);
				when 576 to 583 => data_matrix <= (OFF & WHITE);
				when 512 to 519 => data_matrix <= (OFF & WHITE);
				when 448 to 455 => data_matrix <= (OFF & WHITE);
				when 384 to 391 => data_matrix <= (OFF & WHITE);
				when 320 to 327 => data_matrix <= (OFF & WHITE);
				when 256 to 263 => data_matrix <= (OFF & WHITE);
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when 968 to 975 => data_matrix <= (OFF & YELLOW); -- 2/8 deel matrix
				when 976 to 983 => data_matrix <= (OFF & MAGENTA);
				when 984 to 991 => data_matrix <= (OFF & RED);
				when 992 to 999 => data_matrix <= (OFF & CYAN);
				when 1000 to 1007 => data_matrix <= (OFF & LIME);
				when 1008 to 1015 => data_matrix <= (OFF & BLUE);
				when 1016 to 1023 => data_matrix <= (OFF & GREEN);
				when others => data_matrix <= (OFF & OFF);
			end case;
			next_address <= std_logic_vector(unsigned(address) + 1);
    end process;
end architecture rtl;