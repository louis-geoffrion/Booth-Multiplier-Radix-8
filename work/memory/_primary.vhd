library verilog;
use verilog.vl_types.all;
entity memory is
    generic(
        DATA_WIDTH      : integer := 9;
        ADDR_WIDTH      : integer := 4
    );
    port(
        Addr            : in     vl_logic_vector;
        Data_In         : in     vl_logic_vector;
        W_En            : in     vl_logic;
        Clk             : in     vl_logic;
        M_Sel           : in     vl_logic;
        Data1_O         : out    vl_logic_vector;
        Data2_O         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 1;
end memory;
