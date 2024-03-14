library verilog;
use verilog.vl_types.all;
entity display_ctrl is
    port(
        clk             : in     vl_logic;
        hcount          : in     vl_logic_vector(9 downto 0);
        vcount          : in     vl_logic_vector(9 downto 0);
        zipoint         : in     vl_logic;
        zicode          : out    vl_logic_vector(6 downto 0);
        zix             : out    vl_logic_vector(3 downto 0);
        ziy             : out    vl_logic_vector(3 downto 0);
        rgb_data        : out    vl_logic_vector(15 downto 0);
        wavepoint       : in     vl_logic;
        hour_1_in       : in     vl_logic_vector(3 downto 0);
        hour_0_in       : in     vl_logic_vector(3 downto 0);
        minute_1_in     : in     vl_logic_vector(3 downto 0);
        minute_0_in     : in     vl_logic_vector(3 downto 0);
        second_1_in     : in     vl_logic_vector(3 downto 0);
        second_0_in     : in     vl_logic_vector(3 downto 0);
        ecgstate        : in     vl_logic;
        xinlv0          : in     vl_logic_vector(3 downto 0);
        xinlv1          : in     vl_logic_vector(3 downto 0);
        xinlv2          : in     vl_logic_vector(3 downto 0);
        init_done       : in     vl_logic;
        req_r           : in     vl_logic;
        req_w           : in     vl_logic
    );
end display_ctrl;
