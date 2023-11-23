`timescale 1ns / 1ps

module program_counter_tb();
  reg clk;
  reg reset;
  wire [3:0] counter;
  always begin
    #5 clk = ~clk;
  end
  program_counter pc_inst (
    .clk(clk),
    .reset(reset),
    .counter(counter)
  );
  initial begin
    clk = 0;
    reset = 1;
    #10;
    reset = 0;
    #100;
    reset = 1;
    #10;
    $finish;
  end
  always @(posedge clk) begin
    $display("counter value: %h", counter);
  end
endmodule