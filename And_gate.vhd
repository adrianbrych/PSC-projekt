library IEEE;
use IEEE.STD_logic_1164.ALL;
use IEEE.STD_LOGIC_unsigned.all;


entity and_gate  is 
	port(
	IN1: in  STD_logic;
	IN2: in  STD_logic;
	Q  : out STD_logic
	); 
	
	
end and_gate;

architecture and_gate of and_gate is

	
begin	 
	Q<= IN1 and IN2 ; 
end and_gate;