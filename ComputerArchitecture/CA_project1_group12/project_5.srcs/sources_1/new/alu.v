`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:40:12 PM
// Design Name: 
// Module Name: alu
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


module alu (
  input clk,
  input [7:0] input1,
  input [7:0] input2,
  input [2:0] opcode,
  output reg [7:0] result
  );

always @(posedge clk) begin
  case (opcode)
    3'b000:
      result = input1 + input2;
    3'b100:
      result = input1 + input2; 
    3'b101: 
      result = input1 + input2;
    3'b110: 
      result = input1 + input2;
    3'b111: 
      result = input1 << input2[2:0];
  endcase
end

endmodule