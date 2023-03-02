library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        load            : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        loadi           : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        store           : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi0);
        add             : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi1);
        sub             : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        \AND\           : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi1);
        \OR\            : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi0);
        shr             : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi1);
        shra            : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        shl             : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi1);
        \ror\           : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi0);
        \rol\           : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi1);
        addi            : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi0);
        andi            : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi1);
        ori             : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi0);
        mul             : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi1);
        div             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi0);
        neg             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi1);
        \NOT\           : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi1, Hi0)
    );
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        IncPC           : in     vl_logic;
        y               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        opcode          : in     vl_logic_vector(4 downto 0);
        z               : out    vl_logic_vector(63 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of load : constant is 1;
    attribute mti_svvh_generic_type of loadi : constant is 1;
    attribute mti_svvh_generic_type of store : constant is 1;
    attribute mti_svvh_generic_type of add : constant is 1;
    attribute mti_svvh_generic_type of sub : constant is 1;
    attribute mti_svvh_generic_type of \AND\ : constant is 1;
    attribute mti_svvh_generic_type of \OR\ : constant is 1;
    attribute mti_svvh_generic_type of shr : constant is 1;
    attribute mti_svvh_generic_type of shra : constant is 1;
    attribute mti_svvh_generic_type of shl : constant is 1;
    attribute mti_svvh_generic_type of \ror\ : constant is 1;
    attribute mti_svvh_generic_type of \rol\ : constant is 1;
    attribute mti_svvh_generic_type of addi : constant is 1;
    attribute mti_svvh_generic_type of andi : constant is 1;
    attribute mti_svvh_generic_type of ori : constant is 1;
    attribute mti_svvh_generic_type of mul : constant is 1;
    attribute mti_svvh_generic_type of div : constant is 1;
    attribute mti_svvh_generic_type of neg : constant is 1;
    attribute mti_svvh_generic_type of \NOT\ : constant is 1;
end ALU;
