module test_mem (A,B,Clock,Resetn,Si,Product);
        
    output reg [7:0] A,B;
    output reg Clock, Resetn;
    output reg [2:0] Si;
    input [15:0] Product;
    
    initial Clock = 1'b0;
    always @(Clock) begin
        #20 Clock <= ~Clock;
    
        if ($time == 250) begin
           $stop; 
        end
    end
    
    localparam Add = 3'b001, Addc = 3'b010, Load = 3'b011, Shift = 3'b100;
    initial begin
        //$monitor ($time,,"\nSi=%b\n",Si);
        A = 8'd20;
        B = 8'd30;
        Si = Load;
        #40 Si = Add;
        #40 Si = Load;
        #40 Si = Addc;
        #40 Si = Shift;
        //#20 Si = Addc;
    end
endmodule
