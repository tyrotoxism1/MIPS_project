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
// CREATED		"Thu Feb 15 18:31:26 2024"

module CPU(
	clk,
	reset
);


input wire	clk;
input wire	reset;

wire	[31:0] instruction;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[4:0] SYNTHESIZED_WIRE_1;





MIPS_On_Chip_Memory_controller	b2v_inst(
	
	
	
	
	.address(SYNTHESIZED_WIRE_0),
	
	.q(instruction));


program_counter	b2v_inst1(
	.clk(clk),
	.reset(reset),
	
	.current_address(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst1.WIDTH = 8;


RegDst_MUX	b2v_inst2(
	
	.input_A(instruction[20:16]),
	.input_B(instruction[15:11]),
	.write_reg(SYNTHESIZED_WIRE_1));


register_file	b2v_inst3(
	
	
	.Read1(instruction[25:21]),
	.Read2(instruction[20:16]),
	
	.WriteReg(SYNTHESIZED_WIRE_1)
	
	);


endmodule
