`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2023 06:30:25 PM
// Design Name: 
// Module Name: control_unit
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
module control_unit(
  input clk,
  input [7:0] instruction,
  output reg reg_write,
  output reg [2:0] alu_opcode,
  output reg [0:0] mem_read,
  output reg [0:0] mem_write,
  output reg [0:0] alu_source,
  output reg [0:0] alu_source1,
  output reg [0:0] alu_source2,
  output reg [0:0] reg_write_to
);

  always @(*) begin
    case (instruction[7:5])
      3'b000: begin // Add
        reg_write = 1'b1;
        alu_opcode = 3'b000;
        mem_read = 1'b1;
        mem_write = 1'b0;
        alu_source = 1'b0;
        alu_source1 = 1'b0;
        reg_write_to = 1'b1;
        alu_source2 = 1'b0;
      end
      3'b100: begin // Add immediate
        reg_write = 1;
        alu_opcode = 3'b100;
        mem_read = 0;
        mem_write = 0;
        alu_source = 1;
        alu_source1 = 1;
        reg_write_to = 1;
        alu_source2 = 0;
      end
      3'b101: begin // Store word
        reg_write = 0;
        alu_opcode = 3'b101;
        mem_read = 0;
        mem_write = 1;
        alu_source = 1;
        alu_source1 = 1;
        reg_write_to = 1;
        alu_source2 = 0;  
      end
        3'b110: begin // Load word
          reg_write = 1;
          alu_opcode = 3'b110;
          mem_read = 1;
          mem_write = 0;
          alu_source = 1;
          alu_source1 = 1;
          reg_write_to = 1;
          alu_source2 = mem_read;
        end
      3'b111: begin // Shift left logical
        reg_write = 1;
        alu_opcode = 3'b111;
        mem_read = 0;
        mem_write = 0;
        alu_source = 1;
        alu_source1 = 1;
        reg_write_to = 1;
        alu_source2 = 0;
      end
    endcase
  end
endmodule
