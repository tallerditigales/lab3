module flag_decoder 
(
	input flag_i,
	output [6:0] output_o
);
	assign output_o = (flag_i) ? 7'b11111001: 7'b1000000;
endmodule