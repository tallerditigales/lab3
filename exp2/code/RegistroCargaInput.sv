module RegistroCargaInput
#(parameter N = 16)
(
	input [N-1:0] a,
	input [N-1:0] b,
	input clk,
	input rst,
	output [(2*N)-1:0] s
);

	logic saux=0;
	always @ (posedge clk or posedge rst)
		if (rst)
			saux=0;
		else
			saux={a,b};
	
	assign s=saux;
	
endmodule