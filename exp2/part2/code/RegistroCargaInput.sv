module RegistroCargaInput
#(parameter N = 4)
(
	input [N-1:0] a,
	input [N-1:0] b,
	input clk,
	input rst,
	output logic [(2*N)-1:0] s
);
	always_ff @ (posedge clk, negedge rst) begin
		if (!rst)
			s <= '0;
		else
			s <= {a,b};
	end
	
endmodule