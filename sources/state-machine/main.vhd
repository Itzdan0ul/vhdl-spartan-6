-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 9

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( X, Y : in STD_LOGIC;
			  clock_in : in STD_LOGIC;
			  Display : out STD_LOGIC_VECTOR (6 downto 0));
			  
end main;

architecture Behavioral of main is

signal counter: STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
signal Q: STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal D: STD_LOGIC_VECTOR (3 downto 0);
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
				D(3) <= (((not X) and (not Y) and (not Q(3)) and (not Q(2)) and (not Q(1)) and (not Q(0))) or
                     ((not Y) and Q(3) and (not Q(2)) and (not Q(1)) and Q(0)));

            D(2) <= ((X and (not Y) and (not Q(3)) and Q(2)) or
                    ((not X) and (not Y) and Q(3) and (not Q(2)) and (not Q(1)) and (not Q(0))) or
                    ((not Y) and (not Q(3)) and Q(2) and Q(0)) or
                    ((not Y) and (not Q(3)) and Q(2) and Q(1)));

            D(1) <= ((X and (not Y) and (not Q(3)) and Q(1)) or
                    ((not Y) and (not Q(3)) and Q(1) and Q(0)) or
                    ((not X) and (not Y) and (not Q(3)) and Q(2) and (not Q(1)) and (not Q(0))) or
                    ((not X) and (not Y) and Q(3) and (not Q(2)) and (not Q(1)) and (not Q(0))));

            D(0) <= ((X and (not Q(3)) and Q(0)) or
                    ((not X) and (not Y) and Q(3) and (not Q(2)) and (not Q(1)) and (not Q(0))) or
                    ((not X) and (not Y) and (not Q(3)) and (not Q(0))) or 
                    (X and (not Q(2)) and (not Q(1)) and Q(0)));
			end if;
	end process;
	
	Q(3) <= D(3);
	Q(2) <= D(2);
	Q(1) <= D(1);
	Q(0) <= D(0);
		
	process (Q)
		begin
			case Q is
				when "0000" => Display <= "0111111"; -- 0
				when "0001" => Display <= "0000110"; -- 1
				when "0010" => Display <= "1011011"; -- 2
				when "0011" => Display <= "1001111"; -- 3
				when "0100" => Display <= "1100110"; -- 4
				when "0101" => Display <= "1101101"; -- 5
				when "0110" => Display <= "1111100"; -- 6
				when "0111" => Display <= "0000111"; -- 7
				when "1000" => Display <= "1111111"; -- 8
				when "1001" => Display <= "1100111"; -- 9
				when others => Display <= "0000000"; -- Off
			end case;
	end process;
end Behavioral;
