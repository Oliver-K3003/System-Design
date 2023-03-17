library verilog;
use verilog.vl_types.all;
entity selectAndEncode is
    port(
        Gra             : in     vl_logic;
        Grb             : in     vl_logic;
        Grc             : in     vl_logic;
        Rin             : in     vl_logic;
        Rout            : in     vl_logic;
        BAout           : in     vl_logic;
        IRin            : in     vl_logic_vector(31 downto 0);
        registersIn     : out    vl_logic_vector(15 downto 0);
        registersOut    : out    vl_logic_vector(15 downto 0);
        CsignExt        : out    vl_logic_vector(31 downto 0)
    );
end selectAndEncode;
