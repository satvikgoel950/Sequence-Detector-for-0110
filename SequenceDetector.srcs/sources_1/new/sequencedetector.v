`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ApnaSemicoductor
// Engineer: Satvik Goel
// 
// Create Date: 06.01.2023 21:29:15
// Design Name: 
// Module Name: sequencedetector
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


module sequencedetector(
    input clk,
  	input rst,
  	input in,
  	output reg out
);
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  reg [1:0]state;
  always @(posedge clk) begin
    if(rst == 1'b1)begin
      state <= S0;
      out <= 1'b0;
    end
    else begin
      case(state)
        S0: begin
          state <= in ? S0:S1;
          out <= 1'b0;
        end
        S1: begin
          state <= in ? S2:S0;
          out <= 1'b0;
        end
        S2: begin
          state <= in ? S3:S0;
          out <= 1'b0;
        end
        S3: begin
          state <= in ? S0:S0;
          out <= ~in;
        end
      endcase
    end
  end
endmodule  
