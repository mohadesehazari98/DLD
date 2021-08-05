`timescale 1ns/1ns
module rreg(input rst,clk,input ldr,ld1 , input [15:0]subbus , output reg [15:0]rreg);
  always@(posedge clk, posedge rst) begin
  if(rst) rreg<=16'b 0;
  else if(ldr) rreg<=subbus;
  else if(ld1) rreg<=16'b 0000000100000000;
  end
endmodule
    

