`timescale 1 ns/ 1 ns
module TB_Ring();
  reg en;
  wire clk_out;
 
  Ring#(3,17) UUT(en,clk_out);
  initial begin
    #200 en=1'b0;
    #200 en=1'b0;
    #200 en=1'b1;
    #100000
    $stop;
  end 
  
endmodule
