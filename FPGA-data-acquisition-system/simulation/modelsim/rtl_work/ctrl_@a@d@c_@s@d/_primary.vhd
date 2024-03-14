library verilog;
use verilog.vl_types.all;
entity ctrl_ADC_SD is
    port(
        clk             : in     vl_logic;
        rest_n          : in     vl_logic;
        key_w           : in     vl_logic;
        key_r           : in     vl_logic;
        adc_data        : in     vl_logic_vector(7 downto 0);
        sd_data         : in     vl_logic_vector(7 downto 0);
        wave_data       : out    vl_logic_vector(7 downto 0);
        req_w           : out    vl_logic;
        req_r           : out    vl_logic
    );
end ctrl_ADC_SD;
