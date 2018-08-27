module tbState;

wire Done,Start,Reset;
wire [1:0] B,State,Next;

testState tb(.B(B),.Done(Done),.Clock(Clock),.Start(Start),.Next(Next),
    .State(State),.Reset(Reset));
boothStates uut(.B(B),.Done(Done),.Clock(Clock),.Start(Start),.State(State),.Next(Next),.Resetn(Reset));

endmodule
