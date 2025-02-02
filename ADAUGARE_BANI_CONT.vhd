library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ADAUGARE_BANI_CONT is
	port (suma_depunere: in STD_LOGIC_VECTOR (15 downto 0);
	poz_pin: in STD_LOGIC_VECTOR (1 downto 0);
	suma_finala_cont_curent: out STD_LOGIC_VECTOR (15 downto 0);
	EA: in STD_LOGIC);
end ADAUGARE_BANI_CONT;

architecture ADAUGARE_BANI_CONT of ADAUGARE_BANI_CONT is 

component SUMATOR_16_BITI 
	port(A, B: in STD_LOGIC_VECTOR (15 downto 0);
		CIN: in STD_LOGIC;
		S: out STD_LOGIC_VECTOR (15 downto 0);
		COUT : out STD_LOGIC;
		EA: in STD_LOGIC);
end component;
signal COUT_SIGNAL: STD_LOGIC;

component MEMORIE_RAM_SUME_CARDURI
	port (A_RAM: in STD_LOGIC_VECTOR(1 downto 0);
		CS_RAM: in STD_LOGIC;
		WE: in STD_LOGIC; 
		D_RAM: inout STD_LOGIC_VECTOR(15 downto 0);
		poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
		suma_finala_depunere, suma_finala_retragere: in STD_LOGIC_VECTOR(15 DOWNTO 0);
		ES, EA: in STD_LOGIC);
end component;

signal suma_cont_curent, suma_depunere_semnal, suma_retragere_semnal: STD_LOGIC_VECTOR (15 downto 0);
signal poz_pin_semnal: STD_LOGIC_VECTOR (1 downto 0);

begin

	SUMA_DIN_CONT: MEMORIE_RAM_SUME_CARDURI port map (A_RAM => poz_pin, CS_RAM => '1', WE => '0', D_RAM => suma_cont_curent, poz_pin => poz_pin_semnal,
	suma_finala_depunere => suma_depunere_semnal, suma_finala_retragere => suma_retragere_semnal, ES => '0', EA => '0');
	
	ADUNARE: SUMATOR_16_BITI port map (A => suma_depunere, B => suma_cont_curent, CIN => '0', S => suma_finala_cont_curent, COUT => COUT_SIGNAL, EA => EA);
	
end ADAUGARE_BANI_CONT;