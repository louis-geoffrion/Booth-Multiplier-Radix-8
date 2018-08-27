library verilog;
use verilog.vl_types.all;
entity mem is
    generic(
        N               : integer := 8
    );
    port(
        A               : in     vl_logic_vector;
        B               : in     vl_logic_vector;
        Clock           : in     vl_logic;
        Resetn          : in     vl_logic;
        Si              : in     vl_logic_vector(3 downto 0);
        Product         : out    vl_logic_vector;
        Lsb             : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end mem;
