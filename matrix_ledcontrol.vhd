library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rgbmatrix.all;

entity matrix_ledcontrol is
    port (
		clk_in 		: in std_logic;
		reset 		: in std_logic;
		
		clk_out 		: out std_logic;
		rgb1_out		: out std_logic_vector(2 downto 0);
		rgb2_out		: out std_logic_vector(2 downto 0);
		ledaddr_out : out std_logic_vector(3 downto 0);
		lat_out 		: out std_logic;
		oe_out 		: out std_logic;
		addr     	: out std_logic_vector(ADDR_WIDTH-1 downto 0);
      data     	: in  std_logic_vector(DATA_WIDTH-1 downto 0)
      );
end matrix_ledcontrol;

architecture behaviour of matrix_ledcontrol is


	signal rgb1, next_rgb1 : std_logic_vector(2 downto 0);
	signal rgb2, next_rgb2 : std_logic_vector(2 downto 0);
	signal ledaddr, next_ledaddr : std_logic_vector(3 downto 0);
	signal ramaddr, next_ramaddr :  std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal column, next_column : unsigned(IMG_WIDTH_LOG2 downto 0);
	signal bpp, next_bpp : unsigned(PIXEL_DEPTH-1 downto 0);
	signal lat : std_logic;
	signal oe : std_logic;

	type state_type is (INIT, READ_DATA, SRAMADDR, SLEDADDR, LATCH);
	signal state, next_state : state_type;

	begin
	
	clk_out <= clk_in;
	rgb1_out <= rgb1;
	rgb2_out <= rgb2;
	ledaddr_out <= ledaddr;
	addr <= ramaddr;
	lat_out <= lat;
	oe_out <= oe;
	
	process(reset, clk_in)
	
	
	begin
		if(reset = '1') then
			state <= INIT;
			column <= (others => '0');
			bpp <= (others => '0');
			ledaddr <= (others => '1');		--is used after latch, so will be incremented to 0
			ramaddr <= (others => '0');
			rgb1 <= (others => '0');
			rgb2 <= (others => '0');
		elsif(rising_edge(clk_in)) then
			state <= next_state;
			column <= next_column;
			bpp <= next_bpp;
			ledaddr <= next_ledaddr;
			ramaddr <= next_ramaddr;
			rgb1 <= next_rgb1;
			rgb2 <= next_rgb2;
		end if;
	end process;
	
	process(state, column, bpp, ledaddr, ramaddr, rgb1, rgb2, data) is
		variable upper, lower : unsigned(DATA_WIDTH/2-1 downto 0);
      variable upper_r, upper_g, upper_b : unsigned(PIXEL_DEPTH-1 downto 0);
      variable lower_r, lower_g, lower_b : unsigned(PIXEL_DEPTH-1 downto 0);
      variable r1, g1, b1, r2, g2, b2 : std_logic;
	
	begin
	
		r1 := '0'; g1 := '0'; b1 := '0';
		r2 := '0'; g2 := '0'; b2 := '0';
	
	next_column <= column;
	next_bpp <= bpp;
	next_ledaddr <= ledaddr;
	next_ramaddr <= ramaddr;
	next_rgb1 <= rgb1;
	next_rgb2 <= rgb2;
	
	lat <= '0';
	oe <= '1';		--active low
	
	case state is
		when INIT =>
			if(ledaddr = "1111") then
				if(bpp =  unsigned (to_unsigned(-2, PIXEL_DEPTH))) then
					next_bpp <= (others => '0');
				else
					next_bpp <= bpp + 1;
				end if;
			end if;
			next_state <= READ_DATA;
		when READ_DATA =>
			oe <=  '0';
			if(upper_r > bpp) then
				r1 := '1';
				
			end if;
			if(upper_g > bpp) then
				g1 := '1';
				
			end if;
			if(upper_b > bpp) then
				b1 := '1';
				
			end if;
			if(lower_r > bpp) then
				r2 := '1';
			end if;
			if(lower_g > bpp) then
				g2 := '1';
			end if;
			if(lower_b > bpp) then
				b2 := '1';
			end if;
			next_column <= column + 1;
			if(column < PANEl_WIDTH) then
				next_state <= SRAMADDR;
			else
				next_state <= SLEDADDR;
			end if;
			
		when SRAMADDR =>
			oe <= '0';
			next_ramaddr <= std_logic_vector( unsigned(ramaddr) + 1 );
			next_state <= READ_DATA;
		when SLEDADDR =>
			next_ledaddr <= std_logic_vector(unsigned(ledaddr)+1);
			next_column <= (others => '0');
			next_state <= LATCH;
			
		when LATCH =>
			lat <= '1';
			next_state <= INIT;
		when others => NULL;
	end case;
		upper := unsigned(data(DATA_WIDTH-1 downto DATA_WIDTH/2));
      lower := unsigned(data(DATA_WIDTH/2-1 downto 0));
      upper_r := upper(3*PIXEL_DEPTH-1 downto 2*PIXEL_DEPTH);
      upper_g := upper(2*PIXEL_DEPTH-1 downto   PIXEL_DEPTH);
      upper_b := upper(  PIXEL_DEPTH-1 downto 0);
      lower_r := lower(3*PIXEL_DEPTH-1 downto 2*PIXEL_DEPTH);
      lower_g := lower(2*PIXEL_DEPTH-1 downto   PIXEL_DEPTH);
      lower_b := lower(  PIXEL_DEPTH-1 downto 0);
      next_rgb1 <= r1 & g1 & b1;
      next_rgb2 <= r2 & g2 & b2;
	end process;
		
end architecture;

