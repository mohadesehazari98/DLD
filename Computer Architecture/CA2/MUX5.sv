`timescale 1 us/ 1 us
module MUX5(input [4:0]in1,in2,input sel,output [4:0]out);
    assign out=sel?in2:in1;
endmodule

