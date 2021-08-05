`timescale 1ns/1ns
module TBreg();
  reg [31:0]A,B;
  reg clk,rst=1,en=1;
  wire [31:0]AA;
  genvar j;
generate for(j=0;j<=31;j=j+8) begin:row
regmaster Num1(A[j+7:j],clk,rst,en,AA[j+7:j]);
end
endgenerate
initial begin
 #800
 clk=0; rst=0;  A=32'b 01101100; 
 #2000
 clk=1;
 #1500
 clk=0;
 #2000
 clk=1;
 #1500
 clk=0;
 #2000
 clk=1;
 #1500
 clk=0;
 #450
  $stop;
end
endmodule
  
