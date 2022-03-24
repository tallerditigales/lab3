module logic_unit
#(parameter N = 16)
(
	input [N-1:0] a_i,
	input [N-1:0] b_i,
	input [2:0] opcode_i,
	output [N-1:0] result_o
);
	
	`include "alu_defs.sv"
	logic [N-1:0] result_r;
	
	always @ (a_i or b_i or opcode_i)
	begin
		case (opcode_i)
			`LOGIC_SHIFTR:
			begin
				result_r = (a_i >> b_i);
			end
			`LOGIC_SHIFTL:
			begin
				result_r = (a_i << b_i);
			end
			`LOGIC_AND:
			begin
				result_r = (a_i & b_i);
			end
			`LOGIC_XOR:
			begin
				result_r = (a_i ^ b_i);
			end
			`LOGIC_OR:
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