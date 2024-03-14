module General_MUX
	#( parameter WIDTH = 5)
	(
	input wire [WIDTH-1:0] input_0,	//input 0, instruction[20-16]
	input wire [WIDTH-1:0] input_1,	//input 1, instruction[15-11]
	input wire select,
	output reg [WIDTH-1:0] output_val
);
always @ (select) begin
	case (select)
		1 : output_val <= input_1;	//True means R-type instruction, so select input 1
		0 : output_val <= input_0;	//False means LD/ST or branch, so select input 0
		default : output_val <= input_1;	//Default assumes input 1
	endcase
	
end 
	
endmodule