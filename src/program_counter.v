module program_counter
	#( parameter WIDTH=8)
	(
	input wire clk, 
	input wire reset,
	input wire [WIDTH-1:0] next_address,
	output reg [WIDTH-1:0] current_address 
);
always @(posedge clk or posedge reset)begin
	if(reset)
		current_address <= 8'h0;	//Change bit width to match WIDTH parameter
	else
		current_address <= next_address;
end
endmodule