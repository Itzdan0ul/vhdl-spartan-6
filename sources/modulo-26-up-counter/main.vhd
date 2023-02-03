-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 8

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( clock_in : in STD_LOGIC;
			  Display : out STD_LOGIC_VECTOR (13 downto 0));
			  
end main;

architecture Behavioral of main is
signal counter: STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
signal Q: STD_LOGIC_VECTOR (4 downto 0) := "00000";
signal D: STD_LOGIC_VECTOR (4 downto 0);
signal clock: STD_LOGIC := '0';
	
begin
	process (clock_in)
		begin
			if rising_edge(clock_in) then
				if counter = x"17D7840" then
					counter <= (others => '0');
					clock <= (not clock);
				else
					counter <= counter + '1';
				end if;
			end if;
	end process;

	process (clock)
		begin
			if rising_edge(clock) then
				D(4) <= (((not Q(4)) and Q(3) and Q(2) and Q(1) and Q(0)) or 
						  (Q(4) and (not Q(3))) or 
						  (Q(4) and (not Q(2)) and (not Q(1)) and (not Q(0))));
							  
				D(3) <= (((not Q(4)) and Q(3) and (not Q(2))) or 
					     ((not Q(4)) and Q(3) and (not Q(1))) or 
						  (Q(3) and (not Q(2) and (not Q(1)) and (not Q(0)))) or 
						  ((not Q(3)) and Q(2) and Q(1) and Q(0)) or 
						  ((not Q(4)) and Q(3) and Q(1) and (not Q(0))));
							  
				D(2) <= (((not Q(4)) and Q(2) and (not Q(1))) or
						  ((not Q(4)) and (not Q(2)) and Q(1) and Q(0)) or
						  ((not Q(3)) and Q(2) and (not Q(1))) or
						  ((not Q(3)) and Q(2) and (not Q(0))) or
						  ((not Q(3)) and (not Q(2)) and Q(1) and Q(0)) or
						  ((not Q(4)) and Q(2) and (not Q(0))));
								
				D(1) <= (((not Q(4)) and (not Q(1)) and Q(0)) or
					     ((not Q(3)) and (not Q(1)) and Q(0)) or
						  ((not Q(4)) and Q(1) and (not Q(0))) or
						  ((not Q(3)) and Q(1) and (not Q(0))));
								
				D(0) <= (((not Q(3)) and (not Q(0))) or
					     ((not Q(4)) and (not Q(0))) or
						  (Q(3) and (not Q(2)) and (not Q(1)) and (not Q(0))));
			end if;
	end process;
	
	Q(4) <= D(4);
	Q(3) <= D(3);
	Q(2) <= D(2);
	Q(1) <= D(1);
	Q(0) <= D(0);
	
	process (Q)
		begin
			case Q is
				when "00000" => Display <= "01111110111111"; -- 00
				when "00001" => Display <= "01111110000110"; -- 01
				when "00010" => Display <= "01111111011011"; -- 02
				when "00011" => Display <= "01111111001111"; -- 03
				when "00100" => Display <= "01111111100110"; -- 04
				when "00101" => Display <= "01111111101101"; -- 05
				when "00110" => Display <= "01111111111100"; -- 06
				when "00111" => Display <= "01111110000111"; -- 07
				when "01000" => Display <= "01111111111111"; -- 08
				when "01001" => Display <= "01111111100111"; -- 09
				when "01010" => Display <= "00001100111111"; -- 10
				when "01011" => Display <= "00001100000110"; -- 11
				when "01100" => Display <= "00001101011011"; -- 12
				when "01101" => Display <= "00001101001111"; -- 13
				when "01110" => Display <= "00001101100110"; -- 14
				when "01111" => Display <= "00001101101101"; -- 15
				when "10000" => Display <= "00001101111100"; -- 16
				when "10001" => Display <= "00001100000111"; -- 17
				when "10010" => Display <= "00001101111111"; -- 18
				when "10011" => Display <= "00001101100111"; -- 19
				when "10100" => Display <= "10110110111111"; -- 20
				when "10101" => Display <= "10110110000110"; -- 21
				when "10110" => Display <= "10110111011011"; -- 22
				when "10111" => Display <= "10110111001111"; -- 23
				when "11000" => Display <= "10110111100110"; -- 24
				when "11001" => Display <= "10110111101101"; -- 25
				when others => Display <= "00000000000000"; -- 00
			end case;
	end process;
end Behavioral;
