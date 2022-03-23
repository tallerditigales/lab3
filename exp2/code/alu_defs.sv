//--------------------------------------------------------------------
// ALU RESULT TYPES
//--------------------------------------------------------------------
`define ARITH_RESULT 1'b0
`define LOGIC_RESULT 1'b1
//--------------------------------------------------------------------
// ARITH_UNIT Operations
//--------------------------------------------------------------------
`define ARITH_ADD    3'b011
`define ARITH_SUB    3'b111
`define ARITH_DIV    3'b001
`define ARITH_MUL    3'b000
`define ARITH_MOD    3'b010
//--------------------------------------------------------------------
// LOGIC_UNIT Operations
//--------------------------------------------------------------------
`define LOGIC_SHIFTR    3'b000
`define LOGIC_SHIFTL    3'b001
`define LOGIC_AND       3'b010
`define LOGIC_XOR       3'b011
`define LOGIC_OR        3'b100