-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 10

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( clock_in : in  STD_LOGIC;
           XY : in  STD_LOGIC_VECTOR (1 downto 0);
           pulse : out  STD_LOGIC;
           Display : out  STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is

type states is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9);
signal state: states;
signal counter: STD_LOGIC_VECTOR (25 downto 0) := (others => '0');
signal clock: STD_LOGIC := '0';

begin
	process (clock_in)
		begin
			if rising_edge(clock_in) then
				if counter = x"17D7840" then
					counter <= (others => '0');
					clock <= (not clock);
					pulse <= clock;
				else
					counter <= counter + '1';
					pulse <= clock;
				end if;
			end if;
	end process;
	
	process (clock)
		begin
			if rising_edge(clock) then
				case state is 
					when E0 =>
						case XY is
							when "00" => state <= E9;
							when "01" => state <= E0;
							when "10" => state <= E0;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E1 =>
						case XY is
							when "00" => state <= E0;
							when "01" => state <= E0;
							when "10" => state <= E1;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E2 =>
						case XY is
							when "00" => state <= E1;
							when "01" => state <= E0;
							when "10" => state <= E2;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E3 =>
						case XY is
							when "00" => state <= E2;
							when "01" => state <= E0;
							when "10" => state <= E3;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E4 =>
						case XY is
							when "00" => state <= E3;
							when "01" => state <= E0;
							when "10" => state <= E4;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E5 =>
						case XY is
							when "00" => state <= E4;
							when "01" => state <= E0;
							when "10" => state <= E5;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E6 =>
						case XY is
							when "00" => state <= E5;
							when "01" => state <= E0;
							when "10" => state <= E6;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E7 =>
						case XY is
							when "00" => state <= E6;
							when "01" => state <= E0;
							when "10" => state <= E7;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E8 =>
						case XY is
							when "00" => state <= E7;
							when "01" => state <= E0;
							when "10" => state <= E8;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when E9 =>
						case XY is
							when "00" => state <= E8;
							when "01" => state <= E0;
							when "10" => state <= E9;
							when "11" => state <= E1;
							when others => state <= E0;
						end case;
					when others => state <= E0;
				end case;
			end if;
	end process;
	
	process (state)
		begin
			case state is 
				when E0 => Display <= "0111111"; -- 0
				when E1 => Display <= "0000110"; -- 1
				when E2 => Display <= "1011011"; -- 2
				when E3 => Display <= "1001111"; -- 3
				when E4 => Display <= "1100110"; -- 4
				when E5 => Display <= "1101101"; -- 5
				when E6 => Display <= "1111100"; -- 6
				when E7 => Display <= "0000111"; -- 7
				when E8 => Display <= "1111111"; -- 8
				when E9 => Display <= "1100111"; -- 9
				when others => Display <= "0000000"; -- Off
			end case;
	end process;
end Behavioral;
