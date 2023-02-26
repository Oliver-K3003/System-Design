library verilog;
use verilog.vl_types.all;
entity cla_4 is
    port(
        ra              : in     vl_logic_vector(3 downto 0);
        rb              : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        cout            : out    vl_logic
    );
end cla_4;
