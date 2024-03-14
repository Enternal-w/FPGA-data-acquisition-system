library verilog;
use verilog.vl_types.all;
entity TFT_test_pl is
    port(
        inclk0          : in     vl_logic;
        c0              : out    vl_logic;
        c1              : out    vl_logic;
        c2              : out    vl_logic
    );
end TFT_test_pl;
