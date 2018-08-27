module state(
    B,
    Done,
    Clock,
    Start,
    Si,
    Count,
    Resetn
);
input [3:0] B;
input Done;
input Start;
input Clock;
input Resetn;
output reg [3:0] Si;
output reg Count = 1'b0;
localparam S1 = 2'b00;
localparam S2 = 2'b01;
localparam S3 = 2'b10;

reg [1:0] Next = 2'b01;
wire [1:0] State;
initial Next = S1;
mydff s0 (
    .d(Next[0]),
    .q(State[0]),
    .clk(Clock),
    .resetn(Resetn)
);
mydff s1 (
    .d(Next[1]),
    .q(State[1]),
    .clk(Clock),
    .resetn(Resetn)
);
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
    Count = 1'b0;
    Si = 3'b000;
	 Next = State;
    case (State)
        S1: begin
                if (Start) begin
                    Next = S2;
                    Si = Load;
                end
                else       Next = S1;
            end
        S2: begin
          case (B)
             4'b0000,4'b1111: Next = S3;
					   4'b0001, 4'b0010: begin
					       Si = Add;
					       Next = S3;
					   end
					   4'b0011,4'b0100: begin
					       Si = Add2M;
					       Next = S3;
					   end
					   4'b0101, 4'b0110: begin
					       Si = Add3M;
					       Next = S3;
					   end
					   4'b0111: begin
					       Si = Add4M;
					       Next = S3;
					   end
					   4'b1000: begin
					       Si = Sub4M;
					       Next = S3;
					   end
					   4'b1001,4'b1010: begin
					       Si = Sub3M;
					       Next = S3;
					   end
					   4'b1011, 4'b1100: begin
					       Si = Sub2M;
					       Next = S3;
					   end
					   4'b1101, 4'b1110: begin
					       Si = Addc;
					       Next = S3;
					   end
          endcase
            end
        S3: begin
                if (Done) begin
                    Next = S1;
                    Si = Shift;
                end
                else begin 
                    Next = S2;
                    Si = Shift;
                    Count = 1'b1;
                end
            end
     endcase
    if (!Resetn) Next = S1;
	if (Done) Next = S1;
end
endmodule 
