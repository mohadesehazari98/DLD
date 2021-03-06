`timescale 1ns/1ns
module TBpartnine();  
  reg [7:0]SA= 8'b 01100101;
  reg clk=0;
  reg rst=1;
  wire [7:0]SS9,SSff,SL;
  wire Sout9,Soutff,SoutL;
  Sequadder UUT6(SA,clk,rst,SSff,Soutff);
  partnine UUT3(SA,clk,rst,SS9,Sout9);
  seQuADD UUT7(SA , clk , rst ,SL,SoutL);
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
