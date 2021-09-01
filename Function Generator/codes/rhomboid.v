`timescale 1ns/1ns
module rhomboid(input clk,rst,input[7:0] count_clk,output reg[7:0] out_rhomboid);
  reg up,down;
  reg[7:0] x;
  always@(posedge clk,posedge rst) begin:count_up
  if(rst)
    out_rhomboid<=8'b10000000;
  else if(up)
    out_rhomboid<=out_rhomboid+x;
  else if(down)
    out_rhomboid<=out_rhomboid-x;
  end
  always@(posedge clk,posedge rst) begin:checking
    if(rst) begin
      up<=1'b1;
      down<=1'b0;
    end
    else begin
      up<=~up;
      down<=~down;
    end
  end
  always@(posedge clk,posedge rst) begin:number
  if(rst)
    x<=8'b00000010;
  else
    x<=x+4;
  end

endmodule
