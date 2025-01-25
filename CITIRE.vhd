----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2024 08:16:08 PM
-- Design Name: 
-- Module Name: CITIRE - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CITIRE is
  Port ( intrare: in std_logic_vector (3 downto 0);
         ok, en_citire: in std_logic;
         clk, rst: in STD_LOGIC;
         iesire: out std_logic_vector(15 downto 0)
         );
end CITIRE;

architecture Behavioral of CITIRE is
signal sir: std_logic_vector (15 downto 0);
signal i: integer range 3 downto 0 := 3;
begin

process
    begin
        if rst = '1' then
            sir <= (others => '0');
            i <= 3;
        elsif rising_edge(clk) and rising_edge(ok) then
            if en_citire = '1' then
                sir(i*4 + 3 downto i*4) <= intrare;
                if i = 0 then
                    wait;
                else
                    i <= i - 1;
                end if;
            end if;
        end if;
    wait on clk, rst;
    end process;

    iesire <= sir;

end Behavioral;
