`timescale 1ns/1ns
module Amplitude_Selector(input [1:0]SW,input[7:0] in_signal,output[7:0] out_signal);
  wire [3:0]Divisor;
  //multiplexer
  assign Divisor = SW[1] ? (SW[0] ? 4'b1000 : 4'b0100) : (SW[0] ? 4'b0010 : 4'b0001);
  //Dividor
  assign out_signal=in_signal/Divisor;
endmodule