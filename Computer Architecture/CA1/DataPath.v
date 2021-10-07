`timescale 1ns/1ns
module DataPath(input [11:0]initial_A,input [5:0]initial_Q,input clk,rst,input shA,shQ,ldA,ldQ0,Q0,add,sub,output [5:0]Rem , output [5:0]Quotient,output A5);
wire [5:0]out_Q;
wire[6:0]out_Add_Sub,out_D,out_A;

A UUTA(clk,rst,initial_A[11:6],ldA,shA,out_Q[5],out_Add_Sub,out_A);
Q UUTQ(clk,rst,initial_A[5:0],Q0,ldQ0,shQ,out_Q);
Add_Sub UUTS(clk,rst,out_A,out_D,add,sub,out_Add_Sub);

assign out_D={initial_Q[5],initial_Q};
assign Quotient=out_Q;
assign Rem=out_A[5:0];
assign A5=out_A[6];
  
endmodule

