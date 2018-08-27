library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        n               : integer := 4;
        max             : integer := 3
    );
    port(
        en              : in     vl_logic;
        clk             : in     vl_logic;
        resetn          : in     vl_logic;
        count           : out    vl_logic_vector;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of max : constant is 1;
end counter;
