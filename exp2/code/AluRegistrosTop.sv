module AluRegistrosTop
#(parameter N = 2)
(
	input [3:0] opcode,
	input [N-1:0] a,
	input [N-1:0] b,
	input clk,
	input rst,
	output [N-1:0] salida,
	output c,
	output z,
	output n,
	output v
);

	logic [N-1:0] x,y,raux;
	
	RegistroCargaInput registro_input(a,b,clk,rst,{x,y});
	alu alu_instance(opcode,a,b,salida,c,z,n,v);
	RegistroCargaOutput registro_output(raux,clk,rst,salida);
	
endmodule