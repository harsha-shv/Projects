`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:49:20 PM
// Design Name: 
// Module Name: multiplexer_tb
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


module multiplexer_tb();
  reg [7:0] input1;
  reg [7:0] input2;
  reg select;
  wire [7:0] output1;

multiplexer multiplexer_inst (
.input1(input1),
.input2(input2),
.select(select),
.output1(output1)
);
initial begin
input1 = 8'h24;
input2 = 8'h42;
select = 1'b0;
#10;
$finish;
end
always @(*) begin
$display("Select input: %b | output1: %h", select, output1);
end
endmodule
