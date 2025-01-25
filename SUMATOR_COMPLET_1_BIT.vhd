library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SUMATOR_COMPLET_1_BIT is	
	port (A, B, CIN: in STD_LOGIC;
	S, COUT: out STD_LOGIC;
	EA: in STD_LOGIC); 
end SUMATOR_COMPLET_1_BIT;


architecture SUMATOR_COMPLET_1_BIT of SUMATOR_COMPLET_1_BIT is

signal INTER_S: STD_LOGIC; 

begin
	
	INTER_S <= A xor B;
	S <= INTER_S xor CIN when EA = '1';
	COUT <= (A and CIN) or (B and CIN) or (A and B);
	
end SUMATOR_COMPLET_1_BIT;