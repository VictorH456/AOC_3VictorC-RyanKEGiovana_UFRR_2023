--Ula
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--Entidade
entity Ula is
PORT(
			Clock: 			in std_logic;
			AluOp:			in std_logic(3 downto 0);
			rs,rd,rt:		in std_logic_vector(15 downto 0);
			resultado:		out std_logic_vector(15 downto 0);
			z, overflow:	out std_logic;
	);
end entity;
architecture Behavior of Ula is

begin
	process (AluOp, rs,rd,rt)
	begin
		case AluOp is
		when "0000" =>--add
			resultado <= rs + rd;
		when "0001" =>--sub
			resultado <= rs - rd;
		when "0010" =>--lw
			resultado <= rs;
		when "0011" =>--sw
			resultado <= rs;
		when "0100" =>--lw
			resultado <= rs;
		WHEN "101" => 
				if(rs <= rd) then
					resultado <= "1111111111111111";
				else 
					resultado <= "0000000000000000";
				end if;	
		when others =>
			resultado <= "0000000000000000";
end architecture;