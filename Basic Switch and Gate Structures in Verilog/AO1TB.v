`timescale 1ns/1ns
module AO1TB();
  wire ww;
  reg aa=1 , bb=1 , cc=1;
  AO1 uut1 (aa,bb,cc,ww);
initial begin
  #50 aa=0;
  #60 aa=1; 
  #70 bb=0; 
  #65 bb=1;
  #75 cc=0;
  #80 cc=1;
  #75
  $stop; 
  end
endmodule

