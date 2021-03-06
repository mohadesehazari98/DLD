`timescale 1ns/1ns
module SMBC(input clk,rst,si,output reg[5:0]outport,output reg[3:0]L0,L1,L2,L3,output reg valid);
  
datapath uut0(si,clk,rst,valid,shePL,outport,L0,L1,L2,L3);
controller uut1(clk,rst,si,shePL,valid);

endmodule
