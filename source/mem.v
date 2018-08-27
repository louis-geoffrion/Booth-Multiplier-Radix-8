//////////////////////////////////////////
// Memory Module 
//
// Holds N bit numbers in 3 seperate registers
// Also performs calculations addressed by si line
// Used to facilitate booths algorithm
//////////////////////////////////////////
module mem (
    A,
    B,
    Clock,
    Resetn,
    Si,
    Product,
    Lsb);

parameter N = 8;

input [N-1:0] A;
input [N-1:0] B;
input Clock; 
input Resetn;
input [3:0] Si;

output [N+N-1:0] Product;
output [3:0] Lsb;

reg [N:0] A_In;
reg [N:0] B_In;
reg [N:0] C_In;

wire [N:0] A_Out;
wire [N:0] B_Out;
wire [N:0] C_Out;

reg A_En;
reg B_En;
reg C_En;

// MemBlock holds A,B,C registers
memblock memblock(
   .A_In(A_In),
   .B_In(B_In),
   .C_In(C_In),
   .A_En(A_En),
   .B_En(B_En),
   .C_En(C_En),
   .A_Out(A_Out),
   .B_Out(B_Out),
   .C_Out(C_Out),
   .Clock(Clock)
   );

defparam memblock.N = N;
integer count;
// Signal Encoding
localparam Add = 4'b0001;
localparam Addc = 4'b0010;
localparam Load = 4'b0011;
localparam Shift = 4'b0100;
localparam Add2M = 4'b0101;
localparam Sub2M = 4'b0110;
localparam Add3M = 4'b0111;
localparam Add4M = 4'b0111;
localparam Sub3M = 4'b1000;
localparam Sub4M = 4'b1001;

always @(*) begin

A_En = 1'b0;
B_En = 1'b0;
C_En = 1'b0;
A_In = {N+1{1'b0}};
B_In = {N+1{1'b0}};
C_In = {N+1{1'b0}};

	 case (Si)

			Load: begin
					 A_In = {N+1{1'b0}};       // A gets 0's
					 B_In = {A,1'b0};  				 // B gets  A,0
					 C_In = {B[N-1],B};   		 // C gets SE B
					 A_En = 1'b1;
					 B_En = 1'b1;
					 C_En = 1'b1;      				 // Enable Write
			end

			Add: begin
					 A_In = A_Out + C_Out;
					 A_En = 1'b1;
			end

			Addc: begin
					 A_In = A_Out + ~C_Out+1; //Add Twos Comp
					 A_En = 1'b1;
			end

			Shift: begin
					 {A_In,B_In} = {A_Out[N],A_Out[N],A_Out[N],A_Out,B_Out[N:3]};
					 A_En = 1'b1;
					 B_En = 1'b1;
			end

			Add2M: begin
				A_In = A_Out + 2*C_Out;
				A_En = 1'b1;
			end

			Sub2M: begin
						A_In = A_Out - 2*C_Out;
						A_En = 1'b1;
			end

			Add3M: begin
				A_In = A_Out + 3*C_Out;
				A_En = 1'b1;
			end

			Add4M: begin
				A_In = A_Out + 4*C_Out;
			end
				
			Sub3M: begin
				A_In = A_Out - 3*C_Out;
				A_En = 1'b1;
			end

			Sub4M: begin
				A_In = A_Out - 4*C_Out;
				A_En = 1'b1;
			end
	 endcase
end

assign Product = {A_Out[N-1:0],B_Out[N:1]};
assign Lsb = B_Out[3:0];
endmodule
