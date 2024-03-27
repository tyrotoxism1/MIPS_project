// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"
// CREATED		"Tue Mar 26 20:54:52 2024"

module CPU_schematic(
	clk,
	reset
);


input wire	clk;
input wire	reset;

wire	[31:0] instruction;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[4:0] SYNTHESIZED_WIRE_5;





busmux_0	b2v_ALUSrc(
	
	.dataa(SYNTHESIZED_WIRE_0),
	.datab(SYNTHESIZED_WIRE_1),
	.result(SYNTHESIZED_WIRE_4));


MIPS_On_Chip_Memory_controller	b2v_inst(
	
	
	
	
	.address(SYNTHESIZED_WIRE_2),
	
	.q(instruction));


program_counter	b2v_inst1(
	.clk(clk),
	.reset(reset),
	
	.current_address(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst1.WIDTH = 8;


ALU	b2v_inst2(
	
	.data1(SYNTHESIZED_WIRE_3),
	.data2(SYNTHESIZED_WIRE_4)
	
	);


register_file	b2v_inst3(
	
	
	.Read1(instruction[25:21]),
	.Read2(instruction[20:16]),
	
	.WriteReg(SYNTHESIZED_WIRE_5),
	.Data1(SYNTHESIZED_WIRE_3),
	.Data2(SYNTHESIZED_WIRE_0));


sign_extend	b2v_inst4(
	.imm_16(instruction[15:0]),
	.imm_32(SYNTHESIZED_WIRE_1));



busmux_1	b2v_RegDst(
	
	.dataa(instruction[20:16]),
	.datab(instruction[15:11]),
	.result(SYNTHESIZED_WIRE_5));


endmodule

module busmux_0(dataa,datab,result);
/* synthesis black_box */

input [31:0] dataa;
input [31:0] datab;
output [31:0] result;

endmodule

module busmux_1(dataa,datab,result);
/* synthesis black_box */

input [4:0] dataa;
input [4:0] datab;
output [4:0] result;

endmodule
