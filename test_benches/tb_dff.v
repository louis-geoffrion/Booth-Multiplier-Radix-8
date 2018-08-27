module tb_dff;

wire q,d,clk,reset;

dff uut(.d(d),.q(q),.clk(clk),.reset(reset));
dffTest test(.d(d),.q(q),.clk(clk),.reset(reset));

endmodule
