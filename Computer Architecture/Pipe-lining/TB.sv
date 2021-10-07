`timescale 1 us/ 1 us
module TB();
 
 reg clk=0,rst=1;
 
  MIPS UUT(clk,rst);
  
  initial begin
    #100 
    rst=0;   
    #1000 $stop;
  end 
  always begin
    #50 clk=!clk;
  end

endmodule

