library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        zero            : in     vl_logic;
        PCwrite         : in     vl_logic;
        PCcond          : in     vl_logic;
        PCin            : in     vl_logic_vector(4 downto 0);
        PCout           : out    vl_logic_vector(4 downto 0)
    );
end PC;
