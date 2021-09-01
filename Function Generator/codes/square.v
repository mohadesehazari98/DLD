`timescale 1ns/1ns
module square(input clk,rst,input[7:0] count_clk,output reg[7:0] out_square);
  reg up,down;
  always@(posedge clk,posedge rst) begin:count_up
  if(rst)
    out_square<=8'b10000000;
  else if(up)
    out_square<=8'b11111110;
  else if(down)
    out_square<=8'b00000001;
  end
  always@(posedge clk,posedge rst) begin:checking
  if(rst) begin
  up<=1'b0;
  down<=1'b0;
  end
  else if(count_clk==8'b00000000)begin
      up<=1'b1;
		down<=1'b0;
	 end
  else if(count_clk==8'b10000000) begin
      down<=1'b1;
		up<=1'b0;
	 end
  end  
endmodule
