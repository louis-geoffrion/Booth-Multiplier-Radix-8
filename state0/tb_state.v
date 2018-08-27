module tbState;

wire Done,Clock,Start,Shift,Count,Load,Add,Addc;
wire [1:0] B,State;

testState tb(.B(B),.Done(Done),.Clock(Clock),.Start(Start),.Shift(Shift),.Count(Count),.Load(Load),.Add(Add),.Addc(Addc));
boothStates uut(.B(B),.Done(Done),.Clock(Clock),.Start(Start),.State(State),.Shift(Shift),.Count(Count),.Load(Load),.Add(Add),.Addc(Addc),.Reset(Reset));

endmodule
