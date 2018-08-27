library verilog;
use verilog.vl_types.all;
entity tb_booth is
    generic(
        n               : integer := 8;
        num_vectors     : integer := 8
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of num_vectors : constant is 1;
end tb_booth;
