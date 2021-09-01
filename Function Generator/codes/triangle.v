`timescale 1ns/1ns
module triangle(input clk,rst,input[7:0] count_clk,output reg[7:0] out_triangle);
  //reg up,down;
  always@(posedge clk,posedge rst) begin:count_up
  if(rst)
  out_triangle<=8'b00000000;
  else if(count_clk<=8'b10000000)
      out_triangle<=2*count_clk;
  else
      out_triangle<=8'b11111111 - 2*(count_clk - 8'b10000000);
  end
endmodule

