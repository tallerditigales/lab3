module Alu #(parameter N=4) (input [N-1:0] A, B, output [N-1:0] RSUM,RSUB,RMULT,RDIV,RMOD,RAND,ROR,RXOR,RSHR,RSHL);

	// Resultados de la operacion
	logic [N:0] R_aux_SUM,R_aux_SUB,R_aux_MULT,R_aux_DIV,R_aux_MOD,R_aux_AND,R_aux_OR,R_aux_XOR,R_aux_SHR,R_aux_SHL;

	sumador adder (A,B,R_aux_SUM);
	restador substractor (A,B,R_aux_SUB);
	multiplicador multiplier (A,B,R_aux_MULT);
	division divisor (A,B,R_aux_DIV);
	modulo modulus (A,B,R_aux_MOD);
	and_op _and (A,B,R_aux_AND);
	or_op _or (A,B,R_aux_OR);
	xor_op _xor (A,B,R_aux_XOR);
	shiftR _shiftR (A,B,R_aux_SHR);
	shiftL _shiftL (A,B,R_aux_SHL);
	
	assign RSUM = {R_aux_SUM[3],R_aux_SUM[2],R_aux_SUM[1],R_aux_SUM[0]};
	
	assign RSUB = {R_aux_SUB[3],R_aux_SUB[2],R_aux_SUB[1],R_aux_SUB[0]};
	
	assign RMULT = {R_aux_MULT[3],R_aux_MULT[2],R_aux_MULT[1],R_aux_MULT[0]};
	
	assign RDIV = {R_aux_DIV[3],R_aux_DIV[2],R_aux_DIV[1],R_aux_DIV[0]};
	
	assign RMOD = {R_aux_MOD[3],R_aux_MOD[2],R_aux_MOD[1],R_aux_MOD[0]};
	
	assign RAND = {R_aux_AND[3],R_aux_AND[2],R_aux_AND[1],R_aux_AND[0]};
	
	assign ROR = {R_aux_OR[3],R_aux_OR[2],R_aux_OR[1],R_aux_OR[0]};
	
	assign RXOR = {R_aux_XOR[3],R_aux_XOR[2],R_aux_XOR[1],R_aux_XOR[0]};
	
	assign RSHR = {R_aux_SHR[3],R_aux_SHR[2],R_aux_SHR[1],R_aux_SHR[0]};
	
	assign RSHL = {R_aux_SHL[3],R_aux_SHL[2],R_aux_SHL[1],R_aux_SHL[0]};
	
	
	
endmodule