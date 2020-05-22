library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.rgbmatrix.all;

-- vhdl component om de frequency bands dynamisch (8) op de LED-matrix visueel weer te geven
entity frame_generator_dynamic is 
	GENERIC(BREEDTE 		: NATURAL := 64;
			  HOOGTE			: NATURAL := 32;
			  BITS_HOOGTE 	: NATURAL := 6;
			  BALKEN			: NATURAL := 8
			  );
	port(clock, reset   		  : in  std_logic;
		  addr_matrix	  		  : out std_logic_vector(ADDR_WIDTH - 1 downto 0);
		  data_matrix    		  : out std_logic_vector(DATA_WIDTH - 1 downto 0);
		  freq_sep1, freq_sep2 : in  std_logic_vector(23 downto 0)); --resultaat: 4*BITS_HOOGTE-1
end entity frame_generator_dynamic;

architecture rtl of frame_generator_dynamic is 
	
	signal address, next_address : std_logic_vector(ADDR_WIDTH - 1 downto 0);
	signal intaddr 				  : integer range 0 to 1023; --resultaat: BREEDTE * HOOGTE / (2 LEDs per keer)2 - (array start op 0)1
	
	--Kleur constant definition
	type KLEUREN_ARRAYS is array (0 TO BALKEN-1) of std_logic_vector(23 downto 0); --zelfde als kleurconstanten
	
	--Kleur volgorde van balken
	constant huidigekleur : KLEUREN_ARRAYS := (WHITE, BLUE, LIME, CYAN, RED, MAGENTA, YELLOW, WHITE);
	
	--Array voor hoogte elke balk
	type fs_balken is array (0 TO BALKEN-1) of unsigned(BITS_HOOGTE-1 downto 0);
	signal fs_data : fs_balken;
	
begin 

	addr_matrix <= address;
	intaddr <= to_integer(unsigned(address));
	
	--freq_sep1 en freq_sep2 data in array zetten voor makkelijk uitlezen
	G1: for i in 0 to 3 generate
		fs_data(i) <= unsigned(freq_sep1( 23-(i*BITS_HOOGTE) downto 18-(i*BITS_HOOGTE) ));
	end generate;
	G2: for i in 0 to 3 generate --nieuwe for-generate, anders wordt data overschreven
		fs_data(4+i) <= unsigned(freq_sep2( 23-(i*BITS_HOOGTE) downto 18-(i*BITS_HOOGTE) ));
	end generate;
	
	process(clock, reset)
	begin
		if (reset = '1') then
			 address <= (others => '0');
		elsif (rising_edge(clock)) then
			 address <= next_address;
		end if;
	end process;
  
	process(address, intaddr, fs_data)
		variable row, rest 						: integer range 15 downto 0; 						--aantal balken (7 downto 0) past in 4 bits (8 mogelijkheden)
		variable height, temp 					: integer range (2**BITS_HOOGTE)-1 downto 0; --hoogte van LED op huidige adres
		variable kleur_led_b, kleur_led_o 	: std_logic_vector(23 downto 0); 				--variabelen voor kleur bovenste LED & onderste LED
	begin
		kleur_led_b := (others => '0');
		kleur_led_o := (others => '0');
		row := 0;
		height := 0;
		temp := 0;
		rest := 0;
		
		--intaddr geeft het huidige adres van een LED aan, onderzoek waar dit adres zich bevind
		if (intaddr = 0) then
			row := 0;
			height := 0;
		else
			--verkrijg de hoogte (y-as)
			--trek de 'rest' van intaddr af zodat er naar beneden wordt afgerond
			--originele som: height := (intaddr - (intaddr mod BREEDTE)) / BREEDTE;
			temp := intaddr mod BREEDTE;
			if (temp = intaddr) then 			--niet door 0 delen, hoogte is 0
				height := 0;
			else
				height := (intaddr - temp) / BREEDTE;
			end if;
		
			--verkrijg de rij (x-as)
			temp := intaddr mod BREEDTE;
			if not(temp = 0) then
				--trek de 'rest' van row af zodat er naar beneden wordt afgerond
				--originele som: row := (row - (row mod BALKEN)) / BALKEN;
				rest := temp mod BALKEN;
				if rest = temp then --niet door 0 delen, rij is 0
					row := 0;
				else
					row := (temp - rest) / BALKEN;
				end if;
			--else row = eerste rij (0)
			end if;
		end if;
		
		data_matrix <= (OFF & OFF); --LED uitzetten
--		next_address <= address; --niet nodig?
		
		--aansturen LED met juiste data
		if (fs_data(row) >= (HOOGTE-(height + 16))) then	--onderste LED
			kleur_led_o := huidigekleur(row);
		else
			kleur_led_o := OFF;
		end if;
		if (fs_data(row) >= (HOOGTE-(height))) then		--bovenste LED
			kleur_led_b := huidigekleur(row);
		else
			kleur_led_b := OFF;
		end if;
		data_matrix <= (kleur_led_b & kleur_led_o);
		
		next_address <= std_logic_vector(unsigned(address) + 1); --naar volgende adres gaan
	end process;
end architecture rtl;
