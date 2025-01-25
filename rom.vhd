----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2024 12:36:18
-- Design Name: 
-- Module Name: rom - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
    Port ( adr : in STD_LOGIC_vector(2 downto 0);
           cp : in STD_LOGIC;
           data : out STD_LOGIC_vector(3 downto 0));
end rom;

architecture Behavioral of rom is
type Memory_typee is array(0 to 7) of std_logic_vector(3 downto 0);
signal mem : Memory_typee := ("0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111");
begin
data <= mem(conv_integer(adr));

end Behavioral;
