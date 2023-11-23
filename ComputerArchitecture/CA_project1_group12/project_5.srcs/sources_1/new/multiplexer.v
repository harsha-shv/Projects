`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:48:54 PM
// Design Name: 
// Module Name: multiplexer
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
module multiplexer (
  input clk,
  input reset,
  input [7:0] input1,
  input [7:0] input2,
  input [0:0] select,
  output reg [7:0] muxoutput
);

  always @(posedge clk)
  begin
      case (select)
        1'b0: muxoutput <= input1;
        1'b1: muxoutput <= input2;
        default: muxoutput <= input1;
      endcase
    end
endmodule