`timescale 1ns/1ns
module xreg(input rst,clk,input ldx,input[15:0]xin,output reg [15:0]xreg);
  always@(posedge clk,posedge rst) begin
  if(rst) xreg<=16'b 0;
  else if(ldx) xreg<=xin;
  end
endmodule
