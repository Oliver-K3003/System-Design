library verilog;
use verilog.vl_types.all;
entity shift_right is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        shift_amount    : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end shift_right;
