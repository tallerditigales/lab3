module testCalc ();

	// Variables
	logic [3:0] a, b, s, flags;
	logic [4:0] ss;
	parameter N = 4;

	// Incialización del parámetro con la cantidad de bits.
	calc #(.N(4)) calculadora (
	 .A(a),
	 .B(b),
	 .S(s),
	 .ss(ss),
	 .flags(flags)
	);
	
	initial begin
	a = 4'b0001; b = 4'b0011; ss = 2'b00; #15;	
//	a = {1'b0, 1'b0, 1'b0, 1'b0}; b = {1'b1, 1'b0, 1'b0, 1'b0}; #15;
	end


endmodule