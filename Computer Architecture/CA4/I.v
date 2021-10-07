`timescale 1ns/1ns
module I(input clk,rst,input loadI,input[7:0] Data,output reg[7:0] out);
  always@(posedge clk,posedge rst)begin
    if(rst)
      out=8'b 00000000;
    else if(loadI)
      out=Data;
    end
endmodule
