/* Sate Machine for a booth multiplier
  S1: !Start    => S1 
      Start     => S2   => Load
  S2: B=11 
      !Done     => S2   =>
      B=00
      !Done     => S2
      B=01      => S3
      B=10      => S3
      B=11  
      Done      => S1
      B=00
      Done      => S1
  S3: !Done     => S2
      Done      => S1
*/

module boothStates(B,Done,Clock,Start,State,Shift,Count,Load,Add,Addc,Reset);
input [1:0] B;
input Done,Start,Clock,Reset;
output [1:0] State;
output Shift, Count,Load,Add,Addc;
reg Shift = 1'b0, Count= 1'b0,Load = 1'b0;
reg Add = 1'b0, Addc =1'b1;
reg [1:0] Next = 2'b01;
localparam S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
initial Next = S1;
dff s0 (.d(Next[0]),.q(State[0]),.clk(Clock),.reset(Reset));
dff s1 (.d(Next[1]),.q(State[1]),.clk(Clock),.reset(Reset));

always @(*) begin
    {Addc,Add,Load,Count,Shift}=5'd0;
    Next = State;
    case (State)
        S1: begin
            if (Start) Next = S2;
            else       Next = S1;
            end
        S2: begin
            case (B)
                2'b11, 2'b00: begin
                    if (Done) begin
                        Next = S1;
                        Shift = 1'b1;
                        end
                    else begin 
                        Next = S2;
                        Shift = 1'b1;
                        Count = 1'b1;
                        end
                    end
                2'b10: begin
                    Add = 1'b1;
                    Next = S3;
                    end
                2'b01: begin
                    Addc = 1'b1;
                    Next = S3;
                    end
            endcase
            end
        S3: begin
            if (Done) begin
                Next = S1;
                Shift = 1'b1;
                end
            else begin
                Next = S2;
                Shift = 1;
                Count =1;
                end
            end
     endcase
    if (Reset) Next = S1;

end
endmodule 
