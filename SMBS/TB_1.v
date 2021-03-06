`timescale 1ns/1ns
module tb_smbs();
  reg SI=1;
  reg[3:0]PB;
  reg[1:0]LB;
  wire[3:0]L0,L1,L2,L3;
  SMBS uut(SI,PB,LB,L0,L1,L2,L3);
 // always #50 clk=~clk;
  initial begin
    #100
    PB=4'b0001;
    LB=2'b00;
    #40
    SI=0;
    #100
    SI=1;
    #50
    $stop;
  end
endmodule
    
    