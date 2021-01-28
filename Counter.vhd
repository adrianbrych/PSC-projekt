-------------------------------------------------------------------------------
--
-- Title       : Counter
-- Design      : pro
-- Author      : adrianbrych11@gmail.com
-- Company     : Akademia Górniczo-Hutnicza
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\Pro\pro\src\Counter.vhd
-- Generated   : Wed Jan 20 23:31:31 2021
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Counter} architecture {Counter}}
library IEEE;
use IEEE.STD_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;


entity Counter is
	port(
	CLK : in STD_logic;
	CLR : in STD_logic;
	CE  : in STD_Logic; 
	Q   : out STD_logic_vector(3 downto 0);
	Overflow : out STD_logic
	);
end Counter;

--}} End of automatically maintained section   


architecture Counter of Counter is 

signal Q_int : STD_logic_vector(3 downto 0);
begin
	process(CLK,CLR)
	begin 
		if CLR ='1' then 
			Q_int<= (others =>'0');
		elsif CLK'event and CLK ='1' then 
			if CE ='0' then 
				if Q_int ="0000" then
					overflow <='0';
					Q_int<=Q_int + 1;
				else
					if Q_int="1001" then 
						Q_int <=(others =>'0');
						overflow <='1';
					else 
						Q_int <=Q_int +1 ; 
					end if ;
				end if ; 
			end if ; 
		end if ; 	
	end process;
Q<=Q_int;	
end Counter;
