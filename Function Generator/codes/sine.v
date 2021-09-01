`timescale 1ns/1ns
module sine(input clk,rst,output [7:0] out_sine);
  reg signed[15:0] cos,sin;
      
  always@(posedge clk,posedge rst) begin:count_up
  if(rst) begin
    sin<=16'b0000000000000000;
    cos<=16'b0111010100110000;
  end
  else begin
    sin=sin + cos / 64;
    cos=cos - sin / 64;
  end
  end
  
  assign out_sine=sin[15:8];
endmodule

