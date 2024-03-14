module sign_extend( 
	input wire [15:0] imm_16,
	output reg [31:0] imm_32
);
	
	always begin
		//if immediate is pos, assign output to imm_16 concatted with 16 0s
		if (imm_16[15] == 1'b0) begin
			imm_32 = {16'b0, imm_16};
		//else val is negative, assign output to imm_16 concatted with 16 1s
		end else begin
			imm_32 = {16'b1, imm_16};
		end
	end
	
endmodule