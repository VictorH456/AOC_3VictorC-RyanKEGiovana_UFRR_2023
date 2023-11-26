LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

Entity REGISTRADORES is port(
	Clock: IN STD_LOGIC;
	Registrador1_de_Entrada: IN STD_LOGIC_VECTOR (0 DOWNTO 0); -- nomeclatura do verto de tamanho 1 --
	Registrador2_de_Entrada: IN STD_LOGIC_VECTOR (0 DOWNTO 0); -- nomeclatura do verto de tamanho 1 --
	Registrador_Write: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	Write_data: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	RegistradorA_de_saida: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
	RegistradorB_de_saida: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
	END REGISTRADORES;
	ARCHITECTURE BEHAVIOR OF REGISTRADORES IS
	TYPE REGISTRADORES IS ARRAY (0 TO 3) OF STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL MEM_REGISTRADORES: REGISTRADORES;
	BEGIN
		PROCESS(
			Clock
			Registrador1_de_Entrada
			Registrador2_de_Entrada
		)
		BEGIN
			IF RISING_EDGE(Clock) THEN
				IF (Registrador_Write = '1') THEN
					MEM_REGISTRADORES(TO_INTEGER(UNSIGNED(Registrador1_de_Entrada))) <= Registrador_White;
				END IF;
			END IF;
			RegistradorA_de_saida <= MEM_REGISTRADORES(TO_INTEGER(UNSIGNED(Registrador1_de_Entrada))); 
			RegistradorB_de_saida <= MEM_REGISTRADORES(TO_INTEGER(UNSIGNED(Registrador2_de_Entrada)));
		END PROCESS:
	END;	
