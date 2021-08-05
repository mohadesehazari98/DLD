`timescale 1ns/1ns
module testsith();
  wire [15:0]S,G,P;
  wire c16;
  reg [15:0]A ;
  reg [15:0]B ;
  reg c0 =0;
  sixthadd uut(A,B,c0,S,c16,G,P);
  initial begin 
    #200 c0=1 ; A = 16'b 0011000110001001 ;B=0;
    #495 c0=0;
    #200 $stop;
  end 
endmodule