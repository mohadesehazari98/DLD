`timescale 1ns/1ns
module FOURtstbnch();
  reg [31:0]A,B;
  wire [31:0] AA, BB;
  wire [7:0]Aadd,Badd;
  reg clk = 0,rst=1;
  wire [31:0]W;
  wire [1:0] gout;
  wire cout;
  TWOadder UUT(A,B,clk,rst,W,AA,BB,Aadd,Badd, gout, cout);

  always #900 clk = !clk;
  
initial begin
  #1000
  rst=1;
  #1500;
  rst = 0;
  #400;
  clk=1; A=8'b 01101100; B=8'b 00110101;
end
endmodule
  