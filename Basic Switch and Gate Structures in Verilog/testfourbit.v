`timescale 1ns/1ns
module testfourbit();
  wire [3:0]S,G,P;
  wire c4;
  reg [3:0]A ;
  reg [3:0]B ;
  reg c0 =0;
  fourbitadd uut(A,B,c0,S,c4,G,P);
  initial begin 
    #200 c0=1 ; A = 4'b 1111 ;B=0;
    #550 c0=0;
    #500 $stop;
  end 
endmodule
