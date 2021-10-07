library verilog;
use verilog.vl_types.all;
entity MUX_2 is
    port(
        \select\        : in     vl_logic;
        A               : in     vl_logic_vector(4 downto 0);
        B               : in     vl_logic_vector(4 downto 0);
        C               : out    vl_logic_vector(4 downto 0)
    );
end MUX_2;
