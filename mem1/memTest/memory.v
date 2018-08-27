// Memory module prototype

module memory(Addr, Data_In, W_En, Clk, M_Sel, Data1_O, Data2_O);

parameter DATA_WIDTH = 9, ADDR_WIDTH = 4;

input [DATA_WIDTH -1:0] Data_In;
input [ADDR_WIDTH -1:0] Addr;
input W_En,Clk,M_Sel;

output reg [DATA_WIDTH -1:0] Data1_O,Data2_O;

// DECLARE MEMORY REGISTERS (ALTERA SRAM)
reg [DATA_WIDTH -1:0] Ram1 [2**ADDR_WIDTH -1:0];
reg [DATA_WIDTH -1:0] Ram2 [2**ADDR_WIDTH -1:0];
/*synthesis ramstyle = "M4K" */

// LOGIC TO STORE MEMORY IN REGISTERS WHEN W_EN ON POSEDGE CLK
always @(posedge Clk) begin
	case({W_En,M_Sel})
		2'b10: Ram1[Addr] = Data_In;
		2'b11:Ram2[Addr]  =Data_In;
	endcase
end
// OUTPUT LOGIC
always @(*) begin
	Data1_O = Ram1[Addr];
	Data2_O = Ram2[Addr];
end
//assign	Data1_O = Ram1[Addr];
//assign	Data2_O = Ram2[Addr];
endmodule	
