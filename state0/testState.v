
module testState(B,Done,Clock,Start,State,Shift,Count,Load,Add,Addc,Next);
input Shift,Load,Add,Addc,Count,Next;
input [1:0] State;
output reg [1:0] B;
output reg Clock, Start, Done;

initial begin
Clock = 1'b0;
B = 2'b00;
Start = 1'b0;
Done = 1'b0;
end

always @(Clock) #10 Clock <= ~Clock;
initial begin
$monitor ($time,, "B = %b, Start = %b, Shift = %b, State =%b, Count=%b, Add=%b, Addc=%b,Clock=%b,Next=%b",B,Start,Shift,State,Count,Add,Addc,Clock,Next);
#10
Start = 1'b1;
#20
B = 2'b11;
#20
B = 2'b10;
#10
$stop;
end

endmodule
