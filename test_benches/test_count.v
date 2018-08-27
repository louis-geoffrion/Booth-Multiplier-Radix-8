// This will generate a clk signal for 20 clock cycles and display the results



module test_count (count,en,reset,clk,done);
parameter n=4, max =10;

input [n-1:0] count;
input done;
output en, reset, clk;
reg clk, en;
integer i =0;
initial begin
clk = 1'b0;
en = 1'b1;
$monitor ($time,, "count = %b,done =%b",count,done);
for (i=0;i<30;i=i+1) begin 
   #1 
   clk = ~clk;
end 
end
endmodule
