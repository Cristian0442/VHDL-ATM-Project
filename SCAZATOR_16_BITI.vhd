library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SCAZATOR_16_BITI is
	port(A, B: in STD_LOGIC_VECTOR (15 downto 0);
		BIN: in STD_LOGIC;
		D: out STD_LOGIC_VECTOR (15 downto 0);
		BOUT: out STD_LOGIC;
		ES: in STD_LOGIC);
end SCAZATOR_16_BITI;

architecture SCAZATOR_16_BITI of SCAZATOR_16_BITI is
	component SCAZATOR_COMPLET_1_BIT 
		port (A, B, BIN: in STD_LOGIC;
			D, BOUT: out STD_LOGIC;
			ES: in STD_LOGIC);
	end component;	
signal BARROW_TEMP: STD_LOGIC_VECTOR (16 downto 0);	


begin
    BARROW_TEMP(0) <= BIN;
    SCADERE: for i in 0 to 15 generate
    D0: SCAZATOR_COMPLET_1_BIT port map ( A => A(i), B => B(i), BIN => BARROW_TEMP(i), D => D(i),
     BOUT => BARROW_TEMP(i+1), ES => ES);
    end generate;
    BOUT <= BARROW_TEMP(15);
	
end SCAZATOR_16_BITI;