module alu_flags_decoder
(
	input z_flag_i,
	input n_flag_i,
	input v_flag_i,
	input c_flag_i,
	output [6:0] z_display_o,
	output [6:0] n_display_o,
	output [6:0] v_display_o,
	output [6:0] c_display_o
);
	flag_decoder z_flag_mod (
		.flag_i(z_flag_i),
		.output_o(z_display_o)
	);
	
	flag_decoder n_flag_mod (
		.flag_i(n_flag_i),
		.output_o(n_display_o)
	);
	
	flag_decoder v_flag_mod (
		.flag_i(v_flag_i),
		.output_o(v_display_o)
	);
	
	flag_decoder c_flag_mod (
		.flag_i(c_flag_i),
		.output_o(c_display_o)
	);
endmodule