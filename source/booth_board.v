//////////////////////////////////////////
// Booth Board, 
//
// Interface to connect top level booth 
// module to Altera DE2 FPGA Board
//
//////////////////////////////////////////
module booth_board(
	SW,
	KEY,
	HEX7,
	HEX6,
	HEX5,
	HEX4,
	HEX3,
	HEX2,
	HEX1,
	HEX0,
	LEDR
	);
	
input [17:0] SW;
input [1:0]	 KEY;

output [0:6] HEX7;
output [0:6] HEX6;
output [0:6] HEX5;
output [0:6] HEX4;
output [0:6] HEX3;
output [0:6] HEX2;
output [0:6] HEX1;
output [0:6] HEX0;
output [1:0] LEDR;

wire Clock;
wire Start;
wire Resetn;
wire [7:0] Mcand;
wire [7:0] Mplier;
wire [15:0] Product;

assign Mcand = SW[7:0];
assign Mplier = SW[15:8];
assign Clock = KEY[1];
assign Resetn = KEY[0];
assign Start = SW[17];

booth booth(
    .Clock(Clock),
    .Resetn(Resetn),
    .Start(Start),
    .Mplier(Mplier),
    .Mcand(Mcand),
    .Done(LEDR[0]),
    .Product(Product)
);

hex_7seg mplier1(
	Mplier[7:4],
	HEX7
	);

hex_7seg mplier2(
	Mplier[3:0],
	HEX6
	);	
	
hex_7seg mcand1(
	Mcand[7:4],
	HEX5
	);
	
hex_7seg mcand2(
	Mcand[3:0],
	HEX4
	);

hex_7seg product1(
	Product[15:12],
	HEX3
	);

hex_7seg product2(
	Product[11:8],
	HEX2
	);	

hex_7seg product3(
	Product[7:4],
	HEX1
	);	

hex_7seg product4(
	Product[3:0],
	HEX0
	);	

endmodule
