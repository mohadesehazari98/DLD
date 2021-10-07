`timescale 1ns/1ns
module AlUR(input clk,rst,input[7:0] AlUout,output reg[7:0] out);
  always@(posedge clk,posedge rst)begin
    if(rst)
      out=8'b 00000000;
    else 
      out=AlUout;
    end
endmodule
  
