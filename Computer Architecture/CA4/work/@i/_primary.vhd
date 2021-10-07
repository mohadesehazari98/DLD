library verilog;
use verilog.vl_types.all;
entity I is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        loadI           : in     vl_logic;
        Data            : in     vl_logic_vector(7 downto 0);
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end I;
