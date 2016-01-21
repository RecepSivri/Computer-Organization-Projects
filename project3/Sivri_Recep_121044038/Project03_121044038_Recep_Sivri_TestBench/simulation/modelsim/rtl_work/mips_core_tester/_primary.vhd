library verilog;
use verilog.vl_types.all;
entity mips_core_tester is
    generic(
        bit_size        : integer := 32;
        elem_size       : integer := 32
    );
    port(
        a               : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bit_size : constant is 1;
    attribute mti_svvh_generic_type of elem_size : constant is 1;
end mips_core_tester;
