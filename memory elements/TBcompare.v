`timescale 1ns/1ns
module TBcompare();
 reg sD=0,clk=0,rst=0;
  wire sQMS,sQD;
 masterslaveD UUT4(rst,sD,clk,sQMS);
 Dlatchreset UUT5(rst,sD,clk,sQD);
 
  initial begin
  #80
  clk=1 ;sD=1 ;
  #90
  clk=0 ; sD=0;
  #80
  clk=1 ; sD=0;
  #90
  clk=0 ; sD=1;
  #80
  clk=1 ; rst=1;
  #90
  clk=0; sD=0;
  #80
  clk=1; sD=1;
  #90
  $stop;
end
endmodule
