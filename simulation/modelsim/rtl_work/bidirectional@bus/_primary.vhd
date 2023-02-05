library verilog;
use verilog.vl_types.all;
entity bidirectionalBus is
    port(
        dataIn          : in     vl_logic_vector(31 downto 0);
        dataOut         : out    vl_logic_vector(31 downto 0)
    );
end bidirectionalBus;
