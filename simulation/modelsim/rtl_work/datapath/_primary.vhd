library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        HIin            : in     vl_logic;
        LOin            : in     vl_logic;
        PCin            : in     vl_logic;
        MDRin           : in     vl_logic;
        Zin             : in     vl_logic;
        Yin             : in     vl_logic;
        MARin           : in     vl_logic;
        IRin            : in     vl_logic;
        CONin           : in     vl_logic;
        HIout           : in     vl_logic;
        LOout           : in     vl_logic;
        ZHIout          : in     vl_logic;
        ZLOout          : in     vl_logic;
        PCout           : in     vl_logic;
        MDRout          : in     vl_logic;
        INPORTout       : in     vl_logic;
        OUTPORTout      : in     vl_logic;
        Cout            : in     vl_logic;
        Yout            : in     vl_logic;
        Gra             : in     vl_logic;
        Grb             : in     vl_logic;
        Grc             : in     vl_logic;
        Rin             : in     vl_logic;
        Rout            : in     vl_logic;
        BAout           : in     vl_logic;
        Clock           : in     vl_logic;
        Read            : in     vl_logic;
        IncPC           : in     vl_logic;
        write           : in     vl_logic;
        inportInput     : in     vl_logic_vector(31 downto 0);
        regIn           : in     vl_logic_vector(15 downto 0);
        busMuxOut       : out    vl_logic_vector(31 downto 0);
        encoderOut      : out    vl_logic_vector(4 downto 0);
        CON             : out    vl_logic;
        BusMuxInR0      : out    vl_logic_vector(31 downto 0);
        BusMuxInR1      : out    vl_logic_vector(31 downto 0);
        BusMuxInR2      : out    vl_logic_vector(31 downto 0);
        BusMuxInR3      : out    vl_logic_vector(31 downto 0);
        BusMuxInR4      : out    vl_logic_vector(31 downto 0);
        BusMuxInR5      : out    vl_logic_vector(31 downto 0);
        BusMuxInR6      : out    vl_logic_vector(31 downto 0);
        BusMuxInR7      : out    vl_logic_vector(31 downto 0);
        BusMuxInR8      : out    vl_logic_vector(31 downto 0);
        BusMuxInR9      : out    vl_logic_vector(31 downto 0);
        BusMuxInR10     : out    vl_logic_vector(31 downto 0);
        BusMuxInR11     : out    vl_logic_vector(31 downto 0);
        BusMuxInR12     : out    vl_logic_vector(31 downto 0);
        BusMuxInR13     : out    vl_logic_vector(31 downto 0);
        BusMuxInR14     : out    vl_logic_vector(31 downto 0);
        BusMuxInR15     : out    vl_logic_vector(31 downto 0);
        BusMuxInHI      : out    vl_logic_vector(31 downto 0);
        BusMuxInLO      : out    vl_logic_vector(31 downto 0);
        BusMuxInZhi     : out    vl_logic_vector(31 downto 0);
        BusMuxInZlo     : out    vl_logic_vector(31 downto 0);
        BusMuxInPC      : out    vl_logic_vector(31 downto 0);
        BusMuxInMDR     : out    vl_logic_vector(31 downto 0);
        BusMuxInInport  : out    vl_logic_vector(31 downto 0);
        BusMuxInOutport : out    vl_logic_vector(31 downto 0);
        BusMuxInY       : out    vl_logic_vector(31 downto 0);
        IRregister      : out    vl_logic_vector(31 downto 0);
        Cregister       : out    vl_logic_vector(31 downto 0);
        marToRam        : out    vl_logic_vector(8 downto 0)
    );
end datapath;
