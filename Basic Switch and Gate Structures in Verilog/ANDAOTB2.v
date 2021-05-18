`timescale 1ns/1ns
module ANDAOTB2();
  wire ww , w;
  reg aa=1, bb=1,cc=1;
  AO1 uut1(aa,bb,cc,ww);
  AO2 uut3(aa,bb,cc,w);
  initial begin 
    #100 aa=0;
    bb=0;
    cc=1;
    #120 aa=0;
    bb=1;
    cc=0;
    #115 aa=0;
    bb=1;
    cc=1;
    #110 aa=1;
    bb=0;
    cc=0;
    #100 aa=1;
    bb=0;
    cc=1;
    #105 aa=1;
    bb=1;
    cc=0;
    #120 aa=1;
    bb=1;
    cc=1;
    #115 aa=0;
    bb=0;
    cc=0;
    #100 $stop;
  end 
  endmodule

