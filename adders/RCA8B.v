module RCA_8B(A,B,COUT,CIN,SUM);

input [8:0] A,B;
input CIN;
output COUT;
output [8:0] SUM;

wire [8:0] int_cin, int_cout;

assign int_cin[8:1] = int_cout[7:0];
assign COUT = int_cout[8];
assign int_cin[0] = CIN;

FA inst[8:0] (.A(A),.B(B),.CIN(int_cin),.COUT(int_cout),.SUM(SUM)); 

endmodule
