`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 02:56:46 PM
// Design Name: 
// Module Name: processor_tb
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
module processor_tb();

  reg clk;
  reg reset;
  wire [7:0] alu_result_output;
  wire [7:0] register1_output;
  wire [7:0] register2_output;
  wire [7:0] muxout_output;
  wire [7:0] muxout_output1;
  wire [7:0] muxout_output2;
  wire [7:0] load_word_output;
  wire [7:0] store_word_output;
  wire [7:0] instruction_output;

  processor proc_inst (
    .clk(clk),
    .reset(reset),
    .alu_result_output(alu_result_output),
    .register1_output(register1_output),
    .register2_output(register2_output),
    .muxout_output(muxout_output),
    .muxout_output1(muxout_output1),
    .muxout_output2(muxout_output2),
    .load_word_output(load_word_output),
    .store_word_output(store_word_output),
    .instruction_output(instruction_output)
  );

  always begin
    #10 clk = ~clk;
  end
  initial begin
    clk = 1'b0;
    reset = 1'b1;
    #10 reset = 1'b0;
    $monitor("Time: %t | alu_result: %h | register1: %h | register2: %h | muxout: %h | muxout1: %h | muxout2: %h | load_word_output : %h | store_word_output : %h | instruction_output : %h ", $time, alu_result_output, register1_output, register2_output, muxout_output, muxout_output1, muxout_output2, load_word_output, store_word_output, instruction_output);
    #1000 $finish;
  end
endmodule
