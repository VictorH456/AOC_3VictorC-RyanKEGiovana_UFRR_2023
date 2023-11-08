--Extensor 4x16
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--Entidade
entity Extensor4x16 is
	port(
	entrada:	in std_logic_vector(3 downto 0);
	saida:		out std_logic_vector(15 downto 0)
	);
end entity;	
architecture Behavior of Extensor4x16 is
begin
	process(entrada)
	begin
		saida(3 downto 0) <= entrada;
		saida(15 downto 4) <= (others =>'0');
	end process;
end architecture;