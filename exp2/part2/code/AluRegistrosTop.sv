module AluRegistrosTop
#(parameter N = 4)
(

	input sig_flag,
	input mode_flag,
	
	input opcode,
	input [N-1:0] a,
	input [N-1:0] b,
	input clk,
	input rst,
	
	output [6:0] display_a,
	output [6:0] display_b,
	output [6:0] display_c,
	output [6:0] display_d,
	output [6:0] display_e,
	output [6:0] display_f,
	
	output [N-1:0] reg_saved
);

	logic [N-1:0] x,y;
	
	RegistroCargaInput #(N) registro_input (a,b,clk,rst,{x,y});
	calc #(N) alu_instance (
		x,
		y,
		opcode,
		sig_flag,
		mode_flag,
		reg_saved,
		display_a,
		display_b,
		display_c,
		display_d,
		display_e,
		display_f
	);
	RegistroCargaOutput #(N) registro_output (reg_saved,clk,rst,salida);
	
endmodule