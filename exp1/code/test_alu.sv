module test_alu;
	
	localparam N = 4;
	logic [N-1:0] result;
	logic [3:0] opcode;
	logic [N-1:0] a;
	logic [N-1:0] b;
	logic [N-1:0] a_values[7];
	logic [N-1:0] b_values[7];
	logic [N:0] result_expected;
	logic [N:0] temp_arith_result;
	logic c_expected;
	logic z_expected;
	logic n_expected;
	logic v_expected;
	logic c, z, n, v;
	int opcode_values[10];
	
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
		// Incialización de variables
		opcode = 4'b0;
		a = 4'b0;
		b = 4'b0;
		#10;
		// Inicialización de operaciones a probar y valores de prueba
		opcode_values = '{0, 1, 2, 3, 4, 5, 6, 7, 9, 14};
		a_values = '{0, 2, 3, 4, 5, 6, 7};
		b_values = '{1, 2, 3, 4, 3, 2, 8};
		
		for (int j = 0; j < $size(opcode_values); j++) begin
			opcode = opcode_values[j];
			for (int i = 0; i < $size(a_values); i++) begin
				// Inicialización de operandos y resultado esperado
				a = a_values[i];
				b = b_values[i];
				case (opcode)
					4'b0000: result_expected = a * b;
					4'b0001: result_expected = a >> b;
					4'b0010: result_expected = a / b;
					4'b0011: result_expected = a << b;
					4'b0100: result_expected = a % b;
					4'b0101: result_expected = a & b;
					4'b0110: result_expected = a + b;
					4'b0111: result_expected = a ^ b;
					4'b1001: result_expected = a | b;
					4'b1110: result_expected = a - b;
					default: $error("Opcode unknown: %b", opcode);
				endcase
				
				// Inicialziación de bandera de carry out
				if (opcode[3:1] == 4'b011 || opcode[3:1] == 4'b111) 
					c_expected = result_expected[N];
				else
					c_expected = 1'b0;
				
				// Inicialización de bandera de zero
				z_expected = result_expected[N-1:0] == '0;
				
				// Inicialización de bandera de negativo
				n_expected = result_expected[N-1];
				
				// Inicialización de bandera de overflow 
				// según si se utiliza una operación aritmética o 
				// una operación lógica que indirectamente provoca el levantamiento de esta bandera
				if (opcode == 4'b0110)
					v_expected = ~(a[N-1] ^ b[N-1]) & (result_expected[N-1] ^ b[N-1]);
				else if (opcode == 4'b1110) 
					v_expected = (a[N-1] ^ b[N-1]) & (result_expected[N-1] == b[N-1]);
				else if (opcode == 4'b1111) begin
					temp_arith_result = a - b;
					v_expected = (a[N-1] ^ b[N-1]) & (temp_arith_result[N-1] == b[N-1]);
				end
				else if (opcode == 4'b0111) begin
					temp_arith_result = a + b;
					v_expected = ~(a[N-1] ^ b[N-1]) & (temp_arith_result[N-1] ^ b[N-1]);
				end
				else
					v_expected = 1'b0;
				#10;
				
				// Verficación de resultados
				assert (result === result_expected[N-1:0]) else $error("Result expected: %b, result got it: %b", result_expected, result);
				assert (c === c_expected) else $error("Carry out expected: %b, got it: %b", c_expected, c);
				assert (z === z_expected) else $error("Zero flag expected: %b, got it: %b", z_expected, z);
				assert (n === n_expected) else $error("Negative flag expected: %b, got it: %b", n_expected, n);
				assert (v === v_expected) else $error("Overflow flag expected: %b, got it: %b", v_expected, v);
			end
		end
	end
endmodule