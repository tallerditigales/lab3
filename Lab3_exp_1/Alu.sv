module Alu #(parameter N=4) (input [N-1:0] A, B, output [N:0] _SUM,_REST,_MULT,_DIV,_MOD,_AND,_OR,_XOR,_SHR,_SHL);

	// Resultados de la operacion
	logic [N:0] aux_sum,aux_rest,aux_mult,aux_div,aux_mod,aux_and,aux_or,aux_xor,aux_shr,aux_shl;

	sumador _sum (A, B, aux_sum);
	
	restador _rest (A, B, aux_rest);
	
	multiplicador _mult (A, B, aux_mult);
	
	division _div (A, B, aux_div);
	
	modulo _mod (A, B, aux_mod);
	
	and_op _and (A, B, aux_and);
	
	or_op  _or (A, B, aux_or);
	
	xor_op _xor (A, B, aux_xor);
	
	shiftR _shr (A, B, aux_shr);
	
	shiftL _shl (A, B, aux_shl);
	
	
	// Assign
	assign _SUM  = {aux_sum[4], aux_sum[3],aux_sum[2],aux_sum[1],aux_sum[0]};
	
	assign _REST = {aux_rest[4], aux_rest[3],aux_rest[2],aux_rest[1],aux_rest[0]};
	
	assign _MULT = {aux_mult[4], aux_mult[3],aux_mult[2],aux_mult[1],aux_mult[0]};
	 
	assign _DIV  = {aux_div[4], aux_div[3],aux_div[2],aux_div[1],aux_div[0]};
	
	assign _MOD  = {aux_mod[4], aux_mod[3],aux_mod[2],aux_mod[1],aux_mod[0]};
	
	assign _AND  = {aux_and[4], aux_and[3],aux_and[2],aux_and[1],aux_and[0]};
	
	assign _OR   = {aux_or[4], aux_or[3],aux_or[2],aux_or[1],aux_or[0]};
	
	assign _XOR  = {aux_xor[4], aux_xor[3],aux_xor[2],aux_xor[1],aux_xor[0]};
	
	assign _SHR  = {aux_shr[4], aux_shr[3],aux_shr[2],aux_shr[1],aux_shr[0]};
	
	assign _SHL  = {aux_shl[4], aux_shl[3],aux_shl[2],aux_shl[1],aux_shl[0]};
	
endmodule