// D-Flip Flop

module mydff(d,q,clk,resetn);
input d,clk,resetn;
output q;
reg    q;

always @(posedge clk) begin
  if (!resetn)
    q <= 1'b0;
  else 
    q <= d;
end
endmodule
