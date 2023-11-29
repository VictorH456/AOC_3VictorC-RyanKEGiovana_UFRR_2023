--Processador
--PC
--Bibliotecas e pacotes
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
--Entidade
entity Processador is

	port(	
		Clock:	in std_logic;
		Pc_out, Rom_out, Rs_value_out,rt_value_out, Ula_result, Ram_out,Mux2_out, Adress_out:		out std_logic_vector(15 downto 0);
		Opcode_out, Rs_out, rt_out, rd_out:		out std_logic_vector(3 downto 0)
		);
end entity;

	
architecture Behavior of Processador is

signal R_A,R_B,R_C,MEM_RAM,ALU_OUT:	 			std_logic_vector(15 downto 0);
signal MUX1,MUX2,MUX3,MUX4: 						std_logic_vector(15 downto 0);
signal SINAL_EXTENSOR_4X16:						std_logic_vector(15 downto 0);
signal MEM_ROM,OUT_CONTADOR_PC,OUT_PC:			std_logic_vector(15 downto 0);
signal OPC:	 											std_logic_vector(3 downto 0);
signal ADDR:	 										std_logic_vector(15 downto 0);
signal R1, R2, R3: 									std_logic_vector(3 downto 0);
signal FLAG_ALUOP: 									std_logic_vector(3 downto 0);
signal FLAG_JUMP,FLAG_BRANCH: 					std_logic;
signal FLAG_MEMREAD,FLAG_MEMTOREG:	 			std_logic;
signal FLAG_MEMWRITE,FLAG_ALUSRC: 				std_logic;
signal FLAG_REGWRITE:	 							std_logic;
signal ALU_Z,AND_0:					std_logic;

component PC is
	port (
		Clock: 					in std_logic; -- sinal do Clock
		enderecoDEentrada: 	in std_logic_vector (15 downto 0); --Sinal do enderço
		enderencoDEsaida:  	out std_logic_vector (15 downto 0) 
		); 
end component;


component somador is
	port(
	Clock:		in std_logic;
	entrada:		in std_logic_vector(15 downto 0);
	saida:		out std_logic_vector(15 downto 0)
	);
end component;


component Divisor is
	port(
	instrucao:					in std_logic_vector(15 downto 0);
	opcode, rs, rt, rd:		out std_logic_vector(3 downto 0);
	endereco:					out std_logic_vector(15 downto 0)
	);
end component;



component Registradores is
	port(
	Clock, Reg_Write: in std_logic;
	Reg1, Reg2, Reg3: in std_logic_vector (3 downto 0);
	Write_data: in std_logic_vector (15 downto 0);
	RegA_de_saida: out std_logic_vector (15 downto 0);
	RegB_de_saida: out std_logic_vector (15 downto 0)
	);
end component;
component Extensor4x16 is
	port(
	entrada:		in std_logic_vector(3 downto 0);
	saida:		out std_logic_vector(15 downto 0)
	);
end component;


component Ram is 
	port(
	Clock,WRITE_MEMORY, READ_MEMORY: in std_logic;
	ENDERECO: in std_logic_vector (15 downto 0); 
	DATA_IN: in std_logic_vector (15 downto 0);
	DATA_OUT: out std_logic_vector (15 downto 0)
);
end component;

component Rom is
	port(
		  Clock: in std_logic;
        endereco : in std_logic_vector(15 downto 0);
        saida    : out std_logic_vector(15 downto 0)
);
end component;

component multiplexador is
	port(
		a, b:		in std_logic_vector(15 downto 0);
		s:			in std_logic;
		z:			out std_logic_vector(15 downto 0)
);
end component;

component ula is
	port(
			Clock: 			in std_logic;
			AluOp:			in std_logic_vector(3 downto 0);
			rs,rd:		in std_logic_vector(15 downto 0);
			resultado:		out std_logic_vector(15 downto 0);
			z:					out std_logic
);
end component;

component Uc is 
	port(
        Clock: in std_logic;
        OpCode 	: in std_logic_vector(3 downto 0);
		  AluOP		: out std_logic_vector(3 downto 0);
		  Jump,Branch,MemRead,MemtoReg,MemWrite,RegWrite,AluSrc: out std_logic
);
end component;

begin
	
	comp_somador_pc: somador port map(Clock, OUT_PC, OUT_CONTADOR_PC);
	comp_pc: PC port map(Clock, MUX4, OUT_PC);
	comp_rom: Rom port map(Clock, OUT_PC,MEM_ROM);
	
	comp_divisor_instrucao: Divisor port map(MEM_ROM, OPC, R1, R2, R3, ADDR);
	
	comp_Uc: Uc port map(Clock, OPC, FLAG_ALUOP,FLAG_JUMP, FLAG_BRANCH, FLAG_MEMREAD, FLAG_MEMTOREG, FLAG_MEMWRITE, FLAG_REGWRITE, FLAG_ALUSRC);
	comp_registradores: Registradores port map(Clock, FLAG_REGWRITE, R1, R2, R3, MUX2, R_A, R_B);
	comp_extensor1: Extensor4x16 port map(R3, SINAL_EXTENSOR_4X16);
	comp_mux1: multiplexador port map(R_B, SINAL_EXTENSOR_4X16, FLAG_ALUSRC, MUX1);
	comp_ula: Ula port map(Clock, FLAG_ALUOP, R_A, MUX1, ALU_OUT, ALU_Z);
	comp_ram: Ram port map(Clock, FLAG_MEMWRITE, FLAG_MEMREAD, ALU_OUT, SINAL_EXTENSOR_4X16, MEM_RAM);
	comp_mux_2: multiplexador port map(ALU_OUT, MEM_RAM, FLAG_MEMTOREG, MUX2);
	Comp_mux_3: multiplexador port map(OUT_CONTADOR_PC, ADDR, AND_0, MUX3);
   Comp_mux_4: multiplexador port map(MUX3, ADDR, FLAG_JUMP, MUX4);
	
	AND_0 <= FLAG_BRANCH and ALU_Z;
	Pc_out           <= OUT_PC;
   Rom_out          <= MEM_ROM;
   Opcode_out       <= OPC;
   Rs_value_out     <= R_A;
   rt_value_out    <= R_B;
   Adress_out      <= ADDR;
   Rs_out          <= R1;
   rt_out          <= R2;
	rd_out          <= R3;
   Ula_result   <= ALU_OUT;
   Ram_out          <= MEM_RAM;
   Mux2_out        <= MUX2;
end architecture;