`timescale 1ns/1ns
module count_8(input clk,rst,output reg[7:0] count_clk);
 always@(posedge clk,posedge rst) begin:count_up
 if(rst)
   count_clk<=8'b00000000;
 else
   count_clk<=count_clk+1;
 end   
endmodule

