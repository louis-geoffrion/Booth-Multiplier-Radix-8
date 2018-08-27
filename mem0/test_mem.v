module test_mem (Mplier,Mplicand,Load,Add,Addc,Shift,Clock,Reset,Product,A,B,C);

parameter n =8;
output reg [n-1:0] Mplier,Mplicand;
output reg Load,Add,Addc,Shift,Reset;
input [n+n-1:0] Product;
input [n:0] A,B,C;
output Clock;
reg Clock=1'b0;

    always @(Clock) #10 Clock <= ~Clock;

initial begin
$monitor ($time,,"A = %b,B=%b,C=%b,Clock=%b",A,B,C,Clock);
    Mplier = 8'd20;
    Mplicand = 8'd120;
    {Load,Add,Addc,Shift,Reset} = 5'd0;
#10 Load = 1'b1;
$display ("Load");
#20 Load = 1'b0;
#20 Add = 1'b1;
$display ("Add");
#20 Add = 1'b0;
#20 Addc = 1'b1;
$display ("Addc");
#20 Addc = 1'b0;
#20 Shift = 1'b1;
$display ("Shift");
#20 Shift = 1'b0;
#20 Reset = 1'b1;
$display ("Reset");
#20 Reset = 1'b0;
end
    

endmodule
