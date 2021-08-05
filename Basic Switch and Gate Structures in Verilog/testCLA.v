`timescale 1ns/1ns
module testCLA();
  wire [15:0]S,Scla,G,P;
  wire [3:0]Gcla,Pcla;
  wire c16,c16cla;
  reg [15:0]A ;
  reg [15:0]B ;
  reg c0 =0;
  sixthadd uut(A,B,c0,S,c16,G,P);
  CLA16bit uut1(A,B,c0,Gcla,Pcla,c16cla,Scla);
  initial begin 
    #200 c0=1 ; A = 16'b 0011000110001001 ;B=0;
    #955 c0=0;
    #500
    $stop;
  end 
endmodule

