`timescale 1ns/1ns
module OR1(input a , b ,w);
 supply1 vdd;
 supply0 GND;
 wire i,j;
 pmos #(5,6,7) T1(i,vdd,a);
 pmos #(5,6,7) T2(j,i,b);
 nmos #(3,4,5) T3(j,GND,b);
 nmos #(3,4,5) T4(j,GND,a);
 pmos #(5,6,7) T5(w,vdd,j);
 nmos #(3,4,5) T6(w,GND,j); 
endmodule 
