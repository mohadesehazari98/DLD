library verilog;
use verilog.vl_types.all;
entity MUX_3 is
    port(
        \select\        : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        C               : in     vl_logic_vector(7 downto 0);
        D               : out    vl_logic_vector(7 downto 0)
    );
end MUX_3;
