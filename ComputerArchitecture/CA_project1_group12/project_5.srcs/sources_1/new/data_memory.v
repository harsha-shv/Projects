`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:43:03 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory (
  input clk,
  input [3:0] address,
  input [7:0] write_data_input,
  input [0:0] read_enable,
  input [0:0] write_enable,
  output reg [7:0] read_output
);

reg [7:0] memory [0:15];

initial begin
    memory[0] = 8'd0; 
    memory[1] = 8'd2;
    memory[2] = 8'd4; 
    memory[3] = 8'd6; 
    memory[4] = 8'd8; 
    memory[5] = 8'd10; 
    memory[6] = 8'd12; 
    memory[7] = 8'd14;
    memory[8] = 8'd16;
    memory[9] = 8'd18; 
    memory[10] = 8'd20; 
    memory[11] = 8'd22;
    memory[12] = 8'd24; 
    memory[13] = 8'd26;
    memory[14] = 8'd28;
    memory[15] = 8'd30; 
end


always @(posedge clk) begin
  if (write_enable) begin
    memory[address] <= write_data_input;
  end

  if (write_enable || read_enable) begin
    read_output <= memory[address];
  end
end

endmodule