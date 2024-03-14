library verilog;
use verilog.vl_types.all;
entity ziti is
    port(
        clk             : in     vl_logic;
        zicode          : in     vl_logic_vector(6 downto 0);
        zix             : in     vl_logic_vector(3 downto 0);
        ziy             : in     vl_logic_vector(3 downto 0);
        zipoint         : out    vl_logic
    );
end ziti;
