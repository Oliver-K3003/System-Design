library verilog;
use verilog.vl_types.all;
entity loadInstruction2tb is
    generic(
        Default         : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        Reg_load1a      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        Reg_load1b      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi0);
        Reg_load2a      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi1, Hi1);
        Reg_load2b      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi0);
        Reg_load3a      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi0, Hi1);
        Reg_load3b      : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi0);
        T0              : vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi1, Hi1, Hi1);
        T1              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi0);
        T2              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi0, Hi1);
        T3              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi0);
        T4              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi0, Hi1, Hi1);
        T5              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi0);
        T6              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi0, Hi1);
        T7              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi0);
        T8              : vl_logic_vector(0 to 4) := (Hi0, Hi1, Hi1, Hi1, Hi1);
        T9              : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi0);
        T10             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi0, Hi1);
        T11             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi1, Hi0);
        T12             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi0, Hi1, Hi1);
        T13             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi1, Hi0, Hi0);
        T14             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi1, Hi0, Hi1);
        T15             : vl_logic_vector(0 to 4) := (Hi1, Hi0, Hi1, Hi1, Hi0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Default : constant is 1;
    attribute mti_svvh_generic_type of Reg_load1a : constant is 1;
    attribute mti_svvh_generic_type of Reg_load1b : constant is 1;
    attribute mti_svvh_generic_type of Reg_load2a : constant is 1;
    attribute mti_svvh_generic_type of Reg_load2b : constant is 1;
    attribute mti_svvh_generic_type of Reg_load3a : constant is 1;
    attribute mti_svvh_generic_type of Reg_load3b : constant is 1;
    attribute mti_svvh_generic_type of T0 : constant is 1;
    attribute mti_svvh_generic_type of T1 : constant is 1;
    attribute mti_svvh_generic_type of T2 : constant is 1;
    attribute mti_svvh_generic_type of T3 : constant is 1;
    attribute mti_svvh_generic_type of T4 : constant is 1;
    attribute mti_svvh_generic_type of T5 : constant is 1;
    attribute mti_svvh_generic_type of T6 : constant is 1;
    attribute mti_svvh_generic_type of T7 : constant is 1;
    attribute mti_svvh_generic_type of T8 : constant is 1;
    attribute mti_svvh_generic_type of T9 : constant is 1;
    attribute mti_svvh_generic_type of T10 : constant is 1;
    attribute mti_svvh_generic_type of T11 : constant is 1;
    attribute mti_svvh_generic_type of T12 : constant is 1;
    attribute mti_svvh_generic_type of T13 : constant is 1;
    attribute mti_svvh_generic_type of T14 : constant is 1;
    attribute mti_svvh_generic_type of T15 : constant is 1;
end loadInstruction2tb;
