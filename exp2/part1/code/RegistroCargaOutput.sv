module RegistroCargaOutput
#(parameter N = 4)
(
	clk,rst,
	r_in,c_in,z_in,n_in,v_in,
	r_out,c_out,z_out,n_out,v_out
);

	input logic clk;
	input logic rst;
	
	input logic [N-1:0] r_in;
	input logic c_in;
	input logic z_in;
	input logic n_in;
	input logic v_in;
	
	output logic [N-1:0] r_out;
	output logic c_out;
	output logic z_out;
	output logic n_out;
	output logic v_out;
	
	
	always @ (negedge clk or posedge rst)
		if(rst)
		
		begin
		
			r_out <= 0;
			c_out <= 0;
			z_out <= 0;
			n_out <= 0;
			v_out <= 0;
					
		end
		
	else
	
		begin
		
			r_out = r_in;
			c_out = c_in;	
			z_out = z_in;
			n_out = n_in;
			v_out = v_in;
					
		end
	
endmodule