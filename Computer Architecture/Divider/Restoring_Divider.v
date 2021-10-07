`timescale 1ns/1ns
module Restoring_Divider(input clk,rst,start,input [11:0]initial_A,input [5:0]initial_Q,output [5:0]Rem,Quotient,output done);
  wire shA,shQ,ldA,ldQ0,Q0,add,sub,en,A5;
  DataPath U1(initial_A,initial_Q,clk,rst,shA,shQ,ldA,ldQ0,Q0,add,sub,Rem ,Quotient,A5);
  Controller U2(clk,rst,start,A5,shA,shQ,ldA,add,sub,Q0,ldQ0,done);
endmodule
