library verilog;
use verilog.vl_types.all;
entity memblock is
    generic(
        N               : integer := 8
    );
    port(
        A_In            : in     vl_logic_vector;
        B_In            : in     vl_logic_vector;
        C_In            : in     vl_logic_vector;
        A_En            : in     vl_logic;
        B_En            : in     vl_logic;
        C_En            : in     vl_logic;
        A_Out           : out    vl_logic_vector;
        B_Out           : out    vl_logic_vector;
        C_Out           : out    vl_logic_vector;
        Clock           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end memblock;
