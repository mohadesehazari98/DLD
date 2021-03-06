`timescale 1 ns/ 1 ns
module TB_fdevid();
 reg [7:0]A;
 reg ld,rst;
 wire [7:0]Q;
 reg clk;
 wire maxmin;
 wire out=1'b0;
 wire [7:0] dis;
 //wire clk;
 //Ring UUM(.en(en),.clk_out(clk));
 F_devider_Q UUT(
 .A(A[0]),
 .B(A[1]),
 .C(A[2]),
 .D(A[3]),
 .A2(A[4]),
 .B2(A[5]),
 .C2(A[6]), 
 .D2(A[7]),
 .clock_oscillator(clk),
 .Load(ld),
 .QA(Q[0]),
 .QB(Q[1]),
 .QC(Q[2]),
 .QD(Q[3]),
 .QA2(Q[4]),
 .QB2(Q[5]),
 .QC2(Q[6]),
 .QD2(Q[7]),
 .dis(dis),
 .pin_name1(rst),
 .maxmin(maxmin)
 );

 assign out = &Q;
 
  initial begin
    #200
    rst=1'b1;
    #200
    A=8'b 10001111;
    rst=1'b0;
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
  clk= #200 1'b1;
  #200;
  end
  always @(posedge out)
  begin
  ld=1'b0;
  ld= #200 1'b1;
  #200;
  end
endmodule
  
