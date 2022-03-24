module AluRegistrosTop
#(parameter N = 4)
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
	logic caux,zaux,naux,vaux;
	
	RegistroCargaInput registro_input(a,b,clk,rst,{x,y});
	alu alu_instance(opcode,x,y,raux,caux,zaux,naux,vaux);
	RegistroCargaOutput registro_output(raux,clk,rst,caux,zaux,naux,vaux,salida,c,n,z,v);
	
endmodule