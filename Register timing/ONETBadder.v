`timescale 1ns/1ns
module ONETBadder();
 reg [7:0]SA,SB;
 reg Scin;
 wire [7:0]OS;
 wire Ocout;
ONEadder TST(SA,SB,Scin,OS,Ocout);
initial begin
  #100
  SA=8'b 10100110; SB=8'b 00000000; Scin=1;
  #250
  SA=8'b 10100110; SB=8'b 11001001; Scin=1;
  #300
  $stop;
end
endmodule
