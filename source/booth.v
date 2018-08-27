//////////////////////////////////////////////////////////////
// Booth multiplier Top level
//
// Instantiates A state machine which will
// Multiply N bit numbers using Booths 
// optimized algorithm for multiplication
//
// State 		- State machine controller
// Mem	 		- Stores data before, during, after
// Counter 	- Used by State Machine to keep track of cycles
//////////////////////////////////////////////////////////////
module booth(
    Clock,
    Resetn,
    Start,
    Mplier,
    Mcand,
    Done,
    Product
);

parameter N = 8;
input Clock;
input Resetn;
input Start;
input [N-1:0] Mplier;
input [N-1:0] Mcand;
output Done;
output [N+N-1:0] Product;

wire Count_En;
wire [3:0] Si;
wire [3:0] Lsb;

state state (
    .B          ( Lsb       ),
    .Done       ( Done      ),
    .Clock      ( Clock     ),
    .Start      ( Start     ),
    .Si         ( Si        ),
    .Count      ( Count_En  ),
    .Resetn     ( Resetn    )
);

mem mem (
    .A          ( Mplier    ),
    .B          ( Mcand     ),
    .Clock      ( Clock     ),
    .Resetn     ( Resetn    ),
    .Si         ( Si        ),
    .Product    ( Product   ),
    .Lsb        ( Lsb       )
);

defparam  mem.N = N;

counter counter(
    .en         ( Count_En  ),
    .clk        ( Clock     ),
    .resetn     ( Resetn    ),
    .count      (           ),
    .done       ( Done      )
);

defparam counter.max = 2;

endmodule
