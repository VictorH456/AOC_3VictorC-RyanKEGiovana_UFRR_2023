--somador
--PC
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

--Entidade
entity somador is
	port(
	Clock:		in std_logic;
	entrada:		in std_logic_vector(15 downto 0);
	saida:		out std_logic_vector(15 downto 0)
);
end entity;	

architecture Behavior of somador is
begin
	--Quando clock subir para nivel alto 
	--a saida vai pegar a proxma linha de endereço
	process(clock, entrada)  
	begin
		saida <= entrada + '1';
	end process;
end architecture;