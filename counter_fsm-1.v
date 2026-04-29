`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:37 PM
// Design Name: 
// Module Name: le9
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

module state_cntr(
    input en, //enable
    input clk, //clock
    input reset,
    input [7:0] terminal_count,
    output pulse, //pulse signals when count is reached
    output [7:0]count
    );

reg [7:0] cnt;
reg [7:0] next_cnt;



// flip-flops (state memeory)
always @(posedge clk or posedge reset) begin //asyncronous reset
    if (reset==1'b1) cnt<=8'd0; // reset to zero 
    else cnt <= next_cnt; // continues count if reset is not high
end

// next-state logic 
always @(*) begin
    if(en) begin // check for the enable 
        if (cnt == terminal_count) next_cnt = 0; // if the counter reaches 15 go back to zero 
        else next_cnt = cnt + 1; // new concept -- a counter! 
    end 
    else next_cnt = cnt; // if enable is low stay in the same state 
end

// output logic 
assign pulse = (cnt == terminal_count); // at the last state send out a pulse 
assign count=cnt;
endmodule
