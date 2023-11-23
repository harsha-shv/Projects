`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 07:32:44 PM
// Design Name: 
// Module Name: sign_extension_tb
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


module sign_extension_tb();
  reg [2:0] input_value;
  wire [7:0] extended_value;

  sign_extension sign_extension_inst (
    .input_value(input_value),
    .extended_value(extended_value)
  );

  initial begin
    input_value = 3'b101;
    #10;
    input_value = 3'b011;
    #10;

    $finish;
  end

  always @(*) begin
    $display("Input: %b | sign-extended: %h", input_value, extended_value);
  end
endmodule
