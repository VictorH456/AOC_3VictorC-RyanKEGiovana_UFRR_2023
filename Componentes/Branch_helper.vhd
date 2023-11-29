-- Branch_helper
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Branch_helper IS
    PORT(
        A : IN STD_LOGIC;
        S : OUT STD_LOGIC
    );
END;

ARCHITECTURE BEHAVIOR OF Branch_helper IS
BEGIN
    S <= A;
END;
