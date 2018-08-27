
module tbCount;
wire en,clk,reset,done;
wire [3:0] count;

  test_count tb(.count(count),.en(en),.reset(reset),.clk(clk),.done(done));
  counter uut(.en(en),.clk(clk),.reset(reset),.count(count),.done(done));
  defparam uut.max = 8;
endmodule
