`timescale 1ns/1ns
module testSR2();
  reg sS=0,sR=0,clk=0;
  wire sQ;
  SRlatchnand UUT1(sS,sR,clk,sQ);
  initial begin
  #80
  clk=1 ; sR=1;
  #90
  clk=0 ; sR=0;
  #80
  clk=1 ; sS=1;
  #90
  clk=0 ; sR=1;
  #80
  clk=1 ;
  #90
  clk=0;sR=0;
  #80
  clk=1;sS=0;
  #90
  $stop;
end
endmodule
   
  
  
  
  
