`timescale 1ns/1ns
module TBSeq();  
  reg [7:0]SA= 8'b 01100101;
  reg clk=0;
  reg rst=1;
  wire [7:0]SS;
  wire Sout;
  Sequadder UUT3(SA,clk,rst,SS,Sout);
  initial begin
    #250
    clk=1;
    #300
    clk=0; rst=0;
    #250
    clk=1;
    #300
    clk=0; SA=11100101; rst=1;
    #250
    clk=1;
    #300
    clk=0; rst=0;
    #250
    clk=1;
    #300
    clk=0;
    #250
    $stop;
  end
endmodule
    