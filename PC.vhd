--PC
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
--Entidade
entity PC is
	port(
	
	Clock, endereco_in:		in std_logic_vector(15 downto 0);
	endereco_out:		out std_logic_vector(15 downto 0)
);
end entity;	
architecture Behavior of PC is
begin
	
end architecture;