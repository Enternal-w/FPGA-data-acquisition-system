library verilog;
use verilog.vl_types.all;
entity wave is
    port(
        Clk             : in     vl_logic;
        Rst_n           : in     vl_logic;
        hcount          : in     vl_logic_vector(9 downto 0);
        vcount          : in     vl_logic_vector(9 downto 0);
        wave_data       : in     vl_logic_vector(7 downto 0);
        wavepoint       : out    vl_logic
    );
end wave;
