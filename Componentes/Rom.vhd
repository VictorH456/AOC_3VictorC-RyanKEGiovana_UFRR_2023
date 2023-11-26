-- Rom
-- Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

-- Entidade
entity Rom is
    port(
        endereco : in std_logic_vector(15 downto 0);
        saida    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture Behavior of Rom is
    type memoria_array is array(natural range <>) of std_logic_vector(15 downto 0);
    constant operacoes : memoria_array(0 to 17) :=
        (
            0 => "1100000011000000", -- Coloca 0
            1 => "1101000111010001", -- Coloca 1
            2 => "0000100000001000", -- ADD
            3 => "0001000000010000", -- ADD
            4 => "0110101001101010", -- bne
            others => "1000000010000000"
        );
begin
    saida <= operacoes(conv_integer(unsigned(endereco)));
end architecture;
