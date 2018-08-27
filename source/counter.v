// This is an n bit counter


module counter (
    en,
    clk,
    resetn,
    count,
    done);
parameter n=4, max=3;
input en;
input clk;
input resetn;
output reg [n-1:0] count = 4'b0;
output reg done=1'b0;

always @(posedge clk) begin
    if (count < max)
		done = 1'b0;
	 if (!resetn) begin
      done = 1'b0;
      count = {(n-1) {1'b0}};
    end
    if (en)begin
        if (count == max ) begin
          done = 1'b1;
          count = {(n-1){1'b0}};
          //#40 done = 1'b0;
        end
        else if (count < max) begin
          count = count +1;
          done = 1'b0;
        end
    end
end
endmodule
