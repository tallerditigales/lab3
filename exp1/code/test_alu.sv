module test_alu;
	
	localparam N = 4;
	logic [N-1:0] result;
	logic [3:0] opcode;
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [N-1:0] a_values[4];
	logic [N-1:0] b_values[4];
	logic [N:0] result_expected;
	logic c_expected;
	logic z_expected;
	logic n_expected;
	logic v_expected;
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
			if (opcode inside {4'b0110, 4'b1110})
				c_expected = result_expected[N];
			else
				c_expected = 1'b0;
			z_expected = result_expected == '0;
			n_expected = result_expected[N-1];
			
			if (opcode === 4'b0110) v_expected = ~(a[N-1] ^ b[N-1]) & (result_expected[N-1] ^ b[N-1]);
			else if (opcode === 4'b1110) v_expected = (a[N-1] ^ b[N-1]) & (result_expected[N-1] == b[N-1]);
			else v_expected = 1'b0;
			
			assert (result === result_expected) else $display("Result expected: %b, result got it: %b", result_expected, result);
			assert (c === c_expected) else $display("Carry out expected: %b, got it: %b", c_expected, c);
			assert (z === z_expected) else $display("Zero flag expected: %b, got it: %b", z_expected, z);
			assert (n === n_expected) else $display("Negative flag expected: %b, got it: %b", n_expected, n);
			assert (v === v_expected) else $display("Overflow flag expected: %b, got it: %b", v_expected, v);
		end
	end
	
	
	
	
endmodule