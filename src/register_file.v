module register_file(
	input wire [4:0] Read1,
	input wire [4:0] Read2,
	input wire [4:0] WriteReg,	//specifies the register to write to
	input wire [31:0] WriteData, //contains the data written to the `WriteReg` register
	input wire WriteEn,	//Enables data to be written to `WriteReg`
	input wire clk,
	output [31:0] Data1,
	output [31:0] Data2
);
	reg [31:0] RF [31:0];

	//Assign register data before any write updates values of registers
	assign Data1 = RF[Read1];
	assign Data2 = RF[Read2];
	
	always begin 
		@(posedge clk) if (WriteEn) RF[WriteReg] <= WriteData;	
	end
	
endmodule