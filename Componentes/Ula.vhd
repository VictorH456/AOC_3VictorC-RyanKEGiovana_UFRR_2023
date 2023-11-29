--Ula
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.std_logic_unsigned.ALL;

--Entidade
entity Ula is
PORT(
			Clock: 			in std_logic;
			AluOp:			in std_logic_vector(3 downto 0);
			rs,rd:			in std_logic_vector(15 downto 0);
			resultado:		out std_logic_vector(15 downto 0);
			z:					out std_logic
	);
end entity;
architecture Behavior of Ula is
begin
	process (AluOp, rs, rd)
	begin
		case AluOp is
			when "0000" => --add
				resultado <= rs + rd;
			WHEN "0001" => --addi
				resultado <= rs + rd;
			when "0010" =>	--sub
				resultado <= rs - rd;
			WHEN "0011" => --subi
				resultado <= rs - rd;
			when "0100" => --lw
				resultado <= rs;
			when "0101" => --sw
				resultado <= rs;
			when "0110" => --li
				resultado <= rd;
			WHEN "0111" => --bne
					if(rs <= rd) then
						resultado <= "1111111111111111";
					else 
						resultado <= "0000000000000000";
					end if;	
			when others => --J
				resultado <= "0000000000000000";
			end case;
		end process;
end architecture;