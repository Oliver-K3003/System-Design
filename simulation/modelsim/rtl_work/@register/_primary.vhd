library verilog;
use verilog.vl_types.all;
entity \Register\ is
    port(
        d               : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(31 downto 0);
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        le              : in     vl_logic
    );
end \Register\;
