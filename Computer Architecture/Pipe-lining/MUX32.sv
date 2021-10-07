`timescale 1 us/ 1 us
module MUX32(input [31:0]in1,in2,input sel,output [31:0]out);
    assign out=sel?in2:in1;
endmodule

