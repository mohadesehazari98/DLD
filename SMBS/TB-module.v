`timescale 1ns/1ns
module tb_controller();
 reg clk=0,rst=0;
 reg si=1; 
 wire shePL,valid;
 wire[5:0] PL_OUT;
controller uut(clk,rst,si,shePL,valid,PL_OUT);
always#50 clk=~clk;
initial begin
  rst=1;
  #50 rst=0;
  #30 si=0;
  #100 si=1;
  #500 si=0;
  #200 si=1;
  #150 si=0;
  #200 si=1;
  #50  si=0;
  #120 si=1;
  #300 si=0;
  #250 si=1;
  #500 si=0;
  #300 si=1;
  #450 si=0;
  #300 si=1;
  #100
  $stop;
end
endmodule
  