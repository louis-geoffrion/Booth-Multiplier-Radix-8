module tb_unit;


wire [7:0] A,B;
wire [15:0] Product;
wire Start, Done, Clock,Resetn;

wire [2:0] Si;
wire [1:0] Lsb,State;
wire Count;
test_unit   t(.A(A),.B(B),.Clock(Clock),.Resetn(Reset),.Start(Start),
    .Done(Done),.Product(Product),.State(State));

boothStates s(.B(Lsb),.Done(Done),.Clock(Clock),.Start(Start),.State(State),.Si(Si),.Count(Count),
    .Resetn(Resetn));

mem         m(.A(A),.B(B),.Clock(Clock),.Resetn(Resetn),.Si(Si),
    .Product(Product),.Lsb(Lsb));

counter     c(.en(Count),.clk(Clock),.resetn(Resetn),.count(),.done(Done));
      defparam c.max = 8;
endmodule
