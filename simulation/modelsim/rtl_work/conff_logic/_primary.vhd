library verilog;
use verilog.vl_types.all;
entity conff_logic is
    port(
        IRin            : in     vl_logic_vector(1 downto 0);
        busMuxOut       : in     vl_logic_vector(31 downto 0);
        conIn           : in     vl_logic;
        conOut          : out    vl_logic
    );
end conff_logic;
