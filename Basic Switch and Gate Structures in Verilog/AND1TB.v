`timescale 1ns/1ns
module AND1TB();
  wire ww;
  reg aa=1 , bb=1;
  AND1 uut(aa,bb,ww);
initial begin
  #50 aa=0;
  #60 aa=1; 
  #70 bb=0; 
  #65 bb=1;
  #75
  $stop; 
  end
endmodule

