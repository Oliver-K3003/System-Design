library verilog;
use verilog.vl_types.all;
entity decoder2to4 is
    port(
        decoderIn       : in     vl_logic_vector(1 downto 0);
        decoderOut      : out    vl_logic_vector(3 downto 0)
    );
end decoder2to4;
