module alu
#(parameter N = 4)
(
	input [3:0] opcode_i,
	input [N-1:0] a_i,
	input [N-1:0] b_i,
	output [N-1:0] result_o,
	output c_o,
	output z_o,
	output n_o,
	output v_o
);
	`include "alu_defs.sv"
	
	reg [N-1:0] result_r;
	wire [N-1:0] arith_result_w;
	wire [N-1:0] logic_result_w;
	
	arith_unit #(.N(N)) arithmetics (
		.a_i(a_i),
		.b_i(b_i),
		.opcode_i({opcode_i[3], opcode_i[2], opcode_i[1]}),
		.result_o(arith_result_w),
		.overflow_o(v_o),
		.cout_o(c_o)
	);
	
	logic_unit #(.N(N)) logics (
		.a_i(a_i),
		.b_i(b_i),
		.opcode_i({opcode_i[3], opcode_i[2], opcode_i[1]}),
		.result_o(logic_result_w)
	);
	
	always @ (opcode_i or arith_result_w or logic_result_w)
	begin
		case (opcode_i[0])
			`ARITH_RESULT:
			begin
				result_r = arith_result_w;
			end
			`LOGIC_RESULT:
			begin
				result_r = logic_result_w;
			end
			default:
			begin
				result_r = 0;
			end
		endcase
	end
	
	assign n_o = result_r[N-1];
	assign z_o = (result_r == '0);
	assign result_o = result_r;
endmodule