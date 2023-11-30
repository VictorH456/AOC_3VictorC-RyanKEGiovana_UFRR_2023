# TESTES REALIZADOS
## TESTE 1: Fibonacci
    #Codigo do fibonacci
      | 0 => "0110000000001000",	-- n Li S0 0
      | 1 => "0110000100010001",	-- fat Li S1 1	
	  | 2 => "0110001000100001",  -- i Li S2 1
	  | 3 => "1000000000000010",  -- If S0 == S2
	  | 4 => "0111001000001000",	-- beq s2 s0 jump 1000
	  | 5 => "1010000100010010",	-- fat mult S1 S1 S2
	  | 6 => "0001001000100001",	-- i addi S2 S2 1
	  | 7 => "1001000000000011",	-- J 0011

![Teste Fibonacci](https://github.com/VictorH456/AOC_3VictorC-RyanKEGiovana_UFRR_2023/blob/main/Testes/Waveform_fibonacci.jpg
)
## TESTE 2: Fatorial
    #Codigo do fatorial
            |0 => "0001000000000000", -- Addi S0 0
		|1 => "0101000000000000", -- Sw S0
		|2 => "0001000000000001", -- Addi S0 1
		|3 => "0001000100010001", -- Addi S1 1
		|4 => "0100001000100000", -- Lw S2 00
		|5 => "0000001000100001", -- Add S2 S1
		|6 => "0000000100010000", -- Add S1 S0
		|7 => "0100000000000000", -- Lw S0 00
		|8 => "0000000000000010", -- Add S0 S2
		|9 => "1001000000000100", -- J 0100

![Teste Fatorial](https://github.com/VictorH456/AOC_3VictorC-RyanKEGiovana_UFRR_2023/blob/main/Testes/Waveform_fatorial.png)
