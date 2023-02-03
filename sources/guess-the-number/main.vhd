-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 2/4

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( COMPARA : in STD_LOGIC;
			  S0 : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S2 : in  STD_LOGIC;
           N1 : in  STD_LOGIC;
           N0 : in  STD_LOGIC;
           N2 : in  STD_LOGIC;
           MY : out  STD_LOGIC;
           ME : out  STD_LOGIC;
           EQ : out  STD_LOGIC);
			  
end main;

architecture Behavioral of main is
begin
	MY <= (COMPARA and (((not S0) and N0) or 
			((not S0) and (not S2) and N1 and N2) or 
			((not S0) and (not S1) and (not N0) and N1) or 
			(S0 and (not S1) and N0 and N0 and N1) or 
			((not S2) and N0 and N1 and N2) or 
			((not S1) and (not S2) and N0 and N2) or 
			((not S0) and (not S1) and (not S2) and (not N0) and N2)));
		
	ME <= (COMPARA and ((S2 and (not N0) and (not N1) and (not N2)) or 
			(S1 and S2 and (not N0) and N1 and (not N2)) or 
			(S0 and (not N0)) or 
			(S0 and S1 and N0 and (not N1)) or 
			(S0 and S2 and (not N1) and (not N2)) or 
			(S0 and N0 and (not N1)) or 
			(S0 and (not N0) and N2) or 
			(S0 and S1 and S2 and N1 and(not N2)) or 
			(S1 and (not N0) and N1)));
	
	EQ <= (COMPARA and (((not S0) and (not S1) and (not S2) and (not N0) and (not N1) and (not N2)) or 
			((not S0) and (not S1) and S2 and (not N0) and (not N1) and N2) or 
			((not S0) and S1 and S2 and (not N0) and N1 and N2) or 
			(S0 and (not S1) and (not S2) and N0 and (not N1) and (not N2)) or 
			(S0 and (not S1) and S2 and N0 and (not N1) and N2) or 
			(S0 and S1 and (not S2) and N0 and N1 and (not N2)) or 
			(S0 and S1 and S2 and N0 and N1 and N2)));
end Behavioral;
