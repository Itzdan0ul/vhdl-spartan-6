-- Engineer: Urtiz López Dan Jair
-- 2NM2A

-- Práctica 10/2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is
    Port ( clock_in : in  STD_LOGIC;
           XY : in  STD_LOGIC_VECTOR (1 downto 0);
           pulse : out  STD_LOGIC;
           Display : out  STD_LOGIC_VECTOR (13 downto 0));
end main;

architecture Behavioral of main is

type states is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15);
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
							when "00" => state <= E4;
							when "01" => state <= E0;
							when "10" => state <= E1;
							when "11" => state <= E15;
							when others => state <= E0;
						end case;
					when E1 =>
						case XY is
							when "00" => state <= E4;
							when "01" => state <= E1;
							when "10" => state <= E1;
							when "11" => state <= E15;
							when others => state <= E0;
						end case;
					when E2 =>
						case XY is
							when others => state <= E0;
						end case;
					when E3 =>
						case XY is
							when "01" => state <= E3;
							when "10" => state <= E1;
							when others => state <= E0;
						end case;
					when E4 =>
						case XY is
							when "00" => state <= E8;
							when "01" => state <= E4;
							when "10" => state <= E1;
							when others => state <= E0;
						end case;
					when E5 =>
						case XY is
							when others => state <= E0;
						end case;
					when E6 =>
						case XY is
							when "01" => state <= E6;
							when "10" => state <= E1;
							when "11" => state <= E3;
							when others => state <= E0;
						end case;
					when E7 =>
						case XY is
							when others => state <= E0;
						end case;
					when E8 =>
						case XY is
							when "00" => state <= E12;
							when "01" => state <= E8;
							when "10" => state <= E1;
							when others => state <= E0;
						end case;
					when E9 =>
						case XY is
							when "01" => state <= E9;
							when "10" => state <= E1;
							when "11" => state <= E6;
							when others => state <= E0;
						end case;
					when E10 =>
						case XY is
							when others => state <= E0;
						end case;
					when E11 =>
						case XY is
							when others => state <= E0;
						end case;
					when E12 =>
						case XY is
							when "01" => state <= E12;
							when "10" => state <= E1;
							when "11" => state <= E9;
							when others => state <= E0;
						end case;
					when E13 =>
						case XY is
							when others => state <= E0;
						end case;
					when E14 =>
						case XY is
							when others => state <= E0;
						end case;
					when E15 =>
						case XY is
							when "01" => state <= E15;
							when "10" => state <= E1;
							when "11" => state <= E12;
							when others => state <= E0;
						end case;
					when others => state <= E0;
				end case;
			end if;
	end process;
	
	process (state)
		begin
			case state is 
				when E0 => Display <= "01111110111111"; -- 00
				when E1 => Display <= "01111110000110"; -- 01
				when E3 => Display <= "01111111001111"; -- 03
				when E4 => Display <= "01111111100110"; -- 04
				when E6 => Display <= "01111111111100"; -- 06
				when E8 => Display <= "01111111111111"; -- 08
				when E9 => Display <= "01111111100111"; -- 09
				when E12 => Display <= "00001101011011"; -- 12
				when E15 => Display <= "00001101101101"; -- 15
				when others => Display <= "00000000000000"; -- Off
			end case;
	end process;
end Behavioral;
