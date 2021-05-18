`timescale 1ns/1ns
module AND1(input a,b,output w);
  supply1 vdd;
  supply0 GND;
  wire i,j ;
  pmos #(5,6,7) T1(i,vdd,a);
  pmos #(5,6,7) T2(i,vdd,b);
  nmos #(3,4,5) T3(i,j,b);
  nmos #(3,4,5) T4(j,GND,a);
  pmos #(5,6,7) T5(w,vdd,i);
  nmos #(3,4,5) T6(w,GND,i);
endmodule
