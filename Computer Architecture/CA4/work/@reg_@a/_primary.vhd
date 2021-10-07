library verilog;
use verilog.vl_types.all;
entity Reg_A is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inreg           : in     vl_logic_vector(7 downto 0);
        outreg          : out    vl_logic_vector(7 downto 0)
    );
end Reg_A;
