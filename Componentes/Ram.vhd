library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

entity Ram is 
port (
	clock,WRITE_MEMORY, READ_MEMORY: in std_logic;
	ENDERECO: IN STD_LOGIC_VECTOR (15 DOWNTO 0); 
	DATA_IN: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
	DATA_OUT: out STD_LOGIC_VECTOR (15 DOWNTO 0)
	); 
end entity;

architecture Behavior of ram is
TYPE MemList IS ARRAY (0 TO 15) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
signal RAM_data: MemList := (others => "0000000000000000");	
BEGIN 
	PROCESS(clock)
	BEGIN
		IF(rising_edge(clock)) THEN
			IF (WRITE_MEMORY = '1') THEN
					RAM_data(to_integer(unsigned(ENDERECO))) <= DATA_IN;
			END IF;
			IF (READ_MEMORY = '1') THEN
				DATA_OUT <= RAM_data(to_integer(unsigned(ENDERECO)));
			END IF;
		END IF;
	END PROCESS;
END;