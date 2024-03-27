module Control_Unit(
	input [5:0] opcode,
	output reg RegDst,
	output reg RegWrite,
	output reg MemtoReg,
	output reg MemRead,
	output reg MemWrite,
	output reg [1:0] ALUOp,
	output reg ALUSrc,
	output reg branch
);
	always @(opcode) begin
		case (opcode)
			6'd0: begin		//R-Type opcode
				RegDst <= 1'b1;
				RegWrite <= 1'b1;
				MemtoReg <= 1'b0;
				MemRead <= 1'b0;
				MemWrite <= 1'b0;
				ALUOp <= 2'b10;
				ALUSrc <= 1'b0;
				branch <= 1'b0;
			end
			6'd35: begin	//Load instruction
				RegDst <= 1'b1;
				RegWrite <= 1'b1;
				MemtoReg <= 1'b1;
				MemRead <= 1'b1;
				MemWrite <= 1'b0;
				ALUOp <= 2'b00;
				ALUSrc <= 1'b1;
				branch <= 1'b0;
			end
			6'd43: begin	//Store instruction
				RegWrite <= 1'b0;
				MemRead <= 1'b0;
				MemWrite <= 1'b1;
				ALUOp <= 2'b00;
				ALUSrc <= 1'b1;
				branch <= 1'b0;
			end
			6'd4: begin		//Branch instruction
				RegWrite <= 1'b0;
				MemRead <= 1'b0;
				MemWrite <= 1'b0;
				ALUOp <= 2'b01;
				ALUSrc <= 1'b0;
				branch <= 1'b1;
			end
		endcase
	end
endmodule