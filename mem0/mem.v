// mem unit, holds A, B, C register, shifts, adds, addsc, 
//
//

module mem (Mplier,Mplicand,Load,Add,Addc,Shift,Clock,Reset,Product,Data1_O_A,Data1_O_B,Data1_O_C);
parameter n =8;
input [n-1:0] Mplier,Mplicand;
input Load,Clock,Add,Addc,Shift,Reset;
output [n+n-1:0] Product;
output [n:0] Data1_O_A,Data1_O_B;
output [n-1:0] Data1_O_C;

reg [3:0] Addr_A= 3'd0;
reg [n:0] Data_In_A; // n+1 bit Data bus for reg a
reg W_En_A=1'b0, M_Sel_A=1'b0;
wire [n:0] Data1_O_A, Data2_O_A;

memory A_Reg(.Addr(Addr_A),.Data_In(Data_In_A),.W_En(W_En_A),.Clk(Clock),.M_Sel(M_Sel_A),.Data1_O(Data1_O_A),.Data2_O(Data2_O_A));
defparam A_Reg.DATA_WIDTH = 9;
    // Declared 9 bit register to use as A reg
    //

reg [3:0] Addr_B= 3'd0;
reg [n:0] Data_In_B; // n+1 bit Data bus for reg a
reg W_En_B=1'b0, M_Sel_B=1'b0;
wire [n:0] Data1_O_B, Data2_O_B;
    
memory B_Reg(.Addr(Addr_B),.Data_In(Data_In_B),.W_En(W_En_B),.Clk(Clock),.M_Sel(M_Sel_B),.Data1_O(Data1_O_B),.Data2_O(Data2_O_B));
defparam B_Reg.DATA_WIDTH = 9;
    // Declared 9 bit register to use as B reg
    //

reg [3:0] Addr_C= 3'd0;
reg [n-1:0] Data_In_C; // n+1 bit Data bus for reg a
reg W_En_C=1'b0, M_Sel_C=1'b0;
wire [n-1:0] Data1_O_C, Data2_O_C;
memory C_Reg(.Addr(Addr_C),.Data_In(Data_In_C),.W_En(W_En_C),.Clk(Clock),.M_Sel(M_Sel_C),.Data1_O(Data1_O_C),.Data2_O(Data2_O_C));
defparam C_Reg.DATA_WIDTH = 8;
    // Declared 8 bit register to use as C reg
    //

always @(posedge Clock) begin
    {W_En_A,W_En_B,W_En_C} = 3'b000;
    if (Load == 1'b1) begin
        {W_En_A,W_En_B,W_En_C} = 3'b111;
        Data_In_A = 9'd0;
        Data_In_B = {Mplier,1'b0};
        Data_In_C = Mplicand;
    end
    if (Shift == 1'b1) begin
        {W_En_A,W_En_B} = 2'b11;
        {Data_In_A,Data_In_B} = {Data1_O_A[8],Data1_O_A,Data1_O_B[8:1]};
    end
    if (Add) begin
        W_En_A = 1'b1;
        Data_In_A = Data1_O_A + {Data2_O_C[7],Data2_O_C};
    end
    if (Addc) begin
        W_En_A = 1'b1;
        Data_In_A = Data1_O_A + ~{Data2_O_C[7],Data2_O_C};
    end
end
endmodule
