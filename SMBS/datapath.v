`timescale 1ns/1ns
module datapath(input si,clk,rst,valid,shePL,output reg[5:0] outport,output[3:0]L0,L1,L2,L3);
wire a;
assign a=si&valid;
always@(posedge clk,posedge rst)begin
  if(rst) outport=3'b0;
   else if(shePL)  outport<={si,outport};
  end
SMBS uut(a,outport[5:2],outport[1:0],L0,L1,L2,L3);
endmodule 