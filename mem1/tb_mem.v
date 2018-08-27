module tb_mem ;
wire Clock,Resetn;
wire [2:0] Si;
wire [7:0] A,B;
wire [15:0] Product;

mem uut(.A(A),.B(B),.Clock(Clock),.Resetn(Resetn),.Si(Si),
    .Product(Product));
test_mem tb(.A(A),.B(B),.Clock(Clock),.Resetn(Resetn),.Si(Si),
    .Product(Product));

endmodule
