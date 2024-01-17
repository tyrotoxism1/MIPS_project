// program_counter_tb.v
module program_counter_tb;

  // Inputs
  reg clk;
  reg reset;
  reg [31:0] next_address;

  // Outputs
  wire [31:0] current_address;

  // Other
  reg test_result;

 `include "D:/Program_Files/intelFPGA_lite/projects/MIPS_project/src/program_counter.v"
  // Instantiate the program_counter module
  program_counter pc (
    .clk(clk),
    .reset(reset),
    .next_address(next_address),
    .current_address(current_address)
  );

  // Clock generation
  always #5 clk = ~clk; //10ps clock period(Assuming pico is timescale unit set)

  initial begin
    clk = 0;
    reset = 1;
    next_address = 32'h0;
    #10 reset = 0;

    //Test 1.1 - current address from PC reflects next address after 1 clock cycle of 10ps 
    next_address = 32'd31; 
    #6 
    test_result = current_address==32'd31 ? 1:0;
    $display("Test 1.1 result: %s. Time:%t, Curr_address value:%d", test_result?"Pass":"Fail",$time,current_address);

    // Test 1.2 next_address asserted in between clock cycles, expect no change from current_address
    next_address = 32'd8;
    #8 
    test_result = current_address==32'd31 ? 1:0;
    //The current_address of PC should not change if next_address is asserted in between CC 
    $display("Test 1.2 result: %s. Time: %t, Curr_address value:%d", test_result?"Pass":"Fail",$time,current_address);
    next_address = 32'd31;
    #6 //Should be at 30ps at this point 
    // Test 2.1 - Reset sets current_addres to 0 in between CC
    reset = 1'b1;
    #5
    reset = 1'b0;
    test_result = current_address==32'd0 ? 1:0;
    $display("Test 2.1 result: %s. Time: %t, Curr_address value:%d", test_result?"Pass":"Fail",$time,current_address);
    #10
    // Test 2.2 - Reset sets current_addres to 0 on rising edge of clk, even with next_address being value on rising edge 
    reset = 1'b1;
    #5
    reset = 1'b0;
    test_result = current_address==32'd0 ? 1:0;
    $display("Test 2.2 result: %s. Time: %t, Curr_address value:%d", test_result?"Pass":"Fail",$time,current_address);
    #5


    #100 $finish; // Finish simulation after 100 simulation time units
  end
endmodule
