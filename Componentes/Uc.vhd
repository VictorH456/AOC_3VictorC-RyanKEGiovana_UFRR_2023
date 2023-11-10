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
		  Jump,Branch,MemToRead,MemtoReg,MemWrite,RegWrite,AluSrc: out std_logic
    );
end entity;
architecture Behavior of Uc is
	
	type Operacao is (Add, Sub, Lw, Sw, Beq, J);
   signal OperacaoAtual : Operacao;

begin
	process(Clock,OpCode)
	begin
	OperacaoAtual <= to_enum(Operacao, unsigned(OpCode));
		case OpCode is
			when Add =>
				AluOp 	<= "0000";
				Regwrite <= '0';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
				
			when Sub =>
				AluOp 	<= "0001";
				Regwrite <= '0';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
				
			when Lw =>
				AluOp 	<= "0010";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '1';
				MemToReg <= '1';
				MemWrite <= '0';
				Alusrc 	<= '0';
				
			when Sw =>
				AluOp 	<= "0011";
				Regwrite <= '1';
				Jump 		<= '0';
				Branch 	<= '0';
				MemRead 	<= '1';
				MemToReg <= '1';
				MemWrite <= '0';
				Alusrc 	<= '0';
				
			when Beq =>
				AluOp 	<= "0100";
				Regwrite <= '0';
				Jump 		<= '0';
				Branch 	<= '1';
				MemRead 	<= '0';
				MemToReg <= '0';
				MemWrite <= '0';
				Alusrc 	<= '0';
				
			when J =>
				AluOp 	<= "0101";
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