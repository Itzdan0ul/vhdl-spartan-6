-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 2/8

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( Bp : in  STD_LOGIC;
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           E : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end main;

architecture Behavioral of main is
begin
	Q <= (A xor B xor C xor D xor E xor Bp);
end Behavioral;
