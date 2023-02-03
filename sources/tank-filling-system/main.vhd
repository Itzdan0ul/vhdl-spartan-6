-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 2/3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           X : out  STD_LOGIC;
           Y : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end main;

architecture Behavioral of main is
begin
	X <= ((A and (not D)) or (A and (not C) and (not D)) or ((not B) and (not C) and (not D)) or ((not B) and C and D));
	Y <= ((A and B and (not D)) or (A and (not C) and (not D)));
	Z <= (((not C) and D) or ((not A) and B and (not C)) or ((not A) and B and D) or ((not A) and C and (not D)));
end Behavioral;
