`timescale 1 us/ 1 us
module TB_timer();
  reg clk=0 , reset = 0;
  wire pulse_1 , pulse_2 , pulse_3;
  lm_555_timer_v#(1,1,10) UUT(clk,reset,pulse_1);
  lm_555_timer_v#(1,10,10) UUT2(clk,reset,pulse_2);
  lm_555_timer_v#(1,100,10) UUT3(clk,reset,pulse_3);
  
  initial begin
    #100 clk=1 ; reset=1;
    #100 clk=0 ; reset=0;
  repeat(100000)#100 clk=~clk;
  end 
  
endmodule
    
