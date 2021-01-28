
library IEEE;
use IEEE.STD_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;


entity SEG is 
	port(
		CLK		  : in  STD_logic;
		CE        : in  STD_logic;
		Seven_Seg : out STD_Logic_vector(6 downto 0) ;
		Jednosci  : in  STD_logic_vector(3 downto 0) ;
		dziesiatki: in  STD_logic_vector(3 downto 0) ;
		setki     : in  STD_logic_vector(3 downto 0) ;
		Anode     :	out STD_Logic_vector(2 downto 0)
		); 
	
	
end SEG;

architecture SEG of SEG is 

signal An        : std_Logic_vector(2 downto 0); 	
signal data_in   : STD_logic_Vector(3 downto 0);

begin
process(CLK)
begin
if CLK'event and CLK='1' then
	if CE = '1' then 
			case An is 
				when "100" => An <="010";
				when "010" => An <="001";
				when "001" => An <="100";
				when others => An <="100"; 
			end case ;
			
		Anode <= AN ; 
		
		case AN is
			when "001" => data_in <=Jednosci;
			when "010" => data_in <=dziesiatki;
			when "100" => data_in <=setki;
			when others =>data_in <="0000";	
		end case;
		
	end if;
end if;	
end process; 

with data_in select
Seven_Seg <="0100000" when "0000",
"1111001" when "0001",
"0100100" when "0010",
"0101000" when "0011",
"0011011" when "0100",
"0010010" when "0101",
"0000010" when "0110",
"1111000" when "0111",
"0000000" when "1000",
"0100000" when "1001",
"0000000" when others ;

			

end SEG;		
