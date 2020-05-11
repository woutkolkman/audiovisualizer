library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.rgbmatrix.all;

entity matrix_frame is
	port(
		clk : in std_logic;
		reset : in std_logic;
		--data_in : in std_logic_vector(DATA_WIDTH-1 downto 0);
		--address_in : in std_logic_vector(ADDR_WIDTH-1 downto 0);
		data_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
		Address_out : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		ready : out std_logic
		);
end entity;

architecture behaviour of matrix_frame is 
		signal address, next_address : std_logic_vector(addr_width-1 downto 0);
		
	begin
	
		Address_out <= address;
		process(clk, reset, next_address)
			begin
			
				
			address <= next_address;
			
			if(reset = '1') then
				address <= (others => '0');
				ready <= '0';
				data_out <= (OFF & OFF);
			elsif(rising_edge(clk)) then
				ready <= '0';
				if (address = "0000000000") then
					data_out <= (WHITE & WHITE);
					ready <= '1';
					next_address <= std_logic_vector(unsigned(address)+1);
				else
					data_out <= (RED & RED);
					ready <= '1';
					next_address <= std_logic_vector(unsigned(address)+1);
					
				end if;
			end if;
		end process;
	end architecture;
	