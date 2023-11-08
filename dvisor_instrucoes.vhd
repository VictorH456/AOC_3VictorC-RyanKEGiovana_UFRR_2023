--Divisor da instruções da rom
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity dvisor_instrucoes is
	port(
	instrucao:				in std_logic_vector(15 downto 0);
	opcode, rs, rt, rd:		out std_logic_vector(3 downto 0);
	endereco:				out std_logic_vector(11 downto 0)
	);
end entity;
architecture behavior of dvisor_instrucoes is
begin
	opcode <= instrucao(15 downto 12);
	rs <= instrucao(11 downto 8);
	rt <= instrucao(7 downto 4);
	rd <= instrucao(3 downto 0);
	endereco <= instrucao(11 downto 0);
end architecture;