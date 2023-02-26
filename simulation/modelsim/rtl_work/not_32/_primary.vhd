library verilog;
use verilog.vl_types.all;
entity not_32 is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end not_32;
