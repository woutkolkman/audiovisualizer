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

architecture rtl of frame_generator is

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
<<<<<<< HEAD
	signal intaddr : integer range 0 to 1023;
	signal count : natural;
	signal targetaddr : std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal countflag : integer range 0 to 63;
	signal flag : std_logic;
=======
	signal intaddr : integer range 0 to 1023;	
>>>>>>> 36ef12eb490a0a1ec35ae410f765fc47725025bd
	
begin

	address_matrix <= address;
	intaddr <= to_integer(unsigned(address));
<<<<<<< HEAD

=======
	
>>>>>>> 36ef12eb490a0a1ec35ae410f765fc47725025bd
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
			case intaddr is
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
				when 768 to 775 => data_matrix <= (WHITE & WHITE);
				when 704 to 711 => data_matrix <= (WHITE & WHITE);
				when 640 to 647 => data_matrix <= (WHITE & WHITE);
				when 576 to 583 => data_matrix <= (WHITE & WHITE);
				when 512 to 519 => data_matrix <= (WHITE & WHITE);
				when 448 to 455 => data_matrix <= (WHITE & WHITE);
				when 384 to 391 => data_matrix <= (WHITE & WHITE);
				when 320 to 327 => data_matrix <= (WHITE & WHITE);
				when 256 to 263 => data_matrix <= (WHITE & WHITE);
				when 192 to 199 => data_matrix <= (WHITE & WHITE);
				when 128 to 135 => data_matrix <= (WHITE & WHITE);
				when 64 to 71 => data_matrix <= (WHITE & WHITE);
				when 0 to 7 => data_matrix <= (WHITE & WHITE);
																-- 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (BLUE & BLUE);
				when 648 to 655 => data_matrix <= (BLUE & BLUE);
				when 584 to 591 => data_matrix <= (BLUE & BLUE);
				when 520 to 527 => data_matrix <= (BLUE & BLUE);
				when 456 to 463 => data_matrix <= (BLUE & BLUE);
				when 392 to 399 => data_matrix <= (BLUE & BLUE);
				when 328 to 335 => data_matrix <= (BLUE & BLUE);
				when 264 to 271 => data_matrix <= (BLUE & BLUE);
				when 200 to 207 => data_matrix <= (BLUE & BLUE);
				when 136 to 143 => data_matrix <= (BLUE & BLUE);
				when 72 to 79 => data_matrix <= (BLUE & BLUE);
				when 8 to 15 => data_matrix <= (BLUE & BLUE);    -- 
				
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (LIME & LIME);
				when 656 to 663 => data_matrix <= (LIME & LIME);
				when 592 to 599 => data_matrix <= (LIME & LIME);
				when 528 to 535 => data_matrix <= (LIME & LIME);
				when 464 to 471 => data_matrix <= (LIME & LIME);
				when 400 to 407 => data_matrix <= (LIME & LIME);
				when 336 to 343 => data_matrix <= (LIME & LIME);
				when 272 to 279 => data_matrix <= (LIME & LIME);
				when 208 to 215 => data_matrix <= (LIME & LIME);
				when 144 to 151 => data_matrix <= (LIME & LIME);
				when 80 to 87 => data_matrix <= (LIME & LIME);
				when 16 to 23 => data_matrix <= (LIME & LIME);  -- 
				
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (RED & RED);
				when 664 to 671 => data_matrix <= (RED & RED);
				when 600 to 607 => data_matrix <= (RED & RED);
				when 536 to 543 => data_matrix <= (RED & RED);
				when 472 to 479 => data_matrix <= (RED & RED);
				when 408 to 415 => data_matrix <= (RED & RED);
				when 344 to 351 => data_matrix <= (RED & RED);
				when 280 to 287 => data_matrix <= (RED & RED);
				when 216 to 223 => data_matrix <= (RED & RED);
				when 152 to 159 => data_matrix <= (RED & RED);
				when 88 to 95 => data_matrix <= (RED & RED);
				when 24 to 31 => data_matrix <= (RED & RED);  -- 
				
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (CYAN & CYAN);
				when 672 to 679 => data_matrix <= (CYAN & CYAN);
				when 608 to 615 => data_matrix <= (CYAN & CYAN);
				when 544 to 551 => data_matrix <= (CYAN & CYAN);
				when 480 to 487 => data_matrix <= (CYAN & CYAN);
				when 416 to 423 => data_matrix <= (CYAN & CYAN);
				when 352 to 359 => data_matrix <= (CYAN & CYAN);
				when 288 to 295 => data_matrix <= (CYAN & CYAN);
				when 224 to 231 => data_matrix <= (CYAN & CYAN);
				when 160 to 167 => data_matrix <= (CYAN & CYAN);
				when 96 to 103 => data_matrix <= (CYAN & CYAN);
				when 32 to 39 => data_matrix <= (CYAN & CYAN);  -- 
				
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (YELLOW & YELLOW);
				when 680 to 687 => data_matrix <= (YELLOW & YELLOW);
				when 616 to 623 => data_matrix <= (YELLOW & YELLOW);
				when 552 to 559 => data_matrix <= (YELLOW & YELLOW);
				when 488 to 495 => data_matrix <= (YELLOW & YELLOW);
				when 424 to 431 => data_matrix <= (YELLOW & YELLOW);
				when 360 to 367 => data_matrix <= (YELLOW & YELLOW);
				when 296 to 303 => data_matrix <= (YELLOW & YELLOW);
				when 232 to 239 => data_matrix <= (YELLOW & YELLOW);
				when 168 to 175 => data_matrix <= (YELLOW & YELLOW);
				when 104 to 111 => data_matrix <= (YELLOW & YELLOW);
				when 40 to 47 => data_matrix <= (YELLOW & YELLOW);
				
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (MAGENTA & MAGENTA);
				when 688 to 695 => data_matrix <= (MAGENTA & MAGENTA);
				when 624 to 631 => data_matrix <= (MAGENTA & MAGENTA);
				when 560 to 567 => data_matrix <= (MAGENTA & MAGENTA);
				when 496 to 503 => data_matrix <= (MAGENTA & MAGENTA);
				when 432 to 439 => data_matrix <= (MAGENTA & MAGENTA);
				when 368 to 375 => data_matrix <= (MAGENTA & MAGENTA);
				when 304 to 311 => data_matrix <= (MAGENTA & MAGENTA);
				when 240 to 247 => data_matrix <= (MAGENTA & MAGENTA);
				when 176 to 183 => data_matrix <= (MAGENTA & MAGENTA);
				when 112 to 119 => data_matrix <= (MAGENTA & MAGENTA);
				when 48 to 55 => data_matrix <= (MAGENTA & MAGENTA);  -- 
				
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (WHITE & WHITE);
				when 696 to 703 => data_matrix <= (WHITE & WHITE);
				when 632 to 639 => data_matrix <= (WHITE & WHITE);
				when 568 to 575 => data_matrix <= (WHITE & WHITE);
				when 504 to 511 => data_matrix <= (WHITE & WHITE);
				when 440 to 447 => data_matrix <= (WHITE & WHITE);
				when 376 to 383 => data_matrix <= (WHITE & WHITE);
				when 312 to 319 => data_matrix <= (WHITE & WHITE);
				when 248 to 255 => data_matrix <= (WHITE & WHITE);
				when 184 to 191 => data_matrix <= (WHITE & WHITE);
				when 120 to 127 => data_matrix <= (WHITE & WHITE);
				when 56 to 63 => data_matrix <= (WHITE & WHITE);  --
				when others => data_matrix <= (OFF & OFF);	  
			end case;
			next_address <= std_logic_vector(unsigned(address) + 1);
    end process;
end architecture rtl;