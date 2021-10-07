library verilog;
use verilog.vl_types.all;
entity Controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Opcode          : in     vl_logic_vector(2 downto 0);
        PCwrite         : out    vl_logic;
        PCcond          : out    vl_logic;
        MemDst          : out    vl_logic;
        MemRead         : out    vl_logic;
        Memwrite        : out    vl_logic;
        loadI           : out    vl_logic;
        J               : out    vl_logic;
        StackDst        : out    vl_logic;
        push            : out    vl_logic;
        pop             : out    vl_logic;
        tos             : out    vl_logic;
        AlUSrcB         : out    vl_logic;
        LoadAlU         : out    vl_logic;
        AlUSrcA         : out    vl_logic_vector(1 downto 0);
        AlUop           : out    vl_logic_vector(1 downto 0)
    );
end Controller;
