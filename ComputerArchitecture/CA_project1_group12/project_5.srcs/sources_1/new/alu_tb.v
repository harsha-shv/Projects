`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:40:44 PM
// Design Name: 
// Module Name: alu_tb
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

module alu_tb();
reg [7:0] input1;
reg [7:0] input2;
reg [2:0] opcode;
wire [7:0] result;

alu alu_inst(
.input1(input1),
.input2(input2),
.opcode(opcode),
.result(result)
);
initial begin
input1 = 8'h12;
input2 = 8'h04;
opcode = 3'b000;
#10;
$display("ALU Result: %h", result);
input1 = 8'h24;
opcode = 3'b100;
#10;
$display("ALU Result: %h", result);
input1 = 8'h11;
opcode = 3'b101;
#10;
$display("ALU Result: %h", result);
input2 = 8'h14;
opcode = 3'b110;
#10;
$display("ALU Result: %h", result);
input1 = 8'h11;
input2 = 8'h14;
opcode = 3'b111;
#10;
$display("ALU Result: %h", result);
$finish;
end
endmodule