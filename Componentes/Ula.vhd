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
Signal in_branch_helper, out_branch_helper: std_logic;

component Branch_helper is
	port(
		A: in std_logic;
		S: out std_logic
);
end component;
begin
	
	Bh: Branch_helper port map(in_branch_helper, out_branch_helper);
	
	process (AluOp, rs, rd, in_branch_helper, out_branch_helper)
	begin
		case AluOp is
			
			when "0000" | "0001" => --add
				resultado <= rs + rd;
			
--			WHEN "0001" => --addi
--				resultado <= rs + rd;
			
			when "0010" | "0011" =>	--sub
				resultado <= rs - rd;
			
--			WHEN "0011" => --subi
--				resultado <= rs - rd;
			
			when "0100" => --lw
				resultado <= rs;
			
			when "0101" => --sw
				resultado <= rs;
			
			when "0110" => --li
				resultado <= rd;
			
			WHEN "0111" => --Beq
				if out_branch_helper = '1' then
					z <= '1';
				else
					z <= '0';
				end if;
				resultado <= "0000000000000000";
			
			when "1000" => -- if
				if rs = rd then
					in_branch_helper <= '1';
				else
					in_branch_helper <= '0';
				end if;
				resultado <= "0000000000000000";
			when "1010" | "1011" =>	--mult
				resultado <= rs(7 downto 0) * rd(7 downto 0);
			when others => --J
				resultado <= "0000000000000000";
			end case;
		end process;
end architecture;