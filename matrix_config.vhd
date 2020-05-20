library ieee;
use ieee.math_real.log2;
use ieee.math_real.ceil;
USE ieee.std_logic_1164.ALL;

package rgbmatrix is
    
    -- User configurable constants
    constant NUM_PANELS   : integer := 1; -- total number of LED matrix panels
    constant PIXEL_DEPTH  : integer := 8; -- number of bits per pixel
    
    -- Special constants (change these at your own risk, stuff might break!)
    constant PANEL_WIDTH  : integer := 64; -- width of the panel in pixels
    constant PANEL_HEIGHT : integer := 32; -- height of the panel in pixels
    constant DATA_WIDTH   : positive := PIXEL_DEPTH*6;
                                         -- one bit for each subpixel (3), times
                                         -- the number of simultaneous lines (2)
    
    -- Derived constants
    constant ADDR_WIDTH     : positive := positive(log2(real(NUM_PANELS*PANEL_WIDTH*PANEL_HEIGHT/2)));
    constant IMG_WIDTH      : positive := PANEL_WIDTH*NUM_PANELS;
    constant IMG_WIDTH_LOG2 : positive := positive(log2(real(IMG_WIDTH)));
	 
	-- colors
	constant OFF				 : std_logic_vector(23 downto 0) := "000000000000000000000000";	--led off / black
	constant BLUE				 : std_logic_vector(23 downto 0) := "000000000000000011111111";	
	constant LIME			 	 : std_logic_vector(23 downto 0) := "000000001111111100000000";	
	constant CYAN				 : std_logic_vector(23 downto 0) := "000000001111111111111111";	
	constant RED				 : std_logic_vector(23 downto 0) := "111111110000000000000000";	
	constant MAGENTA			 : std_logic_vector(23 downto 0) := "111111110000000011111111";	
	constant YELLOW				 : std_logic_vector(23 downto 0) := "111111111111111100000000";
	constant GREEN				 : std_logic_vector(23 downto 0) := "000000001000000000000000";
	constant WHITE		 	 	 : std_logic_vector(23 downto 0) := "111111111111111111111111";	--led shows white 
end rgbmatrix;
