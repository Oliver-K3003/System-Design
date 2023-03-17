library verilog;
use verilog.vl_types.all;
entity mdrmux2to1 is
    port(
        read            : in     vl_logic;
        busMuxOut       : in     vl_logic_vector(31 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0);
        muxOut          : out    vl_logic_vector(31 downto 0)
    );
end mdrmux2to1;
