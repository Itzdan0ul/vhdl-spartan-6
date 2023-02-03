-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 2/1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( A, B : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end main;

architecture Behavioral of main is
begin
	Q <= (A xor B);
end Behavioral;
