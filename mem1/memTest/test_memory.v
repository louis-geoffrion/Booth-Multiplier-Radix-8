
module test_memory(Addr, Data_In, W_En, Clk, M_Sel, Data1_O, Data2_O);

parameter DATA_WIDTH = 9, ADDR_WIDTH = 4;

output reg [DATA_WIDTH -1:0] Data_In;
output reg [ADDR_WIDTH -1:0] Addr;
output reg W_En,Clk,M_Sel;

input [DATA_WIDTH -1:0] Data1_O,Data2_O;

initial Clk = 1'b0;
always @(Clk) begin
    #10 Clk <= ~Clk;
    if ($time == 200)
        $stop;
    $display ($time,"Data_in =%b, Data1_0=%b,Clk=%b",Data_In,Data1_O,Clk);
end
integer i;
initial begin
Data_In = 9'd10;
Addr = 4'd0;
W_En = 1'b1;
M_Sel= 1'b0;
for (i=0;i<10;i=i+1) begin
    #10 Data_In=i;
end
end
endmodule
