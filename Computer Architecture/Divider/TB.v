`timescale 1 us/ 1 us
module TB();
  reg clk=1'b0 ,rst=1'b0, start=1'b0;    
  reg [5:0]initial_Q=6'b 011101;           //001100           //001101
  reg [11:0]initial_A=12'b 001101011000;  //000101011001     //001100110011
  wire done;
  wire [5:0]Rem,Quotient;
  Restoring_Divider UUT(clk,rst,start,initial_A,initial_Q,Rem,Quotient,done);
  initial begin
    #100 rst=1'b1;
    #100 rst=1'b0;
    #100 start=1'b1;
    #100 start=1'b0;
    #100000
    $stop;
  end 
  always
  begin
  clk=1'b0;
  clk= #20 1'b1;
  #20;
  end

endmodule
    

