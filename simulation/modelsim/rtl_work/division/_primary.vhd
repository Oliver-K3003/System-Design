library verilog;
use verilog.vl_types.all;
entity division is
    port(
        dividend        : in     vl_logic_vector(31 downto 0);
        divisor         : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0)
    );
end division;
