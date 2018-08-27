
module testState(B,Done,Clock,Start,State,Next,Reset);
input [1:0] State,Next;
output reg [1:0] B;
output reg Clock, Start, Done,Reset;

initial begin
Clock = 1'b0;
B = 2'b00;
Start = 1'b0;
Done = 1'b0;
end

always @(Clock) begin
    #10 Clock <= ~Clock;
    if ($time == 100)
        $stop;
end

initial begin
$monitor ($time,, "B = %b, Start = %b, State =%b,Clock=%b,Next=%b",B,Start,State,Clock,Next);
Reset = 1'b0;
#20
Reset = 1'b1;
Start = 1'b1;
#20
B = 2'b11;
Start = 1'b0;
#20
B = 2'b10;
#20
B = 2'b00;
//Done = 1'b1;
#20
$stop;
end

endmodule
