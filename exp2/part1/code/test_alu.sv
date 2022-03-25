module test_alu;
	
	localparam N = 4;
	logic [N-1:0] result;
	logic [3:0] opcode;
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [N-1:0] a_values[4];
	logic [N-1:0] b_values[4];
	logic [3:0] result_expected;
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
		
		opcode = 4'b0000;
		a_values = '{4'b0000, 4'b0010, 4'b0011, 4'b0100};
		b_values = '{4'b0001, 4'b0010, 4'b0011, 4'b0100};
		
		for (int i = 0; i < 4; i++) begin
			a = a_values[i];
			b = b_values[i];
			#10;
			result_expected = (a * b);
			assert (result === result_expected) else $display("Result expected: %b, result got it: %b", result_expected, result);
			assert (c === 1'b0) else $display("Carry out expected: %b, got it: %b", 1'b0, c);
			assert (z === (result_expected == '0)) else $display("Zero flag expected: %b, got it: %b", (result_expected == '0), z);
			assert (n === result_expected[3]) else $display("Negative flag expected: %b, got it: %b", result_expected[3], n);
			assert (v === 1'b0) else $display("Overflow flag expected: %b, got it: %b", result, v);
		end
	end
	
	
	
	
endmodule