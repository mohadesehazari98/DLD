`timescale 1ns/1ns
module SMBS(input SI,input[5:0]PL,output reg[3:0]L0,L1,L2,L3);
wire[3:0] PB;
wire[1:0] LB;
assign PB=PL[3:0];
assign LB=PL[5:4];
  always@(SI,PB,LB)begin
    L0=0;
    L1=0;
    L3=0;
    L2=0;
    if(PB[0]==1)
      L0[LB]=SI;
      
  else if(PB[1]==1)
      L1[LB]=SI;
      
else if(PB[2]==1)
      L2[LB]=SI;
      
  else if(PB[3]==1)
      L3[LB]=SI;
  end 
endmodule

      