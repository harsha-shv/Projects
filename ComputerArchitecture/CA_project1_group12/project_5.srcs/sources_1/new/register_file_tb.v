`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:57:49 PM
// Design Name: 
// Module Name: register_file_tb
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
module register_file_tb();
  reg clk;
  reg [0:0] write_register_input;
  reg [0:0] read_register1;
  reg [0:0] read_register2;
  reg write_enable;
  reg [7:0]  write_data_input;
  wire [7:0] read_register_data1;
  wire [7:0] read_register_data2;
  always begin
    #5 clk = ~clk;
  end

  register_file register_file_inst (
    .clk(clk),
    .write_register_input(write_register_input),
    .read_register1(read_register1),
    .read_register2(read_register2),
    .write_enable(write_enable),
    .write_data_input(write_data_input),
    .read_register_data1(read_register_data1),
    .read_register_data2(read_register_data2)
  );

  initial begin
    clk = 0;
    write_register_input = 1'b0;
    read_register1 = 1'b0;
    read_register2 = 1'b1;
    write_enable = 1;
    write_data_input = 8'h15;
    #20;
    write_register_input = 1'b1;
    write_data_input = 8'h22;
    #20;
    write_enable = 0;
    #20;
    $finish;
  end
  always @(posedge clk) begin
    $display("Read register data1: %h | Read register data2: %h", read_register_data1, read_register_data2);
  end
endmodule

