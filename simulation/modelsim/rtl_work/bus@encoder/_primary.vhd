library verilog;
use verilog.vl_types.all;
entity busEncoder is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        en              : in     vl_logic;
        \out\           : out    vl_logic_vector(4 downto 0)
    );
end busEncoder;