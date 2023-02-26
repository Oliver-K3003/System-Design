library verilog;
use verilog.vl_types.all;
entity log_and_32bit is
    port(
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end log_and_32bit;
