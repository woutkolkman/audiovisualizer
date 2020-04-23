library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity matrix_clkdivider is

	generic (
		in_freq : natural;
		out_freq : natural
	);
	port(
		clk_in : in std_logic;
		reset : in std_logic;
		clk_out : out std_logic
	);
end matrix_clkdivider;

architecture behaviour of matrix_clkdivider is
	constant maxvalue : integer := (in_freq / out_freq) - 1;
begin
	process(clk_in, reset)
		variable count : integer range 0 to maxvalue;
	begin
		if(reset = '1') then
			count := 0;
			clk_out <= '0';
		elsif(rising_edge(clk_in)) then
			if(count = maxvalue) then
				count := 0;
			else	
				count := count+1;
			end if;
			if(count > maxvalue/2) then
				clk_out <= '1';
			else
				clk_out <= '0';
			end if;
		end if;
	end process;
end architecture;