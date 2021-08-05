`timescale 1ns/1ns
module TBDlatch();
  reg sD=0,clk=0;
  wire sQ;
  Dlatch3 UUT2(sD,clk,sQ);
  initial begin
  #80
  clk=1 ; sD=1;
  #90
  clk=0 ; sD=0;
  #80
  clk=1 ; sD=0;
  #90
  clk=0 ; sD=1;
  #80
  clk=1 ; sD=0;
  #90
  clk=1 ; sD=1;
  #80
  clk=0 ; sD=0;
  #90
  clk=0 ; sD=1;
  #80
  $stop;
end
endmodule
