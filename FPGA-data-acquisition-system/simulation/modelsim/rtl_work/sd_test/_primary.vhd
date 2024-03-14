library verilog;
use verilog.vl_types.all;
entity sd_test is
    generic(
        STATUS_INITIAL  : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        STATUS_WRITE    : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        STATUS_READ     : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        STATUS_IDLE     : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1)
    );
    port(
        adc_data        : in     vl_logic_vector(7 downto 0);
        req_r           : in     vl_logic;
        req_w           : in     vl_logic;
        sddata_o        : out    vl_logic_vector(7 downto 0);
        init_done       : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        SD_dataout      : in     vl_logic;
        SD_clk          : out    vl_logic;
        SD_cs           : out    vl_logic;
        SD_datain       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of STATUS_INITIAL : constant is 1;
    attribute mti_svvh_generic_type of STATUS_WRITE : constant is 1;
    attribute mti_svvh_generic_type of STATUS_READ : constant is 1;
    attribute mti_svvh_generic_type of STATUS_IDLE : constant is 1;
end sd_test;
