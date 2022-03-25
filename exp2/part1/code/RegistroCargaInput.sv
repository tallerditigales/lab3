module RegistroCargaInput
#(parameter N = 4)
(
	clk,rst,a_in,b_in,opcode_in,
			a_out,b_out,opcode_out
);

	input logic clk;
	input logic rst;

	input logic [N-1:0] a_in;
	input logic [N-1:0] b_in;
	input logic [3:0] opcode_in;

	output logic [N-1:0] a_out;
	output logic [N-1:0] b_out;
	output logic [3:0] opcode_out;
	
	always @ (posedge clk or posedge rst)
		if(rst)
		
			begin
		
				a_out <= 0;
				b_out <= 0;
				opcode_out <= 0;
				
			end
		
		else
	
			begin
						
				a_out = a_in;
				b_out = b_in;
				opcode_out = opcode_in;
				
			end
	
endmodule