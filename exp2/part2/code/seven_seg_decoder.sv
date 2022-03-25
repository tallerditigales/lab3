module seven_seg_decoder
(
	input int value_i,
	output [6:0] output_o
);
	always_comb
	begin
		case (value_i)
			0 : output_o = 7'b1000000;//0
			1 : output_o = 7'b1111001;//1
			2 : output_o = 7'b0100100;//2
			3 : output_o = 7'b0110000;//3
			4 : output_o = 7'b0011001;//4
			5 : output_o = 7'b0010010;//5
			6 : output_o = 7'b0000010;//6
			7 : output_o = 7'b1111000;//7
			8 : output_o = 7'b0000000;//8
			9 : output_o = 7'b0010000;//9
			10: output_o = 7'b1110111;//A
			11: output_o = 7'b0011111;//b
			12: output_o = 7'b0111111;//-
			13: output_o = 7'b0011000;//P
			14: output_o = 7'b1000000;//U
			15: output_o = 7'b0110000;//E
			16: output_o = 7'b1111010;//r
			default: output_o = 7'b0110110;//Error code
		endcase
	end
endmodule
