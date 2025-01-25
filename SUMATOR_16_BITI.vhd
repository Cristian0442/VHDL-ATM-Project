library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SUMATOR_16_BITI is
	port(A, B: in STD_LOGIC_VECTOR (15 downto 0);
		CIN: in STD_LOGIC;
		S: out STD_LOGIC_VECTOR (15 downto 0);
		COUT : out STD_LOGIC;
		EA: in STD_LOGIC);
end SUMATOR_16_BITI;

architecture SUMATOR_16_BITI of SUMATOR_16_BITI is	
component SUMATOR_COMPLET_1_BIT
	port (A, B, CIN: in STD_LOGIC;
		S, COUT: out STD_LOGIC;
		EA: in STD_LOGIC); 
	end component;
signal COUT_TEMP: STD_LOGIC_VECTOR (16 downto 0);
begin

    COUT_TEMP(0) <= CIN;
    SUM : for i in 0 to 15 generate
    S0 : SUMATOR_COMPLET_1_BIT port map ( A => A(i), B => B(i), CIN => COUT_TEMP(i),
     S => S(i), COUT => COUT_TEMP(i+1), EA => EA );
    end generate;
	
	COUT <= COUT_TEMP(15);
end SUMATOR_16_BITI;