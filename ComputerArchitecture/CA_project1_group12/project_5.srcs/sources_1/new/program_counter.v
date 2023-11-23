`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:51:06 PM
// Design Name: 
// Module Name: program_counter
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

module program_counter (
    input clk,
    input reset,
    output reg [3:0] counter
);
always @(posedge clk or posedge reset) begin
    if (reset) begin
        counter <= 4'd0;
    end
    else begin
        counter <= counter + 1;
    end
end
endmodule