library ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use work.rgbmatrix.all;	--config bestand: bevat standaardwaarden en definities voor kleuren voor de matrix.

entity matrix_frame is
	port(
		clk : in std_logic;
		reset : in std_logic;
		--data_in : in std_logic_vector(DATA_WIDTH-1 downto 0);
		--address_in : in std_logic_vector(ADDR_WIDTH-1 downto 0);
		data_out : out std_logic_vector(DATA_WIDTH-1 downto 0);
		Address_out : out std_logic_vector(ADDR_WIDTH-1 downto 0)
		);
end entity;

architecture behaviour of matrix_frame is 
		signal address, next_address : std_logic_vector(addr_width-1 downto 0);
		
	begin
	
		Address_out <= address;
		process(clk, reset)
			begin
			
			if(reset = '1') then
				address <= (others => '0');
			elsif(rising_edge(clk)) then
				address <= next_address;
				
			end if;
		end process;
	process(address) 
		begin
			
			next_address <= address;
			if (address = "0000000000") then
					data_out <= (WHITE & WHITE);
					next_address <= std_logic_vector(unsigned(address)+1);
			elsif (address = "0000000001") then
				data_out <= (OFF & BLUE);
				next_address <= std_logic_vector(unsigned(address)+1);
				elsif (address = "0000000010") then
				data_out <= (CYAN & BLUE);
				next_address <= std_logic_vector(unsigned(address)+1);
				elsif (address = "0000000011") then
				data_out <= (OFF & LIME);
				next_address <= std_logic_vector(unsigned(address)+1);
				elsif (address = "0000010001") then
				data_out <= (OFF & MAGENTA);
				next_address <= std_logic_vector(unsigned(address)+1);
				elsif (address = "0010001101") then
				data_out <= (RED & OFF);
				next_address <= std_logic_vector(unsigned(address)+1);
				elsif (address = "0000001010") then
				data_out <= (OFF & YELLOW);
				next_address <= std_logic_vector(unsigned(address)+1);
				else
					data_out <= (OFF & OFF);
					next_address <= std_logic_vector(unsigned(address)+1);
					
				end if;
			end process;
	end architecture;
	