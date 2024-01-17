#This .do file should be run from root directory at: D:\Program_Files\intelFPGA_lite\projects\MIPS_project
quit -sim

vlib work

vlog src/program_counter.v 

vlog simulation/program_counter_tb.v

vsim work.program_counter_tb

add wave *

radix -decimal

config wave -signalnamewidth 1

run 100ps