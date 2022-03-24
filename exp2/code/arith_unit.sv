module arith_unit
#(parameter N = 16)
(
	input [N-1:0] a_i,
	input [N-1:0] b_i,
	input [2:0] opcode_i,
	output [N-1:0] result_o,
	output overflow_o,
	output cout_o
);
	`include "alu_defs.sv"
	
	logic [2*N-1:0] result_r;
	logic overflow_r = 0;
	logic cout_r = 0;
	
	
	always @ (a_i or b_i or opcode_i)
	begin
		case (opcode_i)
			`ARITH_ADD:
			begin
				result_r = (a_i + b_i);
				overflow_r = ~(a_i[N-1] ^ b_i[N-1]) & (result_r[N-1] ^ b_i[N-1]);
				cout_r = result_r[N];
			end
			`ARITH_SUB:
			begin
				result_r = (a_i - b_i);
				overflow_r = (a_i[N-1] ^ b_i[N-1]) & (result_r[N-1] == b_i[N-1]);
				cout_r = result_r[N];
			end
			`ARITH_DIV:
			begin
				result_r = (a_i / b_i);
			end
			`ARITH_MUL:
			begin
				result_r = (a_i * b_i);
				overflow_r = (result_r[2*N-1:N] != {N{1'b0}});
			end
			`ARITH_MOD:
			begin
				result_r = (a_i % b_i);
			end
			default:
			begin
				result_r = '0;
			end
		endcase
	end
	
	assign result_o = result_r[N-1:0];
	assign overflow_o = overflow_r;
	assign cout_o = cout_r;
endmodule