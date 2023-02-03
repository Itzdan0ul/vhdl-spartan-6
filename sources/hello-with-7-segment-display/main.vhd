-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 5/2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( X : in  STD_LOGIC;
           Y : in  STD_LOGIC;
           a : out  STD_LOGIC;
           b : out  STD_LOGIC;
           c : out  STD_LOGIC;
           d : out  STD_LOGIC;
           e : out  STD_LOGIC;
           f : out  STD_LOGIC;
           g : out  STD_LOGIC);
end main;

architecture Behavioral of main is
begin
	a <= Y;
	b <= ((not X) or Y);
	c <= ((not X) or Y);
	d <= (X xor Y);
	e <= '1';
	f <= '1';
	g <= (((not X) and (not Y)) or (X and Y));
end Behavioral;
