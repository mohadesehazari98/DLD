module Assign(input p0,p1,p2,g0,g1,g2,c0,output w);
  assign #(38) w=((p2&p1)&(g0|(p0&c0))|(g2|(p2&g1)));
endmodule
