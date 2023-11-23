`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:43:27 PM
// Design Name: 
// Module Name: data_memory_tb
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


module data_memory_tb();
  reg clk;
  reg [3:0] address;
  reg [7:0] write_data_input;
  reg write_enable;
  reg read_enable;
  wire [7:0] read_output;

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  data_memory data_memory_inst (
    .clk(clk),
    .address(address),
    .write_data_input(write_data_input),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .read_output(read_output)
  );
  initial begin
    clk = 0;
    address = 4'h2;
    write_data_input = 8'h16;
    write_enable = 1;
    read_enable = 0;
    #10;
    write_enable = 0;
    read_enable = 1;
    #10;
    address = 4'h4;
    write_data_input = 8'h22;
    write_enable = 1;
    read_enable = 0;
    #10;
    $finish;
  end

  always @(*) begin
    $display("Output: %h", read_output);
  end
endmodule


