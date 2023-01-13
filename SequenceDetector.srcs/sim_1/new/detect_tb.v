`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ApnaSemiconductor
// Engineer: Satvik Goel
// 
// Create Date: 06.01.2023 21:52:25
// Design Name: 
// Module Name: detect_tb
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


module detect_tb;

reg clk, rst, in;
wire out;
sequencedetector dut(clk,rst,in, out);

initial begin
  clk = 1'b0;
  rst = 1'b1;
  #10 rst = 1'b0;
  in = 1'b0;
end

always begin
  #5 clk = ~clk;
end

initial begin
  $dumpfile("tb.vcd");
  $dumpvars(1,dut);

  #5 in = 1'b0;
  #5 in = 1'b0;
  #5 in = 1'b0;
  #5 in = 1'b1;
  #5 in = 1'b1;
  #5 in = 1'b0;
  #5 in = 1'b1;
  #5 in = 1'b1;
  #5 in = 1'b0;
  #5 in = 1'b0;
  #5 in = 1'b1;
  #5 in = 1'b0;
  #5 in = 1'b0;
  #5 in = 1'b1;
  #5 in = 1'b1;
  #5 in = 1'b0;
  #5 in = 1'b1;
  #5 in = 1'b0;
  #20 $finish;
end
endmodule
