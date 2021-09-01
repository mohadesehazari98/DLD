`timescale 1ns/1ns
module TB();
  reg clk,rst;
  wire[7:0] out;
  wire[7:0] out_7;
 // wire x;
  //wire up,down;
  count_8 UUT(clk,rst,out);
  triangle UUM(clk,rst,out,out_7);
  initial begin
    #20
    rst=1'b0;
    #20
    rst=1'b1;
    #20
    rst=1'b0;
    #1000000
    $stop;
  end
  
  always
  begin
  clk=1'b0;
  clk= #20 1'b1;
  #20;
  end
  
endmodule

