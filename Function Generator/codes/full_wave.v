`timescale 1ns/1ns
module full_wave(input clk,input rst,input[7:0] count_clk,output [7:0] out_sine);
  reg signed[15:0] cos_old,sin_old;
  reg signed[15:0] cos,sin;
  always@(posedge clk,posedge rst) begin:count_up
  if(rst) begin
    sin<=16'b0000000000000000;
    cos<=16'b0111010100110000;
  end
  else begin
    sin=sin_old + cos_old / 16'd64;
    cos=cos_old - sin / 16'd64;
	 sin_old=sin;
	 cos_old=cos;
  end
  end
  
  always@(posedge clk,posedge rst) begin:rect
  if(rst)
  cos<=16'b0111010100110000;
  else if(sin[15:8]==8'b00000001)
      cos=16'b0111010100110000;
  else if(sin[15:8]==8'b00000000)
      cos=16'b0111010100110000;
  end
  
  assign out_sine=sin[15:8];
endmodule



