module multiplexor_flags #(parameter N=4) (input [N:0] op, input [N:0] ss, output [3:0] flags); 

	logic [3:0] aux;
	logic [N-1:0] result;	
	logic bitN;	
	
	always @(ss) begin
	
		// V,C,N,Z
		aux = 4'b0001;
		result = op[N-1:0];
		bitN = op[N];

		case(ss)
		//SUMA
			0: 
				// Zero?
				if ((result == 0) & (bitN == 0))
					aux[0] = 1'b1; // 0,0,0,1
//           
//				// Carry?
//				if (bitN == 1)
//					aux[1] = 1'b1; // 0,0,1,0
            
			
		//RESTA	
			1:
				// Zero?
				if ((result == 0) & (bitN == 0)) begin
					aux = {1'b1, 1'b0, 1'b0, 1'b0}; // 1,0,0,0
            end
//				
//				// Neg?
//				if ((result == 0) & (bitN == 0)) begin
//					aux = {1'b1, 1'b1, 1'b0, 1'b0}; // 0,0,1,0
//            end
//				
//				// Carry?
//				else if (bitN == 1) begin
//					aux = {1'b0, 1'b0, 1'b0, 1'b0}; // 0,0,1,0
//            end
//				
				
			1: aux = op; // negative
//			3: aux = op; // overflow
			
			default: aux=0;
	
		endcase
	end
	
	assign flag = aux;

endmodule