`timescale 1ns/1ns
module final_TB();
  reg clk,rst;
  reg[12:0] SW;
  reg ld;
  wire[7:0] out_wave;
  
  Lab_3_project UUF(
  .clk(clk),
  .rst(rst),
  .SW(SW),
  .ld(ld),
  .out_final(out_wave)
  );
  initial begin
    #20
    rst=1'b0;
    ld=1'b0;
    SW=13'b0000010110100;
    #20
    ld=1'b1;
    rst=1'b1;
    #20
    rst=1'b0;
    #10000000
    $stop;
  end
  
  always
  begin
  clk=1'b0;
  clk= #20 1'b1;
  #20;
  end
  
endmodule



