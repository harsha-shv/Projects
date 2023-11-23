`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:46:42 PM
// Design Name: 
// Module Name: instruction_memory_tb
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

module instruction_memory_tb();
  reg clk;
  reg [3:0] address;
  wire [7:0] instruction;
  always begin
    #5 clk = ~clk;
  end
  
  instruction_memory instruction_memory_inst (
    .clk(clk),
    .address(address),
    .instruction(instruction)
  );

  initial begin
    clk = 0;
    address = 4'h2;
    #10;
    address = 4'h4;
    #10;
    $finish;
  end
  always @(posedge clk) begin
    $display("Instruction memory address: %h | Instruction value: %h", address, instruction); 
  end
endmodule
