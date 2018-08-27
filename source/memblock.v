module memblock(
   A_In,
   B_In,
   C_In,
   A_En,
   B_En,
   C_En,
   A_Out,
   B_Out,
   C_Out,
   Clock
);
parameter N = 8;
input [N:0] A_In;
input [N:0] B_In;
input [N:0] C_In;
input A_En;
input B_En;
input C_En;
output [N:0] A_Out;
output [N:0] B_Out;
output [N:0] C_Out;
input Clock;
reg [3:0] Addr = 4'd0;
reg M_Sel = 1'b0;

   memory A (
       .Addr(Addr),
       .Data_In(A_In),
       .W_En(A_En),
       .Clk(Clock),
       .M_Sel(M_Sel),
       .Data1_O(A_Out),
       .Data2_O()
   );
   defparam A.DATA_WIDTH = N+1;
   memory B (
       .Addr(Addr),
       .Data_In(B_In),
       .W_En(B_En),
       .Clk(Clock),
       .M_Sel(M_Sel),
       .Data1_O(B_Out),
       .Data2_O()
   );
   defparam B.DATA_WIDTH = N+1;
   memory C (
       .Addr(Addr),
       .Data_In(C_In),
       .W_En(C_En),
       .Clk(Clock),
       .M_Sel(M_Sel),
       .Data1_O(C_Out),
       .Data2_O()
   );
   defparam C.DATA_WIDTH = N+1;
endmodule
