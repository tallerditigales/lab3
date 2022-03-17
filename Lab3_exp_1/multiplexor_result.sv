module multiplexor_result #(parameter N=4)
	(input [N:0] _SUM,_REST,_MULT,_DIV,_MOD,_AND,_OR,_XOR,_SHR,_SHL,
	 input [N:0] ss,
	 output [3:0] result); 
	 
	logic [N:0] aux;
	always @(ss) begin
	
		case(ss)
			0: aux = _SUM;  // suma
			1: aux = _REST; // resta
			2: aux = _MULT; // multiplicacion
			3: aux = _DIV;  // division
			4: aux = _MULT; // module
			5: aux = _DIV;  // and
			6: aux = _MULT; // or
			7: aux = _DIV;  // xor
			8: aux = _MULT; // shift right
			9: aux = _DIV;  // shift left

			default: aux=0;
	
		endcase
	end
	
	assign result = aux;

endmodule