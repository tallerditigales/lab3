module calc  #(parameter N=4) (A, B, ss, S, flags);
	input [N-1:0] A, B;
	input [N:0] ss;
	output [N-1:0] S;
	output [3:0] flags;
	
	// Wires
	logic [N-1:0] _SUM,_REST,_MULT,_DIV,_MOD,_AND,_OR,_XOR,_SHR,_SHL;
	
	
	// Operations
	Alu alu(A, B, _SUM,_REST,_MULT,_DIV,_MOD,_AND,_OR,_XOR,_SHR,_SHL);
	multiplexor_result mux_result (_SUM,_REST,_MULT,_DIV,_MOD,_AND,_OR,_XOR,_SHR,_SHL, ss, S);
	multiplexor_flags mux_flags (S, ss, flags);
	
endmodule

