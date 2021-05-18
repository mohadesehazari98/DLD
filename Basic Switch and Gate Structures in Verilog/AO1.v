`timescale 1ns/1ns
module AO1(input a,b,c, output w);
  supply1 vdd;
  supply0 GND;
  wire i,j,m;
  pmos #(5,6,7) T1(i,vdd,c);
  pmos #(5,6,7) T2(j,i,a);
  pmos #(5,6,7) T3(j,i,b);
  nmos #(3,4,5) T4(j,m,a);
  nmos #(3,4,5) T5(j,GND,c);
  nmos #(3,4,5) T6(m,GND,b);
  pmos #(5,6,7) T7(w,vdd,j);
  nmos #(3,4,5) T8(w,GND,j);
endmodule 
