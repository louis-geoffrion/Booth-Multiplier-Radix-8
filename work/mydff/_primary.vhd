library verilog;
use verilog.vl_types.all;
entity mydff is
    port(
        d               : in     vl_logic;
        q               : out    vl_logic;
        clk             : in     vl_logic;
        resetn          : in     vl_logic
    );
end mydff;
