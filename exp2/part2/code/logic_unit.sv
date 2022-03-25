module logic_unit
#(parameter N = 4)
(
	input [N-1:0] a_i,
	input [N-1:0] b_i,
	input [2:0] opcode_i,
	output [N-1:0] result_o
);
	
	import alu_defs::LOGIC_SHIFTR;
	import alu_defs::LOGIC_SHIFTL;
	import alu_defs::LOGIC_AND;
	import alu_defs::LOGIC_XOR;
	import alu_defs::LOGIC_OR;
	
	logic [N-1:0] result_r;
	
	always_comb
	begin
		case (opcode_i)
			LOGIC_SHIFTR:
			begin
				result_r = (a_i >> b_i);
			end
			LOGIC_SHIFTL:
			begin
				result_r = (a_i << b_i);
			end
			LOGIC_AND:
			begin
				result_r = (a_i & b_i);
			end
			LOGIC_XOR:
			begin
				result_r = (a_i ^ b_i);
			end
			LOGIC_OR:
			begin
				result_r = (a_i | b_i);
			end
			default:
			begin
				result_r = '0;
			end
		endcase
	end
	
	assign result_o = result_r;
	
endmodule