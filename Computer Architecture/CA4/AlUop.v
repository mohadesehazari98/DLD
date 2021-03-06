`timescale 1ns/1ns
module AlUop(input[7:0] A,B,input[1:0] AlUop,output[7:0] AlUout,output zero);
  assign AlUout = (AlUop==2'b 00) ? (A+B) : 
                  (AlUop==2'b 01) ? (A-B) :
                  (AlUop==2'b 10) ? (A&B) :
                  (AlUop==2'b 11) ? (~B)  :
                  8'b 00000000;
  assign zero = (AlUop==2'b 01) ? ((AlUout==8'b 00000000) ? 1'b 1 : 1'b 0) : 1'b 0;
endmodule
  