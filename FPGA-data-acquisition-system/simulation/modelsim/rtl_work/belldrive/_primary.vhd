library verilog;
use verilog.vl_types.all;
entity belldrive is
    port(
        clk             : in     vl_logic;
        req_r           : in     vl_logic;
        trigger         : in     vl_logic;
        bell            : out    vl_logic
    );
end belldrive;
