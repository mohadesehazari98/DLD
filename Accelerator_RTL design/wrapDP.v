`timescale 1ns/1ns
module wrapDP(input [7:0]bus,input clk,rst,input ld8,rstcnt,inccnt, output [15:0]xin , output reg cntco);
  reg [7:0] reg1,reg2; reg cnt;
  always@(posedge clk,posedge rst) begin 
    if(rst) reg1<= 8'b 0;
    else if((~cnt)&& ld8) reg2<=bus;
    end
    assign xin={reg2,reg1};
    always@(posedge clk,posedge rst) begin
      if(rst) cnt<=1'b 0;
      else if(rstcnt) cnt<=1'b 0;
      else if(inccnt) cnt<=cnt + 1;
        cntco<=cnt;
      end
    endmodule
