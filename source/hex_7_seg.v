module hex_7seg(w,seg);
input [3:0] w;
output [0:6] seg;
wire a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,A,B,C,D,E,F;
assign a0= (~w[3]&~w[2]&~w[1]&~w[0]);
assign a1= (~w[3]&~w[2]&~w[1]&w[0]);
assign a2= (~w[3]&~w[2]&w[1]&~w[0]);
assign a3= (~w[3]&~w[2]&w[1]&w[0]);
assign a4= (~w[3]&w[2]&~w[1]&~w[0]);
assign a5= (~w[3]&w[2]&~w[1]&w[0]);
assign a6= (~w[3]&w[2]&w[1]&~w[0]);
assign a7= (~w[3]&w[2]&w[1]&w[0]);
assign a8= (w[3]&~w[2]&~w[1]&~w[0]);
assign a9= (w[3]&~w[2]&~w[1]&w[0]);
assign A=  (w[3]&~w[2]&w[1]&~w[0]);
assign B=  (w[3]&~w[2]&w[1]&w[0]);
assign C=  (w[3]&w[2]&~w[1]&~w[0]);
assign D=  (w[3]&w[2]&~w[1]&w[0]);
assign E=  (w[3]&w[2]&w[1]&~w[0]);
assign F=  (w[3]&w[2]&w[1]&w[0]);

assign seg[0] = ~(a2|a3|a5|a6|a7|a8|a9|A|C|E|F|a0);

assign seg[1] = ~(a1|a2|a3|a4|a7|a8|a9|A|D|a0);

assign seg[2] = ~(a1|a3|a4|a5|a6|a7|a8|a9|A|B|D|a0);
assign seg[3] = ~(a2|a3|a5|a6|a8|a9|B|C|D|E|a0);
assign seg[4] = ~(a2|a6|a8|A|B|C|D|E|F|a0);
assign seg[5] = ~(a4|a5|a6|a8|a9|A|B|C|E|F|a0);
assign seg[6] = ~(a2|a3|a4|a5|a6|a8|a9|A|B|D|E|F);

endmodule