module test_unit (A,B,Clock,Resetn,Start,Done,Product,State);
   input [15:0] Product;
   input Done;
   input [1:0] State;
   output reg Clock, Resetn, Start;
   output reg [7:0] A,B;

   initial begin
       Clock = 1'b0;
       Resetn = 1'b1;
       Start = 1'b0;
   end

   always @(Clock) begin
       #10 Clock <= ~Clock;
       if ($time == 300) begin
          $stop; 
       end
   end

   initial begin
  //     $monitor ($time,,"Product =%b,Clock =%b,State =%b,Done =%b",Product,Clock,State,Done);
       A = 8'd20;
       B = 8'd20;
       Resetn = 1'b0;
       #20 Resetn = 1'b1;
       Start = 1'b1;
       #20 Start = 1'b0;
   end

endmodule
