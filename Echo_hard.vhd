library IEEE;
use IEEE.STD_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;


entity Echo_hard is
	port(
	CLK 	      : in STD_logic;
	triger_activ  : in STD_logic;
	Echo_in		  : in STD_logic;
	Echo_out      : out STD_logic
	);
end Echo_hard;

architecture behavioral of Echo_hard is 



signal E_Hold  : STD_logic; 


begin
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if triger_activ  = '0' then
				if Echo_in = '1' then 
					E_Hold <='1' ;
				else 
					E_Hold <='0' ;
				end if;		
			end if;	  
		end if;
	end process;
Echo_out<=E_Hold;
end behavioral ;
		
				
				