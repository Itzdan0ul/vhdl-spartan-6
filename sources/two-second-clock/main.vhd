-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 7

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( clock_in : in  STD_LOGIC;
           clock_out : out  STD_LOGIC);
end main;

architecture Behavioral of main is
    signal counter : STD_LOGIC_VECTOR (100 downto 0) := (others => '0');
    signal clk : STD_LOGIC := '0';
begin
    process (clock_in)
    begin
        if rising_edge(clock_in) then
            if counter = x"5F5E100" then
                counter <= (others => '0');
                clk <= (not clk);
            else
                counter <= counter + '1';
            end if;
        end if;
    end process;
    clock_out <= clk;
end Behavioral;
