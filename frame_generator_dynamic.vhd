library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rgbmatrix.all;

-- vhdl component om de frequency bands dynamisch (8) op de LED-matrix visueel weer te geven
entity frame_generator_dynamic is 
	port(clock, reset   		  : in  std_logic;
		  addr_matrix	  		  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
		  data_matrix    		  : out std_logic_vector(DATA_WIDTH - 1 downto 0);
		  freq_sep1, freq_sep2 : in  std_logic_vector(23 downto 0));
end entity frame_generator_dynamic;

architecture rtl of frame_generator_dynamic is 
	
	signal address, next_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal intaddr 				  : integer range 0 to 1023;
	
begin 

	addr_matrix <= address;
	intaddr <= to_integer(unsigned(address));
	
	process(clock, reset)
   begin
		if (reset = '1') then
			 address <= (others => '0');
		elsif (rising_edge(clock)) then
			 address <= next_address;
		end if;
  end process;
  
  process(address, intaddr, freq_sep1, freq_sep2)
  begin 
		data_matrix <= (OFF & OFF);
		next_address <= address;
		if (freq_sep1(23 downto 18) = "100000") then -- als hoogte 32 is --> hele 1/8 deel
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011111") then -- als hoogte 31 is 
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
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011110") then -- als hoogte 30 is 
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
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011101") then -- als hoogte 29 is
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
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011100") then -- als hoogte 28 is 
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
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011011") then -- als hoogte 27 is 
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
				when 256 to 263 => data_matrix <= (OFF & WHITE);
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011010") then -- als hoogte 26 is 
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
				when 320 to 327 => data_matrix <= (OFF & WHITE);
				when 256 to 263 => data_matrix <= (OFF & WHITE);
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011001") then -- als hoogte 25 is 
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
				when 384 to 391 => data_matrix <= (OFF & WHITE);
				when 320 to 327 => data_matrix <= (OFF & WHITE);
				when 256 to 263 => data_matrix <= (OFF & WHITE);
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "011000") then -- als hoogte 24 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
				when 768 to 775 => data_matrix <= (WHITE & WHITE);
				when 704 to 711 => data_matrix <= (WHITE & WHITE);
				when 640 to 647 => data_matrix <= (WHITE & WHITE);
				when 576 to 583 => data_matrix <= (WHITE & WHITE);
				when 512 to 519 => data_matrix <= (WHITE & WHITE);
				when 448 to 455 => data_matrix <= (OFF & WHITE);
				when 384 to 391 => data_matrix <= (OFF & WHITE);
				when 320 to 327 => data_matrix <= (OFF & WHITE);
				when 256 to 263 => data_matrix <= (OFF & WHITE);
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010111") then -- als hoogte 23 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
				when 768 to 775 => data_matrix <= (WHITE & WHITE);
				when 704 to 711 => data_matrix <= (WHITE & WHITE);
				when 640 to 647 => data_matrix <= (WHITE & WHITE);
				when 576 to 583 => data_matrix <= (WHITE & WHITE);
				when 512 to 519 => data_matrix <= (OFF & WHITE);
				when 448 to 455 => data_matrix <= (OFF & WHITE);
				when 384 to 391 => data_matrix <= (OFF & WHITE);
				when 320 to 327 => data_matrix <= (OFF & WHITE);
				when 256 to 263 => data_matrix <= (OFF & WHITE);
				when 192 to 199 => data_matrix <= (OFF & WHITE);
				when 128 to 135 => data_matrix <= (OFF & WHITE);
				when 64 to 71 => data_matrix <= (OFF & WHITE);
				when 0 to 7 => data_matrix <= (OFF & WHITE);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010110") then -- als hoogte 22 is
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
				when 768 to 775 => data_matrix <= (WHITE & WHITE);
				when 704 to 711 => data_matrix <= (WHITE & WHITE);
				when 640 to 647 => data_matrix <= (WHITE & WHITE);
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010101") then -- als hoogte 21 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
				when 768 to 775 => data_matrix <= (WHITE & WHITE);
				when 704 to 711 => data_matrix <= (WHITE & WHITE);
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010100") then -- als hoogte 20 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
				when 768 to 775 => data_matrix <= (WHITE & WHITE);
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010011") then -- als hoogte 19 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
				when 832 to 839 => data_matrix <= (WHITE & WHITE);
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010010") then -- als hoogte 18 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (WHITE & WHITE);
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010001") then -- als hoogte 17 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (WHITE & WHITE); -- 1/8 deel matrix 
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "010000") then -- als hoogte 16 is 
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
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001111") then -- als hoogte 15 is 
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
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001110") then -- als hoogte 14 is 
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
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001101") then -- als hoogte 13 is 
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
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001100") then -- als hoogte 12 is 
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
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001011") then -- als hoogte 11 is 
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
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001010") then -- als hoogte 10 is 
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
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001001") then -- als hoogte 9 is 
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
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "001000") then -- als hoogte 8 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & WHITE);
				when 704 to 711 => data_matrix <= (OFF & WHITE);
				when 640 to 647 => data_matrix <= (OFF & WHITE);
				when 576 to 583 => data_matrix <= (OFF & WHITE);
				when 512 to 519 => data_matrix <= (OFF & WHITE);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000111") then -- als hoogte 7 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & WHITE);
				when 704 to 711 => data_matrix <= (OFF & WHITE);
				when 640 to 647 => data_matrix <= (OFF & WHITE);
				when 576 to 583 => data_matrix <= (OFF & WHITE);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000110") then -- als hoogte 6 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & WHITE);
				when 704 to 711 => data_matrix <= (OFF & WHITE);
				when 640 to 647 => data_matrix <= (OFF & WHITE);
				when 576 to 583 => data_matrix <= (OFF & OFF);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000101") then -- als hoogte 5 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & WHITE);
				when 704 to 711 => data_matrix <= (OFF & WHITE);
				when 640 to 647 => data_matrix <= (OFF & OFF);
				when 576 to 583 => data_matrix <= (OFF & OFF);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000100") then -- als hoogte 4 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & WHITE);
				when 704 to 711 => data_matrix <= (OFF & OFF);
				when 640 to 647 => data_matrix <= (OFF & OFF);
				when 576 to 583 => data_matrix <= (OFF & OFF);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000011") then -- als hoogte 3 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & WHITE);
				when 768 to 775 => data_matrix <= (OFF & OFF);
				when 704 to 711 => data_matrix <= (OFF & OFF);
				when 640 to 647 => data_matrix <= (OFF & OFF);
				when 576 to 583 => data_matrix <= (OFF & OFF);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000010") then -- als hoogte 2
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & WHITE);
				when 832 to 839 => data_matrix <= (OFF & OFF);
				when 768 to 775 => data_matrix <= (OFF & OFF);
				when 704 to 711 => data_matrix <= (OFF & OFF);
				when 640 to 647 => data_matrix <= (OFF & OFF);
				when 576 to 583 => data_matrix <= (OFF & OFF);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(23 downto 18) = "000001") then -- als hoogte 1 is 
			case intaddr is 
				when 960 to 967 => data_matrix <= (OFF & WHITE); -- 1/8 deel matrix 
				when 896 to 903 => data_matrix <= (OFF & OFF);
				when 832 to 839 => data_matrix <= (OFF & OFF);
				when 768 to 775 => data_matrix <= (OFF & OFF);
				when 704 to 711 => data_matrix <= (OFF & OFF);
				when 640 to 647 => data_matrix <= (OFF & OFF);
				when 576 to 583 => data_matrix <= (OFF & OFF);
				when 512 to 519 => data_matrix <= (OFF & OFF);
				when 448 to 455 => data_matrix <= (OFF & OFF);
				when 384 to 391 => data_matrix <= (OFF & OFF);
				when 320 to 327 => data_matrix <= (OFF & OFF);
				when 256 to 263 => data_matrix <= (OFF & OFF);
				when 192 to 199 => data_matrix <= (OFF & OFF);
				when 128 to 135 => data_matrix <= (OFF & OFF);
				when 64 to 71 => data_matrix <= (OFF & OFF);
				when 0 to 7 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
		
		if (freq_sep1(17 downto 12) = "100000") then -- 32
			case intaddr is 
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
				when 8 to 15 => data_matrix <= (BLUE & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011111") then -- 31
			case intaddr is 
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
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011110") then -- 30
			case intaddr is 
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
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011101") then -- 29
			case intaddr is 
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
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011100") then -- 28 
			case intaddr is 
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
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011011") then -- 27
			case intaddr is 
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
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011010") then -- 26
			case intaddr is 
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
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011001") then -- 25
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (BLUE & BLUE);
				when 648 to 655 => data_matrix <= (BLUE & BLUE);
				when 584 to 591 => data_matrix <= (BLUE & BLUE);
				when 520 to 527 => data_matrix <= (BLUE & BLUE);
				when 456 to 463 => data_matrix <= (BLUE & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "011000") then -- 24 
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (BLUE & BLUE);
				when 648 to 655 => data_matrix <= (BLUE & BLUE);
				when 584 to 591 => data_matrix <= (BLUE & BLUE);
				when 520 to 527 => data_matrix <= (BLUE & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010111") then -- 23
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (BLUE & BLUE);
				when 648 to 655 => data_matrix <= (BLUE & BLUE);
				when 584 to 591 => data_matrix <= (BLUE & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010110") then -- 22
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (BLUE & BLUE);
				when 648 to 655 => data_matrix <= (BLUE & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010101") then -- 21
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (BLUE & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010100") then -- 20
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (BLUE & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010011") then -- 19
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (BLUE & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010010") then -- 18
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (BLUE & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010001") then -- 17
			case intaddr is 
				when 968 to 975 => data_matrix <= (BLUE & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "010000") then -- 16
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & BLUE);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001111") then -- 15
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & BLUE);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001110") then -- 14
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & BLUE);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001101") then -- 13 
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & BLUE);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001100") then -- 12
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & BLUE);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001011") then -- 11
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & BLUE);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001010") then -- 10
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & BLUE);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001001") then -- 9
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & BLUE);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "001000") then -- 8
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & BLUE);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000111") then -- 7
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & BLUE);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000110") then -- 6
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & BLUE);
				when 584 to 591 => data_matrix <= (OFF & OFF);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000101") then -- 5
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & BLUE);
				when 648 to 655 => data_matrix <= (OFF & OFF);
				when 584 to 591 => data_matrix <= (OFF & OFF);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000100") then -- 4
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & BLUE);
				when 712 to 719 => data_matrix <= (OFF & OFF);
				when 648 to 655 => data_matrix <= (OFF & OFF);
				when 584 to 591 => data_matrix <= (OFF & OFF);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000011") then -- 3
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & BLUE);
				when 776 to 783 => data_matrix <= (OFF & OFF);
				when 712 to 719 => data_matrix <= (OFF & OFF);
				when 648 to 655 => data_matrix <= (OFF & OFF);
				when 584 to 591 => data_matrix <= (OFF & OFF);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000010") then -- 2
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & BLUE);
				when 840 to 847 => data_matrix <= (OFF & OFF);
				when 776 to 783 => data_matrix <= (OFF & OFF);
				when 712 to 719 => data_matrix <= (OFF & OFF);
				when 648 to 655 => data_matrix <= (OFF & OFF);
				when 584 to 591 => data_matrix <= (OFF & OFF);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(17 downto 12) = "000001") then -- 1
			case intaddr is 
				when 968 to 975 => data_matrix <= (OFF & BLUE); -- 2/8 deel matrix											
				when 904 to 911 => data_matrix <= (OFF & OFF);
				when 840 to 847 => data_matrix <= (OFF & OFF);
				when 776 to 783 => data_matrix <= (OFF & OFF);
				when 712 to 719 => data_matrix <= (OFF & OFF);
				when 648 to 655 => data_matrix <= (OFF & OFF);
				when 584 to 591 => data_matrix <= (OFF & OFF);
				when 520 to 527 => data_matrix <= (OFF & OFF);
				when 456 to 463 => data_matrix <= (OFF & OFF);
				when 392 to 399 => data_matrix <= (OFF & OFF);
				when 328 to 335 => data_matrix <= (OFF & OFF);
				when 264 to 271 => data_matrix <= (OFF & OFF);
				when 200 to 207 => data_matrix <= (OFF & OFF);
				when 136 to 143 => data_matrix <= (OFF & OFF);
				when 72 to 79 => data_matrix <= (OFF & OFF);
				when 8 to 15 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
	
		if (freq_sep1(11 downto 6) = "100000") then -- 32
			case intaddr is
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
				when 16 to 23 => data_matrix <= (LIME & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011111") then -- 31
			case intaddr is
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
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011110") then -- 30
			case intaddr is
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
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011101") then -- 29
			case intaddr is
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
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011100") then -- 28
			case intaddr is
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
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011011") then -- 27
			case intaddr is
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
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011010") then -- 26
			case intaddr is
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
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011001") then -- 25
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (LIME & LIME);
				when 656 to 663 => data_matrix <= (LIME & LIME);
				when 592 to 599 => data_matrix <= (LIME & LIME);
				when 528 to 535 => data_matrix <= (LIME & LIME);
				when 464 to 471 => data_matrix <= (LIME & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "011000") then -- 24
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (LIME & LIME);
				when 656 to 663 => data_matrix <= (LIME & LIME);
				when 592 to 599 => data_matrix <= (LIME & LIME);
				when 528 to 535 => data_matrix <= (LIME & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010111") then -- 23
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (LIME & LIME);
				when 656 to 663 => data_matrix <= (LIME & LIME);
				when 592 to 599 => data_matrix <= (LIME & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010110") then -- 22
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (LIME & LIME);
				when 656 to 663 => data_matrix <= (LIME & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010101") then -- 21
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (LIME & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010100") then -- 20
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (LIME & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010111") then -- 19
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (LIME & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010010") then -- 18
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (LIME & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010001") then -- 17
			case intaddr is
				when 976 to 983 => data_matrix <= (LIME & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "010000") then -- 16
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & LIME);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001111") then -- 15
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & LIME);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001110") then -- 14
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & LIME);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001101") then -- 13
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & LIME);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001100") then -- 12
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & LIME);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001011") then -- 11
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & LIME);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001010") then -- 10
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & LIME);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001001") then -- 9
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & LIME);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "001000") then -- 8
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & LIME);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000111") then -- 7
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & LIME);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000110") then -- 6
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & LIME);
				when 592 to 599 => data_matrix <= (OFF & OFF);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000101") then -- 5
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & LIME);
				when 656 to 663 => data_matrix <= (OFF & OFF);
				when 592 to 599 => data_matrix <= (OFF & OFF);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000100") then -- 4
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & LIME);
				when 720 to 727 => data_matrix <= (OFF & OFF);
				when 656 to 663 => data_matrix <= (OFF & OFF);
				when 592 to 599 => data_matrix <= (OFF & OFF);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000011") then -- 3
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & LIME);
				when 784 to 791 => data_matrix <= (OFF & OFF);
				when 720 to 727 => data_matrix <= (OFF & OFF);
				when 656 to 663 => data_matrix <= (OFF & OFF);
				when 592 to 599 => data_matrix <= (OFF & OFF);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000010") then -- 2
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & LIME);
				when 848 to 855 => data_matrix <= (OFF & OFF);
				when 784 to 791 => data_matrix <= (OFF & OFF);
				when 720 to 727 => data_matrix <= (OFF & OFF);
				when 656 to 663 => data_matrix <= (OFF & OFF);
				when 592 to 599 => data_matrix <= (OFF & OFF);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(11 downto 6) = "000001") then -- 1
			case intaddr is
				when 976 to 983 => data_matrix <= (OFF & LIME); -- 3/8 deel matrix 
				when 912 to 919 => data_matrix <= (OFF & OFF);
				when 848 to 855 => data_matrix <= (OFF & OFF);
				when 784 to 791 => data_matrix <= (OFF & OFF);
				when 720 to 727 => data_matrix <= (OFF & OFF);
				when 656 to 663 => data_matrix <= (OFF & OFF);
				when 592 to 599 => data_matrix <= (OFF & OFF);
				when 528 to 535 => data_matrix <= (OFF & OFF);
				when 464 to 471 => data_matrix <= (OFF & OFF);
				when 400 to 407 => data_matrix <= (OFF & OFF);
				when 336 to 343 => data_matrix <= (OFF & OFF);
				when 272 to 279 => data_matrix <= (OFF & OFF);
				when 208 to 215 => data_matrix <= (OFF & OFF);
				when 144 to 151 => data_matrix <= (OFF & OFF);
				when 80 to 87 => data_matrix <= (OFF & OFF);
				when 16 to 23 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
		
		if (freq_sep1(5 downto 0) = "100000") then -- 32
			case intaddr is 
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
				when 24 to 31 => data_matrix <= (RED & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011111") then -- 31
			case intaddr is 
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
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011110") then -- 30
			case intaddr is 
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
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011101") then -- 29
			case intaddr is 
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
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011100") then -- 28
			case intaddr is 
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
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011011") then -- 27
			case intaddr is 
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
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011010") then -- 26
			case intaddr is 
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
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011001") then -- 25
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (RED & RED);
				when 664 to 671 => data_matrix <= (RED & RED);
				when 600 to 607 => data_matrix <= (RED & RED);
				when 536 to 543 => data_matrix <= (RED & RED);
				when 472 to 479 => data_matrix <= (RED & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "011000") then -- 24
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (RED & RED);
				when 664 to 671 => data_matrix <= (RED & RED);
				when 600 to 607 => data_matrix <= (RED & RED);
				when 536 to 543 => data_matrix <= (RED & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010111") then -- 23
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (RED & RED);
				when 664 to 671 => data_matrix <= (RED & RED);
				when 600 to 607 => data_matrix <= (RED & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010110") then -- 22 
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (RED & RED);
				when 664 to 671 => data_matrix <= (RED & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010101") then -- 21
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (RED & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010100") then -- 20
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (RED & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010011") then -- 19
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (RED & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010010") then -- 18
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (RED & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010001") then -- 17
			case intaddr is 
				when 984 to 991 => data_matrix <= (RED & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "010000") then -- 16
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & RED);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001111") then -- 15
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & RED);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001110") then -- 14
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & RED);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001101") then -- 13
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & RED);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001100") then -- 12
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & RED);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001011") then -- 11
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & RED);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001010") then -- 10
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & RED);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001001") then -- 9
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & RED);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "001000") then -- 8
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & RED);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000111") then -- 7
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & RED);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000110") then -- 6
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & RED);
				when 600 to 607 => data_matrix <= (OFF & OFF);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000101") then -- 5
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & RED);
				when 664 to 671 => data_matrix <= (OFF & OFF);
				when 600 to 607 => data_matrix <= (OFF & OFF);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000100") then -- 4
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & RED);
				when 728 to 735 => data_matrix <= (OFF & OFF);
				when 664 to 671 => data_matrix <= (OFF & OFF);
				when 600 to 607 => data_matrix <= (OFF & OFF);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000011") then -- 3
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & RED);
				when 792 to 799 => data_matrix <= (OFF & OFF);
				when 728 to 735 => data_matrix <= (OFF & OFF);
				when 664 to 671 => data_matrix <= (OFF & OFF);
				when 600 to 607 => data_matrix <= (OFF & OFF);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000010") then -- 2
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & RED);
				when 856 to 863 => data_matrix <= (OFF & OFF);
				when 792 to 799 => data_matrix <= (OFF & OFF);
				when 728 to 735 => data_matrix <= (OFF & OFF);
				when 664 to 671 => data_matrix <= (OFF & OFF);
				when 600 to 607 => data_matrix <= (OFF & OFF);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep1(5 downto 0) = "000001") then -- 1
			case intaddr is 
				when 984 to 991 => data_matrix <= (OFF & RED); -- 4/8 deel matrix
				when 920 to 927 => data_matrix <= (OFF & OFF);
				when 856 to 863 => data_matrix <= (OFF & OFF);
				when 792 to 799 => data_matrix <= (OFF & OFF);
				when 728 to 735 => data_matrix <= (OFF & OFF);
				when 664 to 671 => data_matrix <= (OFF & OFF);
				when 600 to 607 => data_matrix <= (OFF & OFF);
				when 536 to 543 => data_matrix <= (OFF & OFF);
				when 472 to 479 => data_matrix <= (OFF & OFF);
				when 408 to 415 => data_matrix <= (OFF & OFF);
				when 344 to 351 => data_matrix <= (OFF & OFF);
				when 280 to 287 => data_matrix <= (OFF & OFF);
				when 216 to 223 => data_matrix <= (OFF & OFF);
				when 152 to 159 => data_matrix <= (OFF & OFF);
				when 88 to 95 => data_matrix <= (OFF & OFF);
				when 24 to 31 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
		
		if (freq_sep2(23 downto 18) = "100000") then -- 32
			case intaddr is 
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
				when 32 to 39 => data_matrix <= (CYAN & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011111") then -- 31
			case intaddr is 
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
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011110") then -- 30
			case intaddr is 
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
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011101") then -- 29
			case intaddr is 
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
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011100") then -- 28
			case intaddr is 
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
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011011") then -- 27
			case intaddr is 
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
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011010") then -- 26
			case intaddr is 
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
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011001") then -- 25
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (CYAN & CYAN);
				when 672 to 679 => data_matrix <= (CYAN & CYAN);
				when 608 to 615 => data_matrix <= (CYAN & CYAN);
				when 544 to 551 => data_matrix <= (CYAN & CYAN);
				when 480 to 487 => data_matrix <= (CYAN & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "011000") then -- 24
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (CYAN & CYAN);
				when 672 to 679 => data_matrix <= (CYAN & CYAN);
				when 608 to 615 => data_matrix <= (CYAN & CYAN);
				when 544 to 551 => data_matrix <= (CYAN & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010111") then -- 23
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (CYAN & CYAN);
				when 672 to 679 => data_matrix <= (CYAN & CYAN);
				when 608 to 615 => data_matrix <= (CYAN & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010110") then -- 22
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (CYAN & CYAN);
				when 672 to 679 => data_matrix <= (CYAN & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010101") then -- 21
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (CYAN & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010100") then -- 20
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (CYAN & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010011") then -- 19
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (CYAN & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010010") then -- 18
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (CYAN & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010001") then -- 17
			case intaddr is 
				when 992 to 999 => data_matrix <= (CYAN & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "010000") then -- 16
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & CYAN);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001111") then -- 15
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & CYAN);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001110") then -- 14
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & CYAN);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001101") then -- 13
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & CYAN);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001100") then -- 12
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & CYAN);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001011") then -- 11
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & CYAN);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001010") then -- 10
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & CYAN);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001001") then -- 9
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & CYAN);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "001000") then -- 8
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & CYAN);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000111") then -- 7
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & CYAN);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000110") then -- 6
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & CYAN);
				when 608 to 615 => data_matrix <= (OFF & OFF);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000101") then -- 5
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & CYAN);
				when 672 to 679 => data_matrix <= (OFF & OFF);
				when 608 to 615 => data_matrix <= (OFF & OFF);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000100") then -- 4
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & CYAN);
				when 736 to 743 => data_matrix <= (OFF & OFF);
				when 672 to 679 => data_matrix <= (OFF & OFF);
				when 608 to 615 => data_matrix <= (OFF & OFF);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000011") then -- 3
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & CYAN);
				when 800 to 807 => data_matrix <= (OFF & OFF);
				when 736 to 743 => data_matrix <= (OFF & OFF);
				when 672 to 679 => data_matrix <= (OFF & OFF);
				when 608 to 615 => data_matrix <= (OFF & OFF);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000010") then -- 2
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & CYAN);
				when 864 to 871 => data_matrix <= (OFF & OFF);
				when 800 to 807 => data_matrix <= (OFF & OFF);
				when 736 to 743 => data_matrix <= (OFF & OFF);
				when 672 to 679 => data_matrix <= (OFF & OFF);
				when 608 to 615 => data_matrix <= (OFF & OFF);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(23 downto 18) = "000001") then -- 1
			case intaddr is 
				when 992 to 999 => data_matrix <= (OFF & CYAN); -- 5/8 deel matrix
				when 928 to 935 => data_matrix <= (OFF & OFF);
				when 864 to 871 => data_matrix <= (OFF & OFF);
				when 800 to 807 => data_matrix <= (OFF & OFF);
				when 736 to 743 => data_matrix <= (OFF & OFF);
				when 672 to 679 => data_matrix <= (OFF & OFF);
				when 608 to 615 => data_matrix <= (OFF & OFF);
				when 544 to 551 => data_matrix <= (OFF & OFF);
				when 480 to 487 => data_matrix <= (OFF & OFF);
				when 416 to 423 => data_matrix <= (OFF & OFF);
				when 352 to 359 => data_matrix <= (OFF & OFF);
				when 288 to 295 => data_matrix <= (OFF & OFF);
				when 224 to 231 => data_matrix <= (OFF & OFF);
				when 160 to 167 => data_matrix <= (OFF & OFF);
				when 96 to 103 => data_matrix <= (OFF & OFF);
				when 32 to 39 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
		
		if (freq_sep2(17 downto 12) = "100000") then -- 32
		    case intaddr is 
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
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011111") then -- 31
			case intaddr is 
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
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011110") then -- 30
			case intaddr is 
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
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011101") then -- 29
			case intaddr is 
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
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011100") then -- 28
			case intaddr is 
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
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011011") then -- 27
			case intaddr is 
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
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011010") then -- 26
			case intaddr is 
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
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011001") then -- 25
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (YELLOW & YELLOW);
				when 680 to 687 => data_matrix <= (YELLOW & YELLOW);
				when 616 to 623 => data_matrix <= (YELLOW & YELLOW);
				when 552 to 559 => data_matrix <= (YELLOW & YELLOW);
				when 488 to 495 => data_matrix <= (YELLOW & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "011000") then -- 24
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (YELLOW & YELLOW);
				when 680 to 687 => data_matrix <= (YELLOW & YELLOW);
				when 616 to 623 => data_matrix <= (YELLOW & YELLOW);
				when 552 to 559 => data_matrix <= (YELLOW & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010111") then -- 23
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (YELLOW & YELLOW);
				when 680 to 687 => data_matrix <= (YELLOW & YELLOW);
				when 616 to 623 => data_matrix <= (YELLOW & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010110") then -- 22
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (YELLOW & YELLOW);
				when 680 to 687 => data_matrix <= (YELLOW & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010101") then -- 21
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (YELLOW & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010100") then -- 20
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (YELLOW & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010011") then -- 19
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (YELLOW & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010010") then -- 18
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (YELLOW & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010001") then -- 17
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (YELLOW & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "010000") then -- 16
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & YELLOW);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001111") then -- 15
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & YELLOW);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001110") then -- 14
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & YELLOW);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001101") then -- 13
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & YELLOW);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001100") then -- 12
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & YELLOW);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001011") then -- 11
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & YELLOW);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001010") then -- 10
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & YELLOW);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001001") then -- 9
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & YELLOW);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "001000") then -- 8
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & YELLOW);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000111") then -- 7
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & YELLOW);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000110") then -- 6
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & YELLOW);
				when 616 to 623 => data_matrix <= (OFF & OFF);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000101") then -- 5
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & YELLOW);
				when 680 to 687 => data_matrix <= (OFF & OFF);
				when 616 to 623 => data_matrix <= (OFF & OFF);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000100") then -- 4
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & YELLOW);
				when 744 to 751 => data_matrix <= (OFF & OFF);
				when 680 to 687 => data_matrix <= (OFF & OFF);
				when 616 to 623 => data_matrix <= (OFF & OFF);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000011") then -- 3
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & YELLOW);
				when 808 to 815 => data_matrix <= (OFF & OFF);
				when 744 to 751 => data_matrix <= (OFF & OFF);
				when 680 to 687 => data_matrix <= (OFF & OFF);
				when 616 to 623 => data_matrix <= (OFF & OFF);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000010") then -- 2
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & YELLOW);
				when 872 to 879 => data_matrix <= (OFF & OFF);
				when 808 to 815 => data_matrix <= (OFF & OFF);
				when 744 to 751 => data_matrix <= (OFF & OFF);
				when 680 to 687 => data_matrix <= (OFF & OFF);
				when 616 to 623 => data_matrix <= (OFF & OFF);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(17 downto 12) = "000001") then -- 1
			case intaddr is 
				when 1000 to 1007 => data_matrix <= (OFF & YELLOW); -- 6/8 deel matrix
				when 936 to 943 => data_matrix <= (OFF & OFF);
				when 872 to 879 => data_matrix <= (OFF & OFF);
				when 808 to 815 => data_matrix <= (OFF & OFF);
				when 744 to 751 => data_matrix <= (OFF & OFF);
				when 680 to 687 => data_matrix <= (OFF & OFF);
				when 616 to 623 => data_matrix <= (OFF & OFF);
				when 552 to 559 => data_matrix <= (OFF & OFF);
				when 488 to 495 => data_matrix <= (OFF & OFF);
				when 424 to 431 => data_matrix <= (OFF & OFF);
				when 360 to 367 => data_matrix <= (OFF & OFF);
				when 296 to 303 => data_matrix <= (OFF & OFF);
				when 232 to 239 => data_matrix <= (OFF & OFF);
				when 168 to 175 => data_matrix <= (OFF & OFF);
				when 104 to 111 => data_matrix <= (OFF & OFF);
				when 40 to 47 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
		
		if (freq_sep2(11 downto 6) = "100000") then -- 32
			case intaddr is 
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
				when 48 to 55 => data_matrix <= (MAGENTA & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011111") then -- 31
			case intaddr is 
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
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011110") then -- 30
			case intaddr is 
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
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011101") then -- 29
			case intaddr is 
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
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011100") then -- 28
			case intaddr is 
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
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011011") then -- 27
			case intaddr is 
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
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011010") then -- 26
			case intaddr is 
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
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011001") then -- 25
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (MAGENTA & MAGENTA);
				when 688 to 695 => data_matrix <= (MAGENTA & MAGENTA);
				when 624 to 631 => data_matrix <= (MAGENTA & MAGENTA);
				when 560 to 567 => data_matrix <= (MAGENTA & MAGENTA);
				when 496 to 503 => data_matrix <= (MAGENTA & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "011000") then -- 24
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (MAGENTA & MAGENTA);
				when 688 to 695 => data_matrix <= (MAGENTA & MAGENTA);
				when 624 to 631 => data_matrix <= (MAGENTA & MAGENTA);
				when 560 to 567 => data_matrix <= (MAGENTA & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010111") then -- 23
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (MAGENTA & MAGENTA);
				when 688 to 695 => data_matrix <= (MAGENTA & MAGENTA);
				when 624 to 631 => data_matrix <= (MAGENTA & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010110") then -- 22
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (MAGENTA & MAGENTA);
				when 688 to 695 => data_matrix <= (MAGENTA & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010101") then -- 21
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (MAGENTA & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010100") then -- 20
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (MAGENTA & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010011") then -- 19
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (MAGENTA & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010010") then -- 18
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (MAGENTA & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010001") then -- 17
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (MAGENTA & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "010000") then -- 16
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & MAGENTA);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001111") then -- 15
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & MAGENTA);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001110") then -- 14
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & MAGENTA);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001101") then -- 13
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & MAGENTA);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001100") then -- 12
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & MAGENTA);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001011") then -- 11
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & MAGENTA);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001010") then -- 10
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & MAGENTA);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001001") then -- 9
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & MAGENTA);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "001000") then -- 8
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & MAGENTA);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000111") then -- 7
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & MAGENTA);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000110") then -- 6
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & MAGENTA);
				when 624 to 631 => data_matrix <= (OFF & OFF);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000101") then -- 5
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & MAGENTA);
				when 688 to 695 => data_matrix <= (OFF & OFF);
				when 624 to 631 => data_matrix <= (OFF & OFF);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000100") then -- 4
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & MAGENTA);
				when 752 to 759 => data_matrix <= (OFF & OFF);
				when 688 to 695 => data_matrix <= (OFF & OFF);
				when 624 to 631 => data_matrix <= (OFF & OFF);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000011") then -- 3
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & MAGENTA);
				when 816 to 823 => data_matrix <= (OFF & OFF);
				when 752 to 759 => data_matrix <= (OFF & OFF);
				when 688 to 695 => data_matrix <= (OFF & OFF);
				when 624 to 631 => data_matrix <= (OFF & OFF);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000010") then -- 2
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & MAGENTA);
				when 880 to 887 => data_matrix <= (OFF & OFF);
				when 816 to 823 => data_matrix <= (OFF & OFF);
				when 752 to 759 => data_matrix <= (OFF & OFF);
				when 688 to 695 => data_matrix <= (OFF & OFF);
				when 624 to 631 => data_matrix <= (OFF & OFF);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		elsif (freq_sep2(11 downto 6) = "000001") then -- 1
			case intaddr is 
				when 1008 to 1015 => data_matrix <= (OFF & MAGENTA); -- 7/8 deel matrix
				when 944 to 951 => data_matrix <= (OFF & OFF);
				when 880 to 887 => data_matrix <= (OFF & OFF);
				when 816 to 823 => data_matrix <= (OFF & OFF);
				when 752 to 759 => data_matrix <= (OFF & OFF);
				when 688 to 695 => data_matrix <= (OFF & OFF);
				when 624 to 631 => data_matrix <= (OFF & OFF);
				when 560 to 567 => data_matrix <= (OFF & OFF);
				when 496 to 503 => data_matrix <= (OFF & OFF);
				when 432 to 439 => data_matrix <= (OFF & OFF);
				when 368 to 375 => data_matrix <= (OFF & OFF);
				when 304 to 311 => data_matrix <= (OFF & OFF);
				when 240 to 247 => data_matrix <= (OFF & OFF);
				when 176 to 183 => data_matrix <= (OFF & OFF);
				when 112 to 119 => data_matrix <= (OFF & OFF);
				when 48 to 55 => data_matrix <= (OFF & OFF);
				when others => null;
			end case;
		end if;
		
		if (freq_sep2(5 downto 0) = "100000") then -- 32
			case intaddr is 
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
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011111") then -- 31
			case intaddr is 
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
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011110") then -- 30
			case intaddr is 
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
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011101") then -- 29
			case intaddr is 
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
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011100") then -- 28
			case intaddr is 
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
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011011") then -- 27
			case intaddr is 
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
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011010") then -- 26
			case intaddr is 
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
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011001") then -- 25
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (WHITE & WHITE);
				when 696 to 703 => data_matrix <= (WHITE & WHITE);
				when 632 to 639 => data_matrix <= (WHITE & WHITE);
				when 568 to 575 => data_matrix <= (WHITE & WHITE);
				when 504 to 511 => data_matrix <= (WHITE & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "011000") then -- 24
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (WHITE & WHITE);
				when 696 to 703 => data_matrix <= (WHITE & WHITE);
				when 632 to 639 => data_matrix <= (WHITE & WHITE);
				when 568 to 575 => data_matrix <= (WHITE & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010111") then -- 23
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (WHITE & WHITE);
				when 696 to 703 => data_matrix <= (WHITE & WHITE);
				when 632 to 639 => data_matrix <= (WHITE & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010110") then -- 22
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (WHITE & WHITE);
				when 696 to 703 => data_matrix <= (WHITE & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010101") then -- 21
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (WHITE & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010100") then -- 20
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (WHITE & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010011") then -- 19
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (WHITE & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010010") then -- 18
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (WHITE & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010001") then -- 17
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (WHITE & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "010000") then -- 16
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & WHITE);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001111") then -- 15
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & WHITE);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001110") then -- 14
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & WHITE);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001101") then -- 13
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & WHITE);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001100") then -- 12
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & WHITE);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001011") then -- 11
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & WHITE);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001010") then -- 10
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & WHITE);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001001") then -- 9
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & WHITE);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "001000") then -- 8
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & WHITE);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000111") then -- 7
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & WHITE);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000110") then -- 6
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & WHITE);
				when 632 to 639 => data_matrix <= (OFF & OFF);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000101") then -- 5
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & WHITE);
				when 696 to 703 => data_matrix <= (OFF & OFF);
				when 632 to 639 => data_matrix <= (OFF & OFF);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000100") then -- 4
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & WHITE);
				when 760 to 767 => data_matrix <= (OFF & OFF);
				when 696 to 703 => data_matrix <= (OFF & OFF);
				when 632 to 639 => data_matrix <= (OFF & OFF);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000011") then -- 3
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & WHITE);
				when 824 to 831 => data_matrix <= (OFF & OFF);
				when 760 to 767 => data_matrix <= (OFF & OFF);
				when 696 to 703 => data_matrix <= (OFF & OFF);
				when 632 to 639 => data_matrix <= (OFF & OFF);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000010") then -- 2
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & WHITE);
				when 888 to 895 => data_matrix <= (OFF & OFF);
				when 824 to 831 => data_matrix <= (OFF & OFF);
				when 760 to 767 => data_matrix <= (OFF & OFF);
				when 696 to 703 => data_matrix <= (OFF & OFF);
				when 632 to 639 => data_matrix <= (OFF & OFF);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		elsif (freq_sep2(5 downto 0) = "000001") then -- 1
			case intaddr is 
				when 1016 to 1023 => data_matrix <= (OFF & WHITE); -- 8/8 deel van matrix
				when 952 to 959 => data_matrix <= (OFF & OFF);
				when 888 to 895 => data_matrix <= (OFF & OFF);
				when 824 to 831 => data_matrix <= (OFF & OFF);
				when 760 to 767 => data_matrix <= (OFF & OFF);
				when 696 to 703 => data_matrix <= (OFF & OFF);
				when 632 to 639 => data_matrix <= (OFF & OFF);
				when 568 to 575 => data_matrix <= (OFF & OFF);
				when 504 to 511 => data_matrix <= (OFF & OFF);
				when 440 to 447 => data_matrix <= (OFF & OFF);
				when 376 to 383 => data_matrix <= (OFF & OFF);
				when 312 to 319 => data_matrix <= (OFF & OFF);
				when 248 to 255 => data_matrix <= (OFF & OFF);
				when 184 to 191 => data_matrix <= (OFF & OFF);
				when 120 to 127 => data_matrix <= (OFF & OFF);
				when 56 to 63 => data_matrix <= (OFF & OFF);  --
				when others => null;
			end case;
		end if;
		next_address <= std_logic_vector(unsigned(address) + 1);
  end process;
end architecture rtl;
