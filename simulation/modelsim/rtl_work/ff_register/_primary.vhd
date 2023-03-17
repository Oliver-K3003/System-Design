library verilog;
use verilog.vl_types.all;
entity ff_register is
    port(
        le              : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end ff_register;
