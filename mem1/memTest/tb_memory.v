module tb_memory;


parameter DATA_WIDTH = 9, ADDR_WIDTH = 4;

wire [DATA_WIDTH -1:0] Data_In;
wire [ADDR_WIDTH -1:0] Addr;
wire W_En,Clk,M_Sel;

wire [DATA_WIDTH -1:0] Data1_O,Data2_O;


memory uut(.Addr(Addr), .Data_In(Data_In), .W_En(W_En), .Clk(Clk), .M_Sel(M_Sel), .Data1_O(Data1_O), .Data2_O(Data2_O));
test_memory tb(.Addr(Addr), .Data_In(Data_In), .W_En(W_En), .Clk(Clk), .M_Sel(M_Sel), .Data1_O(Data1_O), .Data2_O(Data2_O));
endmodule
