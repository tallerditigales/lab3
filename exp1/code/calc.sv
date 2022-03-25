module calc
(
	// Valor del operando A
	input [3:0] a_operand_i,
	// Valor del operando B
	input [3:0] b_operand_i,
	// Código de operación a realizar
	input opcode_i,
	// Selector de modo entre signed y unsigned
	input sig_flag_i,
	// Selector de modo entre modo configuración y modo resultado.
	input mode_flag_i,
	// Salida para 7 segmentos de decenas de valor a y bandera z
	output [6:0] display_a_o,
	// Salida para 7 segmentos de unidades de valor a y bandera n
	output [6:0] display_b_o,
	// Salida para 7 segmentos de decenas de resultado y decenas de código de operación
	output [6:0] display_c_o,
	// Salida para 7 segmentos de unidades de resultado y unidades de código de operación
	output [6:0] display_d_o,
	// Salida para 7 segmentos de decenas de valor b y bandera c
	output [6:0] display_e_o,
	// Salida para 7 segmentos de unidades de valor b y bandera v
	output [6:0] display_f_o
);
	logic [6:0] a_operand_tens_r;
	logic [6:0] a_operand_units_r;
	
	logic [6:0] b_operand_tens_r;
	logic [6:0] b_operand_units_r;
	
	
	int opcode_r = 6;
	logic [3:0] result_r;
	
	
	logic [6:0] result_tens_r;
	logic [6:0] result_units_r;
	
	
	logic [6:0] opcode_tens_r;
	logic [6:0] opcode_units_r;
	
	
	logic z_flag_r;
	logic n_flag_r;
	logic c_flag_r;
	logic v_flag_r;
	
	
	logic [6:0] z_display_r;
	logic [6:0] n_display_r;
	logic [6:0] c_display_r;
	logic [6:0] v_display_r;
	
	operand_decoder a_operand_mod (
		.value_i(a_operand_i),
		.tens_o(a_operand_tens_r),
		.units_o(a_operand_units_r),
		.sig(0)
	);
	
	operand_decoder b_operand_mod (
		.value_i(b_operand_i),
		.tens_o(b_operand_tens_r),
		.units_o(b_operand_units_r),
		.sig(0)
	);
	
	opcode_decoder opcode_mod (
		.value_i(opcode_r),
		.tens_o(opcode_tens_r),
		.units_o(opcode_units_r)
	);
	
	operand_decoder result_mod (
		.value_i(result_r),
		.tens_o(result_tens_r),
		.units_o(result_units_r),
		.sig(sig_flag_i)
	);
	
	alu_flags_decoder flags (
		.z_flag_i(z_flag_r),
		.n_flag_i(n_flag_r),
		.v_flag_i(v_flag_r),
		.c_flag_i(c_flag_r),
		.z_display_o(z_display_r),
		.n_display_o(n_display_r),
		.v_display_o(v_display_r),
		.c_display_o(c_display_r)
	);
	
	alu #(.N(4)) alu_mod (
		.opcode_i(opcode_r),
		.a_i(a_operand_i),
		.b_i(b_operand_i),
		.result_o(result_r),
		.c_o(c_flag_r),
		.z_o(z_flag_r),
		.n_o(n_flag_r),
		.v_o(v_flag_r)
	);
	
	always_ff @ (posedge opcode_i)
	begin
		case (opcode_r)
				0: opcode_r = 1;
				1: opcode_r = 2;
				2: opcode_r = 3;
				3: opcode_r = 4;
				4: opcode_r = 5;
				5: opcode_r = 6;
				6: opcode_r = 7;
				7: opcode_r = 9;
				9: opcode_r = 14;
				14: opcode_r = 0;
		endcase
	end
	
	assign display_a_o = (mode_flag_i) ? a_operand_tens_r : z_display_r;
	assign display_b_o = (mode_flag_i) ? a_operand_units_r : n_display_r;
	assign display_c_o = (mode_flag_i) ? opcode_tens_r : result_tens_r;
	assign display_d_o = (mode_flag_i) ? opcode_units_r : result_units_r;
	assign display_e_o = (mode_flag_i) ? b_operand_tens_r : c_display_r;
	assign display_f_o = (mode_flag_i) ? b_operand_units_r : v_display_r;
	
endmodule
