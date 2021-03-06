`timescale 1ns/1ns
module sixthadd(input[15:0]A,B,input c0,output[15:0]S,output c16,output[15:0]G,P);
  wire [16:0]ic;
  genvar j;
  generate  for(j=0;j<=12;j=j+4) begin:row
    fourbitadd SFA(A[(j+3):j] , B[(j+3):j] , ic[j] , S[(j+3):j] , ic[(j+4)] , G[(j+3):j] , P[(j+3):j]);
  end
endgenerate
assign c16 = ic[16];
assign ic[0]=c0;
endmodule
