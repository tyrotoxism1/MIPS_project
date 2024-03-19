module ALU_Control(
input [1:0] ALU_op,
input [5:0] funct_field,
output reg [3:0] ALU_control
);
	always begin
		//r-type instruction
		case (ALU_op)
			//r-type instruction
			2'b10: begin
				case (funct_field) 
					6'b100000: ALU_control <= 4'b0010;	//Add operation for r-type instruction
					6'b100010: ALU_control <= 4'b0110;	//Subtract operation for r-type instruction
					6'b100100: ALU_control <= 4'b0000;	//AND operation for r-type instruction
					6'b100101: ALU_control <= 4'b0001;	//OR operation for r-type instruction
					6'b101010: ALU_control <= 4'b0111;	//SLT operation for r-type instruction
					default ALU_control <= 4'b1111;		//Should not happen, shall raise exception in future iteration
				endcase
			end
			2'b00: ALU_control <= 4'b0010;				//LW or SW instruction			
			2'b01: ALU_control <= 4'b0110;				//Branch equal instruction
			default ALU_control <= 4'b1111; 				//Should not happen, shall raise exception in future iteration
		endcase		
		end
endmodule