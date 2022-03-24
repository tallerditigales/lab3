module AluRegistrosTop
#(parameter N = 2)
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
	output [N-1:0] salida
	
);

	logic [N-1:0] x,y,raux;
	
	RegistroCargaInput #(N) registro_input (a,b,clk,rst,{x,y});
	calc #(N) alu_instance (x,y,opcode,sig_flag,mode_flag,raux,display_a,display_b,display_c,display_d,display_e,display_f);
	RegistroCargaOutput #(N) registro_output (raux,clk,rst,salida);
	
endmodule