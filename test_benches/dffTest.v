module dffTest(d,q,clk,reset);
input q;
output d,clk,reset;
reg d,clk,reset;

initial clk = 1'b0;
always @(clk) #10 clk <= ~clk;
initial d = 1'b0;
integer i=0;

initial begin
$monitor ($time,, "q= %b, d = %b, clk = %b",q,d,clk);
reset = 1'b0;
#10 reset = 1'b1;
#20 reset = 1'b0;

for (i=0;i<30;i=i+1) begin
  #20 d = ~d;
end
$stop;
end
endmodule
