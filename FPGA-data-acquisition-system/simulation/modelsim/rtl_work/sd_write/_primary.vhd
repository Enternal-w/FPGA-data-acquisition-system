library verilog;
use verilog.vl_types.all;
entity sd_write is
    generic(
        idle            : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        write_cmd       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        wait_8clk       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        start_taken     : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        writea          : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        write_crc       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        write_wait      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        write_done      : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1)
    );
    port(
        SD_clk          : in     vl_logic;
        init            : in     vl_logic;
        write_req       : in     vl_logic;
        SD_dataout      : in     vl_logic;
        sec             : in     vl_logic_vector(31 downto 0);
        adc_data        : in     vl_logic_vector(7 downto 0);
        SD_cs           : out    vl_logic;
        SD_datain       : out    vl_logic;
        rx_valid        : out    vl_logic;
        write_o         : out    vl_logic;
        mystate         : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of write_cmd : constant is 1;
    attribute mti_svvh_generic_type of wait_8clk : constant is 1;
    attribute mti_svvh_generic_type of start_taken : constant is 1;
    attribute mti_svvh_generic_type of writea : constant is 1;
    attribute mti_svvh_generic_type of write_crc : constant is 1;
    attribute mti_svvh_generic_type of write_wait : constant is 1;
    attribute mti_svvh_generic_type of write_done : constant is 1;
end sd_write;
