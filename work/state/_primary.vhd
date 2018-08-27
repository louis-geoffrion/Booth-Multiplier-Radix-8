library verilog;
use verilog.vl_types.all;
entity state is
    port(
        B               : in     vl_logic_vector(3 downto 0);
        Done            : in     vl_logic;
        Clock           : in     vl_logic;
        Start           : in     vl_logic;
        Si              : out    vl_logic_vector(3 downto 0);
        Count           : out    vl_logic;
        Resetn          : in     vl_logic
    );
end state;
