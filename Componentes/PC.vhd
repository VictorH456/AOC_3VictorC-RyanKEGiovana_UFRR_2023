LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY PC IS
	PORT (
			clock: in std_logic; -- sinal do clock
			enderecoDEentrada: in std_logic_vector (15 downto 0); --Sinal do enderço
			enderencoDEsaida:  in std_logic_vector (15 downto 0) ); --Sinal da saida do endereço 
END PC;

architecture BEHAVIOR of PC is
BEGIN
	process (clock)
	BEGIN
		IF RISING_EDGE(clock) THEN
			enderencoDEsaida <= enderecoDEentrada;
		END IF;
	END PROCESS; 
END;
