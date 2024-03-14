library verilog;
use verilog.vl_types.all;
entity sd_read is
    generic(
        idle            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        read            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        read_wait       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        read_data       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        read_done       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0)
    );
    port(
        SD_clk          : in     vl_logic;
        SD_dataout      : in     vl_logic;
        read_req        : in     vl_logic;
        init            : in     vl_logic;
        sec             : in     vl_logic_vector(31 downto 0);
        SD_cs           : out    vl_logic;
        SD_datain       : out    vl_logic;
        myvalid_o       : out    vl_logic;
        data_come       : out    vl_logic;
        read_o          : out    vl_logic;
        mystate         : out    vl_logic_vector(3 downto 0);
        mydata_o        : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of read : constant is 1;
    attribute mti_svvh_generic_type of read_wait : constant is 1;
    attribute mti_svvh_generic_type of read_data : constant is 1;
    attribute mti_svvh_generic_type of read_done : constant is 1;
end sd_read;
