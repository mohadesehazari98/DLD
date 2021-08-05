timescale 1ns/1ns
module ONEadder(input [7:0]A,B , input cin,rst , output[7:0]S , output cout);
   assign #(182) {cout,S} = A+B+cin;
endmodule 
