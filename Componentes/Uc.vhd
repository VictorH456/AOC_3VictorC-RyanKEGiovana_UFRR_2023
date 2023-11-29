--Unidade de controle
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--Entidade
entity Uc is
PORT(
        Clock: in std_logic;
        OpCode 	: in std_logic_vector(3 downto 0);
		  AluOP		: out std_logic_vector(3 downto 0);
		  Jump,Branch,MemRead,MemtoReg,MemWrite,RegWrite,AluSrc: out std_logic
    );
end entity;
architecture Behavior of Uc is
begin
	process(Clock,OpCode)
	Constant Add	: Std_logic_vector(3 downto 0) := "0000";
	Constant Addi  : Std_logic_vector(3 downto 0) := "0001";
	Constant Sub	: Std_logic_vector(3 downto 0) := "0010";
	Constant Subi  : Std_logic_vector(3 downto 0) := "0011";
	Constant Lw		: Std_logic_vector(3 downto 0) := "0100";
	Constant Sw		: Std_logic_vector(3 downto 0) := "0101";
	Constant Li    : STD_LOGIC_VECTOR(3 downto 0) := "0110";
	Constant Beq	: Std_logic_vector(3 downto 0) := "0111";
	Constant If_op	: std_logic_vector(3 downto 0) := "1000";
	Constant J		: Std_logic_vector(3 downto 0) := "1001";
	Constant Mult	: Std_logic_vector(3 downto 0) := "1010";
	Constant Multi : Std_logic_vector(3 downto 0) := "1011";
	
	
	begin
		case OpCode is
			when Add =>
				AluOp 	<= "0000";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
			
			when Addi =>
            AluOp 	<= "0001";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '1';
			
			when Sub =>
				AluOp 	<= "0010";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
			
			when subi =>
				AluOp 	<= "0011";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '1';
			
			when Lw =>
				AluOp 	<= "0100";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '1';
				MemToReg <= '1';
				MemWrite <= '0';
				Alusrc 	<= '0';
			
			when Sw =>
				AluOp 	<= "0101";
				Regwrite <= '0';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '1';
				Alusrc 	<= '0';
			
			when Li =>
				AluOp 	<= "0110";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '1';
			
			when Beq =>
				AluOp 	<= "0111";
				Regwrite <= '0';
				Jump 		<= '0';
				Branch 	<= '1';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
			
			when If_op =>
				AluOp 	<= "1000";
				Regwrite <= '0';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
				
			when Mult =>
				AluOp 	<= "1010";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
			
			when Multi =>
				AluOp 	<= "1011";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '1';
			
			
			
			when others => --J
				AluOp 	<= "1001";
				Regwrite <= '0';
				Jump 		<= '1';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
			end case;
		end process;
end architecture;