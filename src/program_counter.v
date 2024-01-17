module program_counter(
	input wire clk, 
	input wire reset,
	input wire [31:0] next_address,
	output reg [31:0] current_address 
);
always @(posedge clk or posedge reset)begin
	if(reset)
		current_address <=32'h0;
	else
		current_address <= next_address;
end
endmodule