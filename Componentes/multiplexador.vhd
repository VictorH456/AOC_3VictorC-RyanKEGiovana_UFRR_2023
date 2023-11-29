 --Porta multiplexador
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
--Entidade
entity multiplexador is
	port(
		a, b:		in std_logic_vector(15 downto 0);
		s:			in std_logic;
		z:			out std_logic_vector(15 downto 0)
	);
end entity;	

--Arquitetura
architecture Behavior of multiplexador is
begin
	z <=	a when s = '0'
	else b;
end architecture;