module logic_unit
#(parameter N = 4)
(
	input [N-1:0] a_i,
	input [N-1:0] b_i,
	input [2:0] opcode_i,
	output logic [N-1:0] result_o
);
	
	import alu_defs::LOGIC_SHIFTR;
	import alu_defs::LOGIC_SHIFTL;
	import alu_defs::LOGIC_AND;
	import alu_defs::LOGIC_XOR;
	import alu_defs::LOGIC_OR;
	
	always_comb
	begin
		case (opcode_i)
			LOGIC_SHIFTR: result_o = (a_i >> b_i);
			LOGIC_SHIFTL: result_o = (a_i << b_i);
			LOGIC_AND: result_o = (a_i & b_i);
			LOGIC_XOR: result_o = (a_i ^ b_i);
			LOGIC_OR: result_o = (a_i | b_i);
			default: result_o = '0;
		endcase
	end
	
endmodule