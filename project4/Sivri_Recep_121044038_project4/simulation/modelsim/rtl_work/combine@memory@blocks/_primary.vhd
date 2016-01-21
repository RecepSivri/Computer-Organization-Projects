library verilog;
use verilog.vl_types.all;
entity combineMemoryBlocks is
    port(
        instruction     : out    vl_logic_vector(31 downto 0);
        block1          : in     vl_logic_vector(7 downto 0);
        block2          : in     vl_logic_vector(7 downto 0);
        block3          : in     vl_logic_vector(7 downto 0);
        block4          : in     vl_logic_vector(7 downto 0)
    );
end combineMemoryBlocks;
