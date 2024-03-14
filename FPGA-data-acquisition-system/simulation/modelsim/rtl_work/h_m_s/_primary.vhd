library verilog;
use verilog.vl_types.all;
entity h_m_s is
    generic(
        hi              : integer := 16;
        mi              : integer := 32
    );
    port(
        clk_1hz         : in     vl_logic;
        hour_1_out      : out    vl_logic_vector(3 downto 0);
        hour_0_out      : out    vl_logic_vector(3 downto 0);
        minute_1_out    : out    vl_logic_vector(3 downto 0);
        minute_0_out    : out    vl_logic_vector(3 downto 0);
        second_1_out    : out    vl_logic_vector(3 downto 0);
        second_0_out    : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of hi : constant is 1;
    attribute mti_svvh_generic_type of mi : constant is 1;
end h_m_s;
