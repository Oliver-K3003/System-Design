library verilog;
use verilog.vl_types.all;
entity MDR is
    port(
        clr             : in     vl_logic;
        clk             : in     vl_logic;
        MDRin           : in     vl_logic;
        read            : in     vl_logic;
        busMuxOut       : in     vl_logic_vector(31 downto 0);
        Mdatain         : in     vl_logic_vector(31 downto 0);
        q               : out    vl_logic_vector(31 downto 0)
    );
end MDR;
