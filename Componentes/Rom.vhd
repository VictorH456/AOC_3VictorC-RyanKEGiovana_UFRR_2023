-- Rom
-- Bibliotecas e pacotes

--Instrução|reg1|reg2|Reg3
--Add		= "0000"|
--Addi	= "0001"|
--Sub		= "0010"|
--Subi 	= "0011"|
--Lw 		= "0100"|
--Sw 		= "0101"|
--Li 		= "0110"|
--Beq		= "0111"|
--If		= "1000"|
--J 		= "1001"|

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

-- Entidade
entity Rom is
    port(
		  Clock	  : in std_logic;
        endereco : in std_logic_vector(15 downto 0);
        saida    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture Behavior of Rom is
type memoria_array is array(natural range <>) of std_logic_vector(15 downto 0);
constant operacoes : memoria_array(0 to 17) :=
(
--		Testes Sub e Add| funcionando
--		0 => "0001000000000011", -- Addi S0 S0 3
--		1 => "0001000100010001", -- Addi S1 S1 1
--		2 => "0011000000000001", -- Subi S0 S0 1
--		3 => "0010001000000001", -- Sub S2 S0 S1
	
--		Testes Beq e Li
--		0 => "0110000000000010",	-- Li S0 2
--		1 => "0110000100010010", 	-- Li S1 2
--		2 => "1000000000000001", 	-- If S0 == S1
--		3 => "0111000000010101", 	-- Beq S0 == S1 Jump 0101
--		4 => "0001000000000001", 	-- Addi S0 S0 1
--		5 => "0001000000000010", 	-- Addi S0 S0 2
	
--		Teste fibonacci
--		0 => "0001000000000000", -- Addi S0 0
--		1 => "0101000000000000", -- Sw S0
--		2 => "0001000000000001", -- Addi S0 1
--		3 => "0001000100010001", -- Addi S1 1
--		4 => "0100001000100000", -- Lw S2 00
--		5 => "0000001000100001", -- Add S2 S1
--		6 => "0000000100010000", -- Add S1 S0
--		7 => "0100000000000000", -- Lw S0 00
--		8 => "0000000000000010", -- Add S0 S2
--		9 => "1001000000000100", -- J 0100

---- 	Teste fatorial fat
--		0 => "0110000000001000",	-- n Li S0 0
--		1 => "0110000100010001",	--	fat Li S1 1	
--		2 => "0110001000100001", 	--	i Li S2 1
--		3 => "1000000000000010", 	-- If S0 == S2
--		4 => "0111001000001000",	-- beq s2 s0 jump 1000
--		5 => "1010000100010010",	-- fat mult S1 S1 S2
--		6 => "0001001000100001",	-- i addi S2 S2 1
--		7 => "1001000000000011",	-- J 0011

--		Teste Soma de 0 a n
		0 => "0110000000001001",	-- n Li S0 8
		1 => "0110000100010000",	--	sum Li S1 0	
		2 => "0110001000100001", 	--	i Li S2 1
		3 => "1000000000000010", 	-- If S0 == S2
		4 => "0111001000001111",	-- beq s2 s0 jump 0111
		5 => "0000000100010010",	-- Sum Add S1 S1 S2
		6 => "0001001000100001",	-- i addi S2 S2 1
		7 => "1001000000000011",	-- J 0011

	OTHERS => "1111000000000000"
);
begin
	process(Clock, endereco)
	begin
		saida <= operacoes(conv_integer(unsigned(endereco)));
	end process;
end architecture;
