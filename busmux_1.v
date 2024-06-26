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


module busmux_1(dataa,datab,result);
input [4:0] dataa;
input [4:0] datab;
output [4:0] result;

busmux	lpm_instance(.dataa(dataa),.datab(datab),.result(result));
	defparam	lpm_instance.width = 5;

endmodule
