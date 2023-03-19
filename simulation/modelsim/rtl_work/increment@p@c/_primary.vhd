library verilog;
use verilog.vl_types.all;
entity incrementPC is
    port(
        clk             : in     vl_logic;
        IncPC           : in     vl_logic;
        PCen            : in     vl_logic;
        inPC            : in     vl_logic_vector(31 downto 0);
        outPC           : out    vl_logic_vector(31 downto 0)
    );
end incrementPC;
