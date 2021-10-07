`timescale 1ns/1ns
module Add_Sub(input clk,rst,input [6:0]out_A,out_D,input add,sub,output reg [6:0]out_Add_Sub);
  reg [6:0]out_add,out_sub;
  always@(posedge clk,posedge rst) begin
    if(rst) out_Add_Sub=7'b 0000000;
    else begin
    out_add = out_A + out_D;
    out_sub = out_A + (~out_D + 1'b1);
    if(add) out_Add_Sub=out_add;
    else if(sub) out_Add_Sub=out_sub;
    end
  end
endmodule  
