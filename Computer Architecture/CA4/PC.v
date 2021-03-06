`timescale 1ns/1ns
module PC(input clk,rst,zero,PCwrite,PCcond,input[4:0] PCin,output reg[4:0] PCout);
  always@ (posedge clk,posedge rst) begin
    if(rst) PCout=5'b 00000;
    else if(PCwrite|(PCcond&zero)) PCout=PCin;
  end
endmodule  

