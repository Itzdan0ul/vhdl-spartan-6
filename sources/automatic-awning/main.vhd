-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 2/2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( P : in  STD_LOGIC;
           S : in  STD_LOGIC;
           L : in  STD_LOGIC;
           E : in  STD_LOGIC;
           M : in  STD_LOGIC;
           T : out  STD_LOGIC);
end main;

architecture Behavioral of main is
begin
	T <= ((P and M) or (P and S and (not L) and E) or (P and (not S) and L and E));
end Behavioral;
