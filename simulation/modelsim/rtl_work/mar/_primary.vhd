library verilog;
use verilog.vl_types.all;
entity mar is
    port(
        d               : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(8 downto 0);
        le              : in     vl_logic;
        clk             : in     vl_logic;
        clr             : in     vl_logic
    );
end mar;
