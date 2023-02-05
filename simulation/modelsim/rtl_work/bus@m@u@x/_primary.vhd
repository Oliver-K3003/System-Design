library verilog;
use verilog.vl_types.all;
entity busMUX is
    port(
        r0              : in     vl_logic_vector(31 downto 0);
        r1              : in     vl_logic_vector(31 downto 0);
        r2              : in     vl_logic_vector(31 downto 0);
        r3              : in     vl_logic_vector(31 downto 0);
        r4              : in     vl_logic_vector(31 downto 0);
        r5              : in     vl_logic_vector(31 downto 0);
        r6              : in     vl_logic_vector(31 downto 0);
        r7              : in     vl_logic_vector(31 downto 0);
        r8              : in     vl_logic_vector(31 downto 0);
        r9              : in     vl_logic_vector(31 downto 0);
        r10             : in     vl_logic_vector(31 downto 0);
        r11             : in     vl_logic_vector(31 downto 0);
        r12             : in     vl_logic_vector(31 downto 0);
        r13             : in     vl_logic_vector(31 downto 0);
        r14             : in     vl_logic_vector(31 downto 0);
        r15             : in     vl_logic_vector(31 downto 0);
        hi              : in     vl_logic_vector(31 downto 0);
        lo              : in     vl_logic_vector(31 downto 0);
        zhi             : in     vl_logic_vector(31 downto 0);
        zlo             : in     vl_logic_vector(31 downto 0);
        pc              : in     vl_logic_vector(31 downto 0);
        mdr             : in     vl_logic_vector(31 downto 0);
        inport          : in     vl_logic_vector(31 downto 0);
        signExt         : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(4 downto 0);
        muxOut          : out    vl_logic_vector(31 downto 0)
    );
end busMUX;
