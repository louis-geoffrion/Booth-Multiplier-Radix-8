library verilog;
use verilog.vl_types.all;
entity booth is
    generic(
        N               : integer := 8
    );
    port(
        Clock           : in     vl_logic;
        Resetn          : in     vl_logic;
        Start           : in     vl_logic;
        Mplier          : in     vl_logic_vector;
        Mcand           : in     vl_logic_vector;
        Done            : out    vl_logic;
        Product         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end booth;
