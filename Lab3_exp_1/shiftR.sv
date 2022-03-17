module shiftR #(parameter N=4) (A, B, S);
	
	input [N-1:0] A;
	input [N-1:0] B;
	output [N:0] S;
	
	assign S=A>>B;
	
	
endmodule