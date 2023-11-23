`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:46:08 PM
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(
  input clk,
  input [3:0] address,
  output reg [7:0] instruction
);
reg [7:0] mem [0:15];
initial begin     
    mem[0] = 8'b11110001;      
//    mem[5] = 8'b00010000;
//    mem[6] = 8'b10010000;      
//    mem[7] = 8'b10110000;      
//    mem[8] = 8'b11010000;      
//    mem[9] = 8'b11110000;
//    mem[10] = 8'b00010000;
//    mem[11] = 8'b10010000;      
//    mem[12] = 8'b10110000;      
//    mem[13] = 8'b11010000;      
//    mem[14] = 8'b11110000;
//    mem[15] = 8'b00010000;        
end
always @(posedge clk) begin
  instruction <= mem[address];
end
endmodule