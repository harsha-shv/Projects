`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:31:01 PM
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb();
  reg clk;
  reg [2:0] opcode;
  wire reg_write;
  wire [2:0] alu_opcode;
  wire mem_read;
  wire mem_write;
  wire alu_source;
  always begin
    #5 clk = ~clk;
  end
  control_unit control_unit_inst (
    .clk(clk),
    .opcode(opcode),
    .reg_write(reg_write),
    .alu_opcode(alu_opcode),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_source(alu_source)
  );
  initial begin
    clk = 0;
    opcode = 3'b000; 
    #10;
    opcode = 3'b100; 
    #10;
    opcode = 3'b101; 
    #10;
    opcode = 3'b110; 
    #10;
    $finish;
  end
  always @(posedge clk) begin
    $display("Opcode: %b | Register Write: %b | ALU code: %b | Memory Read: %b | Memory Write: %b | ALU source: %b", opcode, reg_write, alu_opcode, mem_read, mem_write, alu_source);
  end
endmodule
