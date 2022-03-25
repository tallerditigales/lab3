module operand_decoder
(
	input [3:0] value_i,
	input logic sig,
	output [6:0] tens_o,
	output [6:0] units_o
);
	int tens_r;
	int units_r;
	
	seven_seg_decoder tens (
		.value_i(tens_r),
		.output_o(tens_o)
	);
	
	seven_seg_decoder units (
		.value_i(units_r),
		.output_o(units_o)
	);
	
	always_comb
	begin
		case (value_i)
			0:
			begin
				tens_r = '0;
				units_r = '0;
			end
			1:
			begin
				tens_r = '0;
				units_r = 1;
			end
			2:
			begin
				tens_r = '0;
				units_r = 2;
			end
			3:
			begin
				tens_r = '0;
				units_r = 3;
			end
			4:
			begin
				tens_r = '0;
				units_r = 4;
			end
			5:
			begin
				tens_r = '0;
				units_r = 5;
			end
			6:
			begin
				tens_r = '0;
				units_r = 6;
			end
			7:
			begin
				tens_r = '0;
				units_r = 7;
			end
			8:
			begin
				tens_r = sig ? 12: '0;
				units_r = 8;
			end
			9:
			begin
				tens_r = sig ? 12: '0;
				units_r = sig ? 7: 9;
			end
			10:
			begin
				tens_r = sig ? 12: 1;
				units_r = sig ? 6: '0;
			end
			11:
			begin
				tens_r = sig ? 12: 1;
				units_r = sig ? 5: 1;
			end
			12:
			begin
				tens_r = sig ? 12: 1;
				units_r = sig ? 4: 2;
			end
			13:
			begin
				tens_r = sig ? 12: 1;
				units_r = 3;
			end
			14:
			begin
				tens_r = sig ? 12: 1;
				units_r = sig ? 2: 4;
			end
			15:
			begin
				tens_r = sig ? 12: 1;
				units_r = sig ? 1: 5;
			end
			default:
			begin
				tens_r = 15;
				units_r = 16;
			end
		endcase
	end
endmodule