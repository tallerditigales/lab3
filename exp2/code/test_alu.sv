module test_alu;
	
	localparam N = 4;
	logic [N-1:0] result;
	logic [3:0] opcode;
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic c, z, n, v;
	
	alu #(.N(N)) alu_unit (
		.opcode_i(opcode),
		.a_i(a),
		.b_i(b),
		.result_o(result),
		.c_o(c),
		.z_o(z),
		.n_o(n),
		.v_o(v)
	);
	
	initial begin
		opcode = 4'b0;
		a = 4'b0;
		b = 4'b0;
		#10;
		a = 4'b0001;
		b = 4'b0011;
		opcode = 4'b0011;
		#10;
	end
	
	
	
	
endmodule