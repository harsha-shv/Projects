`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:57:13 PM
// Design Name: 
// Module Name: register_file
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
module register_file (
  input clk,
  input [0:0] write_register_input,
  input [0:0] write_enable,
  input [7:0] write_data_input,
  output reg [7:0] read_register_data1,
  output reg [7:0] read_register_data2
);

reg [7:0] registers [1:0];

initial begin
  registers[0] = 8'b00000010;
  registers[1] = 8'b00000011;
end
always @(*) begin
  if (write_enable) begin
    registers[write_register_input] <= write_data_input;
  end
  read_register_data1 = registers[0];
  read_register_data2 = registers[1];
end

endmodule
