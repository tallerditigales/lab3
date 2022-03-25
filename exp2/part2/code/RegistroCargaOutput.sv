module RegistroCargaOutput
#(parameter N = 4)
(
	input [N-1:0] s,
	input clk,
	input rst,
	output [N-1:0] r

);

	logic raux=0;
	
	always_ff @ (posedge clk or posedge rst)
		if (rst) 
			raux=0;
		else 
			raux=s;
	
	assign r=raux;
	
endmodule