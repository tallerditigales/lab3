module AluRegistrosTop
#(parameter N = 4)
(
	clk, rst, 
	a_in_in, b_in_in, opcode_in_in,
	r_out_out, c_out_out, z_out_out, n_out_out, v_out_out
);
	input logic clk;
	input logic rst;
	
	// Registro de entrada
	input logic [N-1:0] a_in_in;
	input logic [N-1:0] b_in_in;
	input logic [3:0] opcode_in_in;
	
	logic [N-1:0] a_out_in;
	logic [N-1:0] b_out_in;
	logic [3:0] opcode_out_in;	
	
	
	// Registro de salida
	logic [N-1:0] r_in_out;
	logic c_in_out;
	logic z_in_out;
	logic n_in_out;
	logic v_in_out;
	
	output logic [N-1:0] r_out_out;
	output logic c_out_out;
	output logic z_out_out;
	output logic n_out_out;
	output logic v_out_out;
	
	
	RegistroCargaInput #(.N(N)) registro_input (clk,rst, a_in_in,b_in_in, opcode_in_in, 
																	a_out_in, b_out_in, opcode_out_in);
																	
	alu #(.N(N)) alu_instance (opcode_out_in, a_out_in, b_out_in, r_in_out, c_in_out, z_in_out, n_in_out, v_in_out);
	
	
	RegistroCargaOutput #(.N(N)) registro_output (clk,rst, r_in_out, c_in_out, z_in_out, n_in_out, v_in_out,
																	r_out_out, c_out_out, z_out_out, n_out_out, v_out_out);
	
endmodule