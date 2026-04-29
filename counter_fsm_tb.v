`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:20 PM
// Design Name: 
// Module Name: le9_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module test;
  reg en,clk,reset; //register inputs
 //wire outputs
  wire pulse_0;     //pulse for 1s place
  wire pulse_1;     //pulse for 10s place
  
  wire [7:0] count;
    
  // Instantiate design under test
  state_cntr U1(
  .en(en), .clk(clk), .reset(reset), .terminal_count(8'd9), .pulse(pulse_0), .count(count[3:0]) 
  );//instantiate counter_fsm.v to test bench for values in the ones place
  
  state_cntr U2(
  .en(pulse_0), .clk(clk), .reset(reset), .terminal_count(8'd3), .pulse(pulse_1), .count(count[7:4])
  );//instantiation for tens place that is enabled by the pulse from the ones place reaching d9
  
    initial begin
    en = 0;
    clk = 0;
    reset = 0;     //when simulation begins all values start low
    #2
    reset = 1;     //reset jumps high and then low again
    #2 
    reset = 0;
    #6
    en = 1;        //count starts
    #24000
    $finish;
    //$display("Value of c in hex is %h", c);
    //$display("Parity of c is %b", parity);
  end
  
  always begin
    #10     //clock period is double this value (20ns in this case)
    clk = ~clk;
  end
  
endmodule