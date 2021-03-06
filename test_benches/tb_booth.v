module tb_booth ();
parameter n=8;
parameter num_vectors=8;
reg Clock;
reg Resetn;
reg Start;
wire Done;
reg     [n-1:0]     Mplier;
reg     [n-1:0]     Mcand;
wire    [n+n-1:0]   Product;
reg     [n+n-1:0]   vectors [0:num_vectors-1];
integer i;

booth UUT (
    .Clock      (Clock),
    .Resetn     (Resetn),
    .Start      (Start),
    .Mplier     (Mplier),
    .Mcand      (Mcand),
    .Done       (Done),
    .Product    (Product)
);

initial                         // Clock Generator
begin
    Clock = 1'b0;
    forever #20 Clock = ~Clock; // Clock Period 40 ns
end
initial begin
vectors [0] = 16'b01100110_00110011;
vectors [1] = 16'b10100110_01100110;
vectors [2] = 16'b01101011_10001110;
vectors [3] = 16'b11001100_10011001;
vectors [4] = 16'b10000000_10000000;
vectors [5] = 16'b11111111_11111111;
vectors [6] = 16'b00000000_01010101;
vectors [7] = 16'b01111111_00000000;
end

initial                         // Test stimulus 
begin
    Resetn = 1'b0;              // Synchronous reset of State Machine
    Start = 1'b0;               // Set Start to 'false'
    #80 Resetn = 1'b1;          // Reset low for 2 Clock Periods
    for (i=0;i<num_vectors-1;i=i+1) begin
        {Mplier,Mcand} = vectors [i];       // load mplier mcand
        #20 Start = 1'b1;                   // start = true
        #80 Start = 1'b0;                   // after 2 clock cycles reset Start
        wait (Done==1);
        wait (Done==0);
        $display("Mplier=%b,Mcand=%b,Product=%b",Mplier,Mcand,Product);
    end
	$stop;
end
/*
always @(posedge Clock) begin
    $display ("A=%b,B=%b,C=%b,Wen=%b\n",
        UUT.mem.A_Out,
        UUT.mem.B_Out,
        UUT.mem.C_Out,
        UUT.mem.B_En
    );
    if ($time > 750) begin
        $stop;
    end
end
*/
endmodule
