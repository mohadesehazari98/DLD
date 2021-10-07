`timescale 1 us/ 1 us
module MUXin3(input [31:0]in1,in2,in3,input [1:0]sel,output [31:0]out);
    assign out=(sel==2)?in3:((sel==1)?in2:in1);
endmodule
