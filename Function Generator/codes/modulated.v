`timescale 1ns/1ns
module modulated(input clk,rst,output reg[7:0] out_sine);
  reg signed[15:0] cos,sin;
  reg signed[15:0] sin_2;
  reg x;
     
  always@(posedge clk,posedge rst) begin:count_up
  if(rst) begin
    sin<=16'b0000000000000000;
    cos<=16'b0111010100110000;
    x<=1'b1;
  end
  else begin
    sin=sin + cos / 64;
    cos=cos - sin / 64;
    sin_2= - sin;
    x=~x;
  end
  end
  
  always@(posedge clk,posedge rst) begin:out
  if(rst)
  out_sine<=8'b00000000;
  else if(x==1'b1)
    out_sine=sin[15:8];
  else if(x==1'b0)
    out_sine=sin_2[15:8];
  end
endmodule
