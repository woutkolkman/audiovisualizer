-- i2c configuration: om de FPGA te laten communiceren met de audio chip (WM8731) wordt er gebruikgemaakt van het I2C protocol
-- er wordt gebruikgemaakt van een statemachine die kijkt naar de statussen van de start- en stopcondities, de data transmissies van het adres en data frames en ACK/NACK bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ad_converter_i2c is
	port(SCL_line   : out   std_logic;
		  SDA_line   : inout std_logic; -- inout: deze port is bi-directioneel; je kunt zowel lezen als schrijven
		  flag       : in    std_logic;
		  busy       : out   std_logic;
		  done       : out   std_logic;
		  clock_50   : in    std_logic; -- i2c met zijn eigen clock van 50 MHz
		  address    : in    std_logic_vector(7 downto 0);   -- het adres bedraagt 8 bits 
		  data_frame : in    std_logic_vector(15 downto 0)); -- data frame bestaat uit 16 bits 
end entity ad_converter_i2c;

architecture rtl of ad_converter_i2c is

	signal i2c_clock_enable : std_logic := '0';
	signal i2c_clock        : std_logic := '0';
	signal clock_enable     : std_logic := '0';
	signal clock_counter    : integer range 0 to 300 := 0;
	signal ack_enable       : std_logic := '0';
	signal get_ack          : std_logic := '0';
	signal index 		      : integer range 0 to 15 := 0; -- start index is 0 
	
	-- state types declaratie 
	type state_type is (detect_ack_1, detect_ack_2, detect_ack_3, send_first_byte, send_second_byte, send_address, start_condition, stop_condition, stand_by);
	
	signal state : state_type := stand_by; -- stand_by is de default state 
	
begin 
	process(clock_50) -- voor de i2c communicatie en data transmissie zijn er twee clocks gegenereerd
	begin
		if (rising_edge(clock_50)) then 
		   if (clock_counter < 250) then -- genereer clock (50 MHz) voor i2c data transmissies
			  clock_counter <= clock_counter + 1;
			else 
			  clock_counter <= 0;
			end if;
			
			if (clock_counter < 125) then -- 50% duty cycle op i2c clock
			   i2c_clock <= '1';
			else 
			   i2c_clock <= '0';
			end if;
			
			if (clock_counter = 62) then -- i2c clock-line is laag / hoog --> ACK/NACK bit wordt hoog / laag
			   ack_enable <= '1';
			else 
			   ack_enable <= '0';
			end if; 
			
			if (clock_counter = 187) then  
			   clock_enable <= '1';
			else 
			   clock_enable <= '0';
			end if;
		end if;
			
		if (rising_edge(clock_50)) then
		   if (i2c_clock_enable = '1') then 
		      SCL_line <= i2c_clock;
			else 
			   SCL_line <= '1';
			end if;
			
			-- states om ACK/NACK bitjes te detecteren om aan te geven dat versturen succesvol is verlopen
			if (ack_enable = '1') then 
			   case state is 
				   when detect_ack_1 => 
					   if (SDA_line = '0') then 
						   state <= send_first_byte; -- verstuur eerste byte
						   index <= 15; -- begin sturen van data bij MSB
						else 
						   state <= stand_by;
						   i2c_clock_enable <= '0';
						end if;
					when detect_ack_2 => 
						if (SDA_line = '0') then 
							state <= send_second_byte; -- verstuur tweede byte 
							index <= 7; -- begin sturen van data bij MSB
						else 
							state <= stand_by;
							i2c_clock_enable <= '0';
						end if;
					when detect_ack_3 =>
						if (SDA_line = '0') then 
							state <= stop_condition; -- klaar met versturen van data frames 
					    else 
							state <= stand_by;
							i2c_clock_enable <= '0';
						end if;
					when others => null;
				end case;
		   end if;
		
		if (clock_enable = '1') then 
			case state is 
				when stand_by =>
					SDA_line <= '1'; -- na stop_condition/detecteren van ACK/NACK bitjes --> data_line wordt weer van laag naar hoog getrokken 
					busy <= '0';
					done <= '0';
					if (flag = '1') then 
						state <= start_condition; -- start conditie --> data_line gaat van hoog naar laag 
						busy <= '1';
					end if;
				when start_condition => -- als master de data_lijn van hoog naar laag heeft gezet
					SDA_line <= '0';
					state <= send_address; -- nadat de start_condition is gezet kan het adres (8 bits) gestuurd worden
					index <= 7;
				when send_address =>
					i2c_clock_enable <= '1'; -- clock_line van i2c wordt hoog 
				    if (index > 0) then 
						index <= index - 1;
						SDA_line <= address(index);
					else 
						SDA_line <= address(index);
						get_ack <= '1'; -- zet een ACK/NACK bitje om te verzekeren dat data goed verzonden is
					end if;
						if (get_ack = '1') then 
							get_ack <= '0'; -- zet bitje weer op 0 zodat hij later weer 1 kan worden 
							state <= detect_ack_1; -- detecteer eerst verzonden ACK/NACK bitje 
							SDA_line <= 'Z';
						end if;
				when send_first_byte => -- eerste data frame verzenden 
					if (index > 8) then -- begin bij versturen van eerste frame bij MSB
					    index <= index - 1;
						SDA_line <= data_frame(index);
					else 
						SDA_line <= data_frame(index);
						get_ack <= '1'; -- zet een ACK/NACK bitje om te verzekeren dat data goed verzonden is
					end if;
						if (get_ack = '1') then 
							get_ack <= '0'; -- zet bitje weer op 0 zodat hij later weer 1 kan worden 
							state <= detect_ack_2; -- detecteer tweede verzonden ACK/NACK bitje 
							SDA_line <= 'Z';
						end if;
				when send_second_byte => -- tweede data frame verzenden 
					if (index > 0) then 
						index <= index - 1;
						SDA_line <= data_frame(index); -- begin bij versturen van tweede frame bij MSB
					else 
					    SDA_line <= data_frame(index);
						get_ack <= '1'; -- zet een ACK/NACK bitje om te verzekeren dat data goed verzonden is 
					end if; 
						if (get_ack = '1') then 
							get_ack <= '0'; -- zet bitje weer op 0 zodat hij later weer 1 kan worden 
							state <= detect_ack_3; -- detecteer derde verzonden ACK/NACK bitje 
							SDA_line <= 'Z';
						end if;
				when stop_condition => -- data is verzonden --> master zet clock_line van laag naar hoog 
					i2c_clock_enable <= '0'; -- clock_line laag zetten
					SDA_line <= 'Z'; 
					state <= stand_by;
					done <= '1';
				when others => null;
			end case;
		end if; 
	end if;
	end process;
end architecture rtl;

