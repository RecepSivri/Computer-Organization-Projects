library verilog;
use verilog.vl_types.all;
entity FetchInstructionModule is
    port(
        counter         : in     vl_logic_vector(31 downto 0);
        instruction     : in     vl_logic_vector(31 downto 0);
        rs              : out    vl_logic_vector(4 downto 0);
        rt              : out    vl_logic_vector(4 downto 0);
        opcode          : out    vl_logic_vector(5 downto 0)
    );
end FetchInstructionModule;
