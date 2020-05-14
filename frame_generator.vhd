library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--use ieee.std_logic_unsigned.all;
use work.rgbmatrix.all;
 
-- vhdl component om de frequency bands (8) op de LED-matrix visueel weer te geven
entity frame_generator is
   port(clock          : in std_logic;
        reset          : in std_logic;
        address_matrix : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
        data_matrix    : out std_logic_vector(DATA_WIDTH - 1 downto 0));
end entity frame_generator;
 
--architecture rtl of frame_generator is 
-- 
--    signal address, next_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
--    
--begin
-- 
--    address_matrix <= address;
--    
--    process(clock, reset)
--    begin
--            if (reset = '1') then
--                address <= (others => '0');
--            elsif (rising_edge(clock)) then
--                address <= next_address;
--            end if;
--    end process;
--    
--    process(address)
--    begin 
--        next_address <= address;
--        for i in 0 to 63 loop
--            for j in 1 to 8 loop
--                next_address <= std_logic_vector(unsigned(address) + i + j);
--                data_matrix <= (WHITE & WHITE);
--            end loop;
--        end loop;
--    end process;
--end architecture rtl;

architecture dot of frame_generator is

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
	signal address, next_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal intaddr : integer range 0 to 1023;
	signal count : natural;
	signal targetaddr : std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal countflag : integer range 0 to 63;
	signal flag : std_logic;
	
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
    
    process(address, intaddr, countflag)
    begin 
    next_address <= address;
		next_address <= std_logic_vector(unsigned(address) + 1);
				case intaddr is
					when 0 to countflag => data_matrix <= (OFF & WHITE);
					when 64 to 64 + countflag => data_matrix <= (OFF & RED);
					when 2*64 to 2*64 + countflag => data_matrix <= (OFF & LIME);
					when 3*64 to 3*64 + countflag => data_matrix <= (OFF & BLUE);
					when 4*64 to 4*64 + countflag => data_matrix <= (OFF & YELLOW);
					when others => data_matrix <= (CYAN & OFF);
				end case;
    end process;
	 flg : matrix_clkdivider
		generic map (
			in_freq => 50000000,		--50 MHz
			out_freq => 2		
		)
		port map (
			reset => reset,
			clk_in => clock,
			clk_out => flag
		);
		
		process(flag, reset)
		begin
				if (reset = '1') then
                countflag <= 0;
            elsif (rising_edge(flag)) then
					if countflag <= 63 then
						countflag <= countflag + 1;
					else
						countflag <= 0;
					end if;
            end if;
    end process;
end architecture dot;
	