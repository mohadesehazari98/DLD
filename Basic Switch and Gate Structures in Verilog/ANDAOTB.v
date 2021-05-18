`timescale 1ns/1ns
module ANDAOTB();
  wire ww,w ;
  reg aa=1 , bb=1;
  AND1 uut(aa,bb,ww);
  AND2 uut2(aa,bb,w);
  initial begin
    #75 aa=0;
    #80 aa=1;
    #70 bb=0;
    #85 bb=1;
    #80 $stop;
  end
endmodule
