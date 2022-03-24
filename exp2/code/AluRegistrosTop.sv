module AluRegistrosTop
#(parameter N = 16)
(
	input [3:0] opcode,
	input [N-1:0] a,
	input [N-1:0] b,
	input clk,
	input rst,
	output [N-1:0] salida
);

	logic [N-1:0] x,y,raux;
	
	RegistroCargaInput #(N) registro_input (a,b,clk,rst,{x,y});
	
	alu #(N) alu_instance (opcode,x,y,raux);
	
	
	RegistroCargaOutput #(N) registro_output (raux,clk,rst,salida);
	
endmodule