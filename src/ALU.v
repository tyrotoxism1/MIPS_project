module ALU
(
	input [31:0] data1, 	//Come from read data1 of RF, represents source register(rs)
	input [31:0] data2, 	//controlled by ALUSrc mux, represents target register(rt) or immediate value 
	input [3:0] ALU_control,
	output reg [31:0] result,
	output zero
);
	assign zero = (result==0);
	always @(ALU_control, data1, data2) begin
		case (ALU_control)
			4'b0000: result <= data1 & data2;		//AND operand
			4'b0001:	result <= data1 | data2;		//OR operand
			4'b0010: result <= data1 + data2;		//add operand
			4'b0110: result <= data1 - data2;		//subtract operand
			4'b0111: result <= (data1<data2)? 1 : 0;	//SLT operand
			4'b1100: result <= ~(data1 | data2); 	//Nor operand
			default: result <= 0;
		endcase
	end
endmodule