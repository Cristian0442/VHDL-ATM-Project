library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity SCADERE_BANI_CONT is
	port (suma_retragere: in STD_LOGIC_VECTOR (15 downto 0);
	suma_finala_cont_retragere: out STD_LOGIC_VECTOR (15 downto 0);
	poz_pin: in STD_LOGIC_VECTOR(1 downto 0);
	ES: in STD_LOGIC);
end SCADERE_BANI_CONT;

architecture SCADERE_BANI_CONT of SCADERE_BANI_CONT is

component SCAZATOR_16_BITI
	port(A, B: in STD_LOGIC_VECTOR (15 downto 0);
	BIN: in STD_LOGIC;
	D: out STD_LOGIC_VECTOR (15 downto 0);
	BOUT: out STD_LOGIC;
	ES: in STD_LOGIC);
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

signal suma_cont_curent , suma_depunere_semnal, suma_retragere_semnal: STD_LOGIC_VECTOR(15 downto 0); 
signal poz_pin_semnal: STD_LOGIC_VECTOR(1 downto 0);
	
begin
	
	SUMA_DIN_CONT: MEMORIE_RAM_SUME_CARDURI port map( A_RAM => poz_pin, CS_RAM => '1', WE => '0', D_RAM => suma_cont_curent, 
	poz_pin => poz_pin_semnal, suma_finala_depunere => suma_depunere_semnal, 
	suma_finala_retragere => suma_retragere_semnal, ES => '0', EA => '0');
	
	SCADERE: SCAZATOR_16_BITI port map ( A => suma_cont_curent, B => suma_retragere, BIN => '0', 
	D => suma_finala_cont_retragere, BOUT => COUT_SIGNAL, ES => ES); 
	
end SCADERE_BANI_CONT;