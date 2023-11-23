`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2023 02:55:45 PM
// Design Name: 
// Module Name: processor
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
module processor (
  input clk,
  input reset,
  output [7:0] alu_result_output,
  output [7:0] register1_output,
  output [7:0] register2_output,
  output [7:0] muxout_output,
  output [7:0] muxout_output1,
  output [7:0] muxout_output2,
  output [7:0] load_word_output,
  output [7:0] store_word_output,
  output [7:0] instruction_output
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
  wire [7:0] read_register_data1;
  wire [7:0] read_register_data2;
  wire [7:0] immediate;
  wire [7:0] alu_result;
  wire [7:0] read_output;
  wire [7:0] muxoutput;
  wire [7:0] muxoutput1;
  wire [7:0] muxoutput2;
  program_counter pc_inst (
    .clk(clk),
    .reset(reset),
    .counter(counter)
  );
  instruction_memory mem_inst (
    .clk(clk),
    .address(counter),
    .instruction(instruction)
  );
  control_unit ctrl_unit_inst (
    .clk(clk),
    .instruction(instruction),
    .reg_write(reg_write),
    .reg_write_to(reg_write_to),
    .alu_opcode(alu_opcode),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_source(alu_source),
    .alu_source1(alu_source1)
  );
    register_file reg_file_inst (
      .clk(clk),
      .write_register_input(reg_write_to),
      .write_enable(reg_write),
      .write_data_input(muxoutput2),
      .read_register_data1(read_register_data1),
      .read_register_data2(read_register_data2)
    );
  sign_extension sign_ext_inst (
    .input_value(instruction[7:0]),
    .extended_value(immediate)
  );
  alu alu_inst (
    .clk(clk),
    .input1(muxoutput1),
    .input2(muxoutput),
    .opcode(alu_opcode),
    .result(alu_result)
   );
    multiplexer mux_inst1(
      .clk(clk),
      .reset(reset),
      .input1(read_register_data2),
      .input2(read_register_data1),
      .select(alu_source),
      .muxoutput(muxoutput1)
    );
    
    multiplexer mux_inst(
      .clk(clk),
      .reset(reset),
      .input1(read_register_data1),
      .input2(immediate),
      .select(alu_source1),
      .muxoutput(muxoutput)
    );
    
    multiplexer mux_inst2(
      .clk(clk),
      .reset(reset),
      .input1(alu_result),
      .input2(read_output),
      .select(mem_read),
      .muxoutput(muxoutput2)
    );


  data_memory data_memory_inst (
    .clk(clk),
    .address(alu_result[3:0]),
    .write_data_input(read_register_data2),
    .write_enable(mem_write),
    .read_enable(mem_read),
    .read_output(read_output)
  );
  assign alu_result_output = alu_result;
  assign register1_output = read_register_data1;
  assign register2_output = read_register_data2;
  assign muxout_output = muxoutput;
  assign muxout_output1 = muxoutput1;
  assign muxout_output2 = muxoutput2;
  assign load_word_output = read_output;
  assign store_word_output = read_output;
  assign instruction_output = instruction;
endmodule
