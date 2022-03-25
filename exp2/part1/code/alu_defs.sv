package alu_defs;
//--------------------------------------------------------------------
// ALU RESULT TYPES
//--------------------------------------------------------------------
	parameter ARITH_RESULT = 1'b0;
	parameter LOGIC_RESULT = 1'b1;
//--------------------------------------------------------------------
// ARITH_UNIT Operations
//--------------------------------------------------------------------
	parameter ARITH_ADD =    3'b011;
	parameter ARITH_SUB =    3'b111;
	parameter ARITH_DIV =    3'b001;
	parameter ARITH_MUL =    3'b000;
	parameter ARITH_MOD =    3'b010;
//--------------------------------------------------------------------
// LOGIC_UNIT Operations
//--------------------------------------------------------------------
	parameter LOGIC_SHIFTR = 3'b000;
	parameter LOGIC_SHIFTL = 3'b001;
	parameter LOGIC_AND =    3'b010;
	parameter LOGIC_XOR =    3'b011;
	parameter LOGIC_OR =     3'b100;
endpackage