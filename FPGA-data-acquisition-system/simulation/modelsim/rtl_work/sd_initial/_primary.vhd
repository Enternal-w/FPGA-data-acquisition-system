library verilog;
use verilog.vl_types.all;
entity sd_initial is
    generic(
        idle            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        send_cmd0       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        wait_01         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        waitb           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        send_cmd8       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        waita           : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        send_cmd55      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        send_acmd41     : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        init_done       : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        init_fail       : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1)
    );
    port(
        rst_n           : in     vl_logic;
        SD_clk          : in     vl_logic;
        SD_dataout      : in     vl_logic;
        SD_cs           : out    vl_logic;
        SD_datain       : out    vl_logic;
        init_o          : out    vl_logic;
        rx              : out    vl_logic_vector(47 downto 0);
        state           : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of send_cmd0 : constant is 1;
    attribute mti_svvh_generic_type of wait_01 : constant is 1;
    attribute mti_svvh_generic_type of waitb : constant is 1;
    attribute mti_svvh_generic_type of send_cmd8 : constant is 1;
    attribute mti_svvh_generic_type of waita : constant is 1;
    attribute mti_svvh_generic_type of send_cmd55 : constant is 1;
    attribute mti_svvh_generic_type of send_acmd41 : constant is 1;
    attribute mti_svvh_generic_type of init_done : constant is 1;
    attribute mti_svvh_generic_type of init_fail : constant is 1;
end sd_initial;
