library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SCAZATOR_COMPLET_1_BIT is
	port (A, B, BIN: in STD_LOGIC;
	D, BOUT: out STD_LOGIC;
	ES: in STD_LOGIC); 
end SCAZATOR_COMPLET_1_BIT;

architecture SCAZATOR_COMPLET_1_BIT of SCAZATOR_COMPLET_1_BIT is

signal INTER_D, NOT_A: STD_LOGIC;
begin
	
	INTER_D <= A xor B;
	D <= INTER_D xor BIN when ES = '1';
	NOT_A <= not A;
	BOUT <= (NOT_A and BIN) or (B and BIN) or (NOT_A and B) when ES = '1';
	
end SCAZATOR_COMPLET_1_BIT;