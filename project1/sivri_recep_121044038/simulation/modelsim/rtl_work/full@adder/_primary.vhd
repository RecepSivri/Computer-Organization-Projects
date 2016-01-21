library verilog;
use verilog.vl_types.all;
entity fullAdder is
    port(
        s               : out    vl_logic;
        c               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        d               : in     vl_logic
    );
end fullAdder;
