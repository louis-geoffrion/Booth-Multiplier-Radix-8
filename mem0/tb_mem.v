module tb_mem ;
    wire [7:0] Mplier,Mplicand, C;
    wire Add,Addc,Shift,Reset,Load;
    wire [8:0] A,B;
    wire [15:0] Product;
    wire Clock;
         test_mem tb (.Mplier(Mplier),.Mplicand(Mplicand),.Load(Load),
            .Add(Add),.Addc(Addc),.Shift(Shift),.Clock(Clock),
            .Reset(Reset),.Product(Product),.A(A),.B(B),.C(C));
         
        mem uut (.Mplier(Mplier),.Mplicand(Mplicand),.Load(Load),
            .Add(Add),.Addc(Addc),.Shift(Shift),.Clock(Clock),
            .Reset(Reset),.Product(Product),.Data1_O_A(A),.Data1_O_B(B),
            .Data1_O_C(C));

endmodule
