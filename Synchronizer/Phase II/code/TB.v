`timescale 1 ns/ 1 ns
module TB();
 reg clk,rst,ld;
 reg [7:0]set;
 wire PSI;
 reg ring;
 wire [7:0]adj;
 //reg en;
 wire increment,decrement;
 wire [8:0]duration;
 //ring_oscillator UUM(.en(en),.clk_out(ring));
 Clock_adjusting UUT(
 .clk(clk),
 .rst(rst),
 .setPeriod(set),
 .ld(ld),
 .adj(adj),
 .PSI(PSI),
 .ring(ring),
 .increment(increment),
 .decrement(decrement),
 .duration(duration)
 );

  initial begin
    #200
    rst=1'b1;
    //en=1'b0;
    #200
    set=8'b 01111101;
    rst=1'b0;
    //en=1'b1;
    #200
    ld=1'b0;
    #200
    ld=1'b1;
    #10000000
    $stop;
  end 
  
  always
  begin
  clk=1'b0;
  clk= #20 1'b1;
  #20;
  end
  //if you want to be more specific
  always
  begin
  ring=1'b0;
  ring= #25 1'b1;
  #25;
  end
  
endmodule
  
