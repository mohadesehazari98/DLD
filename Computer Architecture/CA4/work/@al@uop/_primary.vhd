library verilog;
use verilog.vl_types.all;
entity AlUop is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        AlUop           : in     vl_logic_vector(1 downto 0);
        AlUout          : out    vl_logic_vector(7 downto 0);
        zero            : out    vl_logic
    );
end AlUop;
