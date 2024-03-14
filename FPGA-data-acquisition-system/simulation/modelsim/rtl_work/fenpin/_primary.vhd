library verilog;
use verilog.vl_types.all;
entity fenpin is
    port(
        clk             : in     vl_logic;
        clk2            : out    vl_logic;
        threshold       : in     vl_logic_vector(25 downto 0)
    );
end fenpin;
