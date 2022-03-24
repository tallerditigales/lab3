module RegistroCargaOutput
#(parameter N = 4)
(
	input [N-1:0] s,
	input clk,
	input rst,
	input c,
	input z,
	input n,
	input v,
	output [N-1:0] r,
   output c_flag,
	output z_flag,
	output n_flag,
	output v_flag

);

	logic raux=0;
	logic caux=0;
	logic zaux=0;
	logic naux=0;
	logic vaux=0;
	
	always @ (negedge clk or posedge rst)
		if (rst) begin
			raux=0;
			caux = 0;
			zaux = 0;
			naux = 0;
			vaux = 0;
		end else begin
			raux=s;
			caux = c;
			zaux = z;
			naux = n;
			vaux = v;
		end
	
	assign r=raux;
	assign c_flag=caux;
	assign z_flag=zaux;
	assign n_flag=naux;
	assign v_flag=vaux;
	
endmodule