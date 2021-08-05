`timescale 1ns/1ns
module treg(input rst,clk,input ldt,ld1 , input [15:0]mulbus , output reg [15:0]treg);
  always@(posedge clk, posedge rst) begin
  if(rst) treg<=16'b 0;
  else if(ldt) treg<=mulbus;
  else if(ld1) treg<=16'b 0000000100000000;
  end
endmodule
    

