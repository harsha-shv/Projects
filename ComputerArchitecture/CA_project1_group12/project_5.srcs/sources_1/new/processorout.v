`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2023 12:35:56 PM
// Design Name: 
// Module Name: processorout
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


module processorout(
    input clk,
    input reset,
    output [7:0] rd1,
    output [7:0] rd2
    );
       wire [3:0] counter;
  wire [7:0] instruction;
  wire [2:0] opcode;
  wire [0:0] write_register_input;
  wire [0:0] reg_write;
  wire [2:0] alu_opcode;
  wire [0:0] mem_read;
  wire [0:0] mem_write;
  wire [0:0] alu_source;
  wire [0:0] alu_source1;
  wire [0:0] alu_source2;
  wire [0:0] write_enable;
  wire [0:0] reg_write_to;
  wire [7:0] immediate;
  wire [7:0] alu_result;
  wire [7:0] read_output;
  wire [7:0] muxout_output;
  wire [7:0] muxout_output1;
  wire [7:0] muxout_output2;
    processor proc_inst(
     .clk(clk),
  .reset(reset),
  .alu_result_output(alu_result_output),
  .register1_output(rd1),
  .register2_output(rd2),
   .muxout_output(muxout_output),
   .muxout_output1(muxout_output1),
   .muxout_output2(muxout_output2),
   .load_word_output(read_output),
   .store_word_output(read_output),
 .instruction_output(instruction));
endmodule
