----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Histogram Projection
-- Details: 
--          This module takes the AXI-Stream video input and calculates the 
--          histograms for the columns and rows. This is then used to 
--          determine the position of the ball by finding the center of the 
--          longest lines in them.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

Library xpm;
use xpm.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

library util;
use util.util_pkg.all;

library memory;

entity histogram_projection is
    generic (
        IMAGE_WIDTH     : integer := 1920;
        IMAGE_HEIGHT    : integer := 1080;
        CNT_WIDTH       : integer := 12;
        RECV_FIRST      : boolean := True;
        -- Do not modify the parameters beyond this line
        -- Width of S_AXI data bus
        C_S_AXI_DATA_WIDTH    : integer    := 32;
        -- Width of S_AXI address bus
        C_S_AXI_ADDR_WIDTH    : integer    := 12
    );
    port (
        clk     : in std_logic;
        rst_n   : in std_logic;

        -- AXIS Slave Interface
        s_tvalid       : in std_logic;                       -- Transfer valid (required)
        s_tready       : out std_logic;                      -- Transfer ready (optional)
        s_tdata        : in std_logic_vector(23 downto 0);   -- Transfer Data (optional)
        s_tlast        : in std_logic;                       -- Packet Boundary Indicator (optional)
        s_tuser        : in std_logic_vector(0 downto 0);     -- Transfer user sideband (optional)
        
        -- AXIS Master Interface
        m_tvalid      : out std_logic;                       -- Transfer valid (required)
        m_tready      : in std_logic;                        -- Transfer ready (optional)
        m_tdata       : out std_logic_vector(23 downto 0);   -- Transfer Data (optional)
        m_tlast       : out std_logic;                       -- Packet Boundary Indicator (optional)
        m_tuser       : out std_logic_vector(0 downto 0);     -- Transfer user sideband (optional)
        
        S_AXI_ACLK      : in std_logic;
        S_AXI_ARESETN   : in std_logic;
        S_AXI_AWADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_AWPROT    : in std_logic_vector(2 downto 0);
        S_AXI_AWVALID   : in std_logic;
        S_AXI_AWREADY   : out std_logic;
        S_AXI_WDATA     : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_WSTRB     : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        S_AXI_WVALID    : in std_logic;
        S_AXI_WREADY    : out std_logic;
        S_AXI_BRESP     : out std_logic_vector(1 downto 0);
        S_AXI_BVALID    : out std_logic;
        S_AXI_BREADY    : in std_logic;
        S_AXI_ARADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_ARPROT    : in std_logic_vector(2 downto 0);
        S_AXI_ARVALID   : in std_logic;
        S_AXI_ARREADY   : out std_logic;
        S_AXI_RDATA     : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_RRESP     : out std_logic_vector(1 downto 0);
        S_AXI_RVALID    : out std_logic;
        S_AXI_RREADY    : in std_logic
    );

    attribute mark_debug : string;
    
    
end entity histogram_projection;


architecture rtl of histogram_projection is

    ATTRIBUTE X_INTERFACE_INFO : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_INFO of s_tready: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
    ATTRIBUTE X_INTERFACE_INFO of s_tdata:  SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
    ATTRIBUTE X_INTERFACE_INFO of s_tlast:  SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
    ATTRIBUTE X_INTERFACE_INFO of s_tuser:  SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TUSER";
    ATTRIBUTE X_INTERFACE_INFO of s_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";

    ATTRIBUTE X_INTERFACE_INFO of m_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
    ATTRIBUTE X_INTERFACE_INFO of m_tdata: SIGNAL is "xilinx.com:interface:axis:1.0  M_AXIS TDATA";
    ATTRIBUTE X_INTERFACE_INFO of m_tlast: SIGNAL is "xilinx.com:interface:axis:1.0  M_AXIS TLAST";
    ATTRIBUTE X_INTERFACE_INFO of m_tuser: SIGNAL is "xilinx.com:interface:axis:1.0  M_AXIS TUSER";
    ATTRIBUTE X_INTERFACE_INFO of m_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
    
    ATTRIBUTE X_INTERFACE_PARAMETER of s_tvalid: SIGNAL is "FREQ_HZ 142857132, CLK_DOMAIN base_ps7_0_0_FCLK_CLK1";
    ATTRIBUTE X_INTERFACE_PARAMETER of m_tvalid: SIGNAL is "FREQ_HZ 142857132, CLK_DOMAIN base_ps7_0_0_FCLK_CLK1";
    ---------------------------------------------------------------------
    --
    -- TYPES
    --
    ----------------------------------------------------------------------
    type state_t is (RECEIVING, PROCESSING);
    signal state_reg    : state_t := RECEIVING;  

    CONSTANT IMAGE_SIZE : integer := max(IMAGE_HEIGHT, IMAGE_WIDTH);
    subtype addr_type_row    is integer range 0 to IMAGE_SIZE - 1;
    subtype addr_type_column is integer range 0 to IMAGE_SIZE - 1;

        

    ---------------------------------------------------------------------
    --
    -- CONSTANTS
    --
    ----------------------------------------------------------------------
    constant LEN_ROW : integer := integer(ceil(log2(real(addr_type_row'high))));
    constant LEN_COLUMN : integer := integer(ceil(log2(real(addr_type_column'high))));
    
    
    
    ---------------------------------------------------------------------
    --
    -- SIGNALS
    --
    ----------------------------------------------------------------------
    signal ram_column_wr_addr_reg, ram_column_wr_addr_d     : addr_type_column;

    signal ram_row_write, ram_row_read_reg          : unsigned(CNT_WIDTH - 1 downto 0);
    signal ram_column_write, ram_column_read_reg    : unsigned(CNT_WIDTH - 1 downto 0);
    signal write_row, write_column                  : std_logic;
    signal en_row_write                             : std_logic;
    signal en_column_write                          : std_logic;

    signal en_addr_cnt_row, en_addr_cnt_column   : std_logic := '0';


    signal addr_row_reg, addr_row_nxt            : addr_type_row := addr_type_row'low;
    signal addr_column_reg, addr_column_nxt      : addr_type_column := addr_type_column'low;

    signal row_cnt_reg, row_cnt_nxt              : unsigned(CNT_WIDTH - 1 downto 0) := (others => '0');

    signal row_cnt_current_reg, row_cnt_column_reg                 : unsigned(CNT_WIDTH - 1 downto 0) := (others => '0');
    signal out_row_cnt_row_reg, out_row_cnt_column_reg         : unsigned(CNT_WIDTH - 1 downto 0) := (others => '0');

    signal last_value_row_reg                    : unsigned(CNT_WIDTH - 1 downto 0) := (others => '0');
    signal last_value_column_reg                 : unsigned(CNT_WIDTH - 1 downto 0) := (others => '0');

    signal start_point_row_reg                   : unsigned(integer(ceil(log2(real(addr_type_row'high)))) - 1 downto 0) := (others => '0');
    signal start_point_column_reg                : unsigned(integer(ceil(log2(real(addr_type_column'high)))) - 1 downto 0) := (others => '0');

    signal temp_out_row_reg                      : unsigned(integer(ceil(log2(real(addr_type_row'high)))) - 1 downto 0)  := (others => '0');
    signal temp_out_column_reg                   : unsigned(integer(ceil(log2(real(addr_type_column'high)))) - 1 downto 0) := (others => '0');


    signal out_row_reg                           : unsigned(integer(ceil(log2(real(addr_type_row'high)))) - 1 downto 0)  := (others => '0');
    signal out_column_reg                        : unsigned(integer(ceil(log2(real(addr_type_column'high)))) - 1 downto 0) := (others => '0');

    signal axi_out_row_reg                       : unsigned(integer(ceil(log2(real(addr_type_row'high)))) - 1 downto 0)  := (others => '0');
    signal axi_out_column_reg                    : unsigned(integer(ceil(log2(real(addr_type_column'high)))) - 1 downto 0)  := (others => '0');

    
    -------------------------------------------------------
    -- CDC SIGNALS
    -------------------------------------------------------
    signal cdc_data_out_c1      : std_logic_vector(LEN_ROW + LEN_COLUMN - 1 downto 0);
    signal cdc_data_avail_c1    : std_logic := '0';
    signal cdc_data_avail_c0    : std_logic := '0';
    signal cdc_ack_c0           : std_logic;
    signal cdc_data_in_c0       : std_logic_vector(LEN_ROW + LEN_COLUMN - 1 downto 0);
    signal d_avail_pipe_c1_reg  : std_logic;
    signal d_ack_pipe_c0_reg    : std_logic;

    signal data_clock_transfer : std_logic;

    attribute XPM_CDC_SINGLE : boolean;
    attribute XPM_CDC_SINGLE of d_avail_pipe_c1_reg : signal is True;
    attribute XPM_CDC_SINGLE of d_ack_pipe_c0_reg : signal is True;

        
    -------------------------------------------------------
    -- PIPELINE CONTROL SIGNALS
    -------------------------------------------------------

    signal next_image       : std_logic;
    signal next_pixel       : std_logic;
    signal next_row         : std_logic;
    signal increase_row     : std_logic;
    signal increase_column  : std_logic;

    signal switch_to_processing, last_switch_to_processing  : std_logic;
    signal switch_to_receveing, last_switch_to_receveing    : std_logic;

    signal processing_finished_nxt, processing_finished_reg : std_logic;

    

    ----------------------------------------------------------------------
    --
    -- AXI4LITE signals START
    --
    ----------------------------------------------------------------------
    signal axi_awaddr    : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal axi_awready    : std_logic;
    signal axi_wready    : std_logic;
    signal axi_bresp    : std_logic_vector(1 downto 0);
    signal axi_bvalid    : std_logic;
    signal axi_araddr    : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal axi_arready    : std_logic;
    signal axi_rdata    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal axi_rresp    : std_logic_vector(1 downto 0);
    signal axi_rvalid    : std_logic;

    constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
    constant OPT_MEM_ADDR_BITS : integer := 1;
    
    ------------------------------------------------
    ---- Signals for user logic register space example
    --------------------------------------------------
    ---- Number of Slave Registers 4
    signal slv_reg0         : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg1         : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg2         : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg3         : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal slv_reg_rden     : std_logic;
    signal slv_reg_wren     : std_logic;
    signal reg_data_out     : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal byte_index       : integer;
    signal aw_en            : std_logic;
    
    
    ----------------------------------------------------------------------
    --
    -- AXI4LITE signals END
    -- 
    ----------------------------------------------------------------------

begin

    ----------------------------------------------------------------------
    --
    -- AXIS Signals
    --
    ----------------------------------------------------------------------
    
    -- Pass through of the signals as we don't need to modifie them
    s_tready <= m_tready; 

    P_SEQ_AXIS : process (clk) begin 
        if rising_edge(clk) then 
            m_tvalid <= s_tvalid;
            m_tdata  <= s_tdata;
            m_tlast  <= s_tlast;
            m_tuser  <= s_tuser;
        end if;
    end process;



    ----------------------------------------------------------------------
    --
    -- PIPELINE CONTROL
    --
    ----------------------------------------------------------------------
    next_image       <= s_tuser(0)  when s_tvalid = '1' and m_tready = '1' else '0'; 
    next_pixel       <= '1'         when s_tvalid = '1' and m_tready = '1' else '0';
    next_row         <= s_tlast     when s_tvalid = '1' and m_tready = '1' else '0';

    increase_row     <= '1'   when next_pixel = '1' and unsigned(s_tdata) /= 0 else '0';
    increase_column  <= '1'   when next_pixel = '1' and unsigned(s_tdata) /= 0 else '0';  
    
    switch_to_processing <= (s_tuser(0)) when next_pixel = '1' else '0';

    processing_finished_nxt <= '1' when state_reg = PROCESSING and addr_row_reg >= IMAGE_WIDTH - 1 and addr_column_reg >= IMAGE_HEIGHT - 1 else '0';

    P_SEQ_SWITCH_MODE : process(clk, rst_n, switch_to_processing, last_switch_to_processing) 
    begin 
        if rising_edge(clk) then 
            if rst_n = '0' then 
                if RECV_FIRST then 
                    state_reg <= RECEIVING;
                else 
                    state_reg <= PROCESSING;
                end if;
            else 
                last_switch_to_processing <= switch_to_processing;
                if switch_to_processing = '1' and last_switch_to_processing = '0' then 
                    state_reg <= PROCESSING;
                end if;

                last_switch_to_receveing <= switch_to_receveing;
                if switch_to_receveing = '1' and last_switch_to_receveing = '0' then 
                    state_reg <= RECEIVING;
                end if;
            end if;
        end if;
    end process;

    P_SEQ_REG : process (clk, rst_n) 
    begin 
        if rising_edge(clk) then 
            if rst_n = '0' then 
                addr_row_reg            <= addr_type_row'low;
                addr_column_reg         <= addr_type_column'low;
                row_cnt_reg             <= (others => '0');
                ram_column_wr_addr_d    <= addr_type_column'high;
                ram_column_wr_addr_reg  <= addr_type_column'high;
            else
                addr_row_reg            <= addr_row_nxt;
                addr_column_reg         <= addr_column_nxt;

                -- Addr needs to be delayed as the read takes one cycle 
                -- and the processing and store take another cycle
                ram_column_wr_addr_d    <= addr_column_reg;
                ram_column_wr_addr_reg  <= ram_column_wr_addr_d;

                row_cnt_reg             <= row_cnt_nxt;
                processing_finished_reg <= processing_finished_nxt;
                data_clock_transfer     <= processing_finished_reg;
                

            end if;
        end if;
    end process;

    


    ----------------------------------------------------------------------
    --
    -- CDC
    --
    ----------------------------------------------------------------------

    xpm_cdc_handshake_inst : xpm_cdc_handshake
    generic map (
        DEST_EXT_HSK => 0,   -- DECIMAL; 0=internal handshake, 1=external handshake
        DEST_SYNC_FF => 4,   -- DECIMAL; range: 2-10
        INIT_SYNC_FF => 1,   -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
        SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
        SRC_SYNC_FF => 4,    -- DECIMAL; range: 2-10
        WIDTH => LEN_ROW + LEN_COLUMN          -- DECIMAL; range: 1-1024
    )
    port map (
        dest_out => cdc_data_out_c1, 
        dest_req => cdc_data_avail_c1, 
        src_rcv => cdc_ack_c0,   
        dest_ack => '0',
        dest_clk => S_AXI_ACLK, 
        src_clk => clk,         
        src_in => cdc_data_in_c0, 
        src_send => cdc_data_avail_c0

    );

    P_CDC_SEQ_REG_AXIs : process (clk) begin 
        if rising_edge(clk) then 
            
            switch_to_receveing <= '0';

            if data_clock_transfer = '1' and cdc_data_avail_c0 = '0' and cdc_ack_c0 = '0' then 
                cdc_data_avail_c0 <= '1';
                cdc_data_in_c0 <= std_logic_vector(temp_out_row_reg) & std_logic_vector(temp_out_column_reg);
            end if;
            
            if cdc_ack_c0 = '1' then 
                cdc_data_avail_c0 <= '0';
                switch_to_receveing <= '1';
            end if;
        end if;
    end process;

    P_CDC_SEQ_REG_AXI : process (S_AXI_ACLK) begin 
        if rising_edge(S_AXI_ACLK) then 
            if cdc_data_avail_c1 = '1' then
              axi_out_row_reg <= unsigned(cdc_data_out_c1(cdc_data_out_c1'length -1 downto LEN_COLUMN));
              axi_out_column_reg <= unsigned(cdc_data_out_c1(LEN_COLUMN -1 downto 0));
            end if;
        end if;
    end process;



    
    ----------------------------------------------------------------------
    --
    -- RAM CONTROL
    --
    ----------------------------------------------------------------------

    en_row_write <= '1' when (state_reg = RECEIVING and write_row = '1') or state_reg = PROCESSING else '0';
    RAM_ROW_INST : entity memory.ram_row
        generic map (
            IMAGE_WIDTH   => IMAGE_SIZE,
            CNT_WIDTH     => CNT_WIDTH
        )
        port map (
            clk    => clk,
            en     => '1',
            wen    => en_row_write,
            raddr  => addr_row_reg,
            waddr  => addr_row_reg,
            w_data => ram_row_write,
            r_data => ram_row_read_reg 
            
        );

    en_column_write <= '1' when (state_reg = RECEIVING and write_column = '1') or state_reg = PROCESSING else '0';
    RAM_COLUMN_INST: entity memory.ram_column
        generic map(
            IMAGE_HEIGHT => IMAGE_SIZE,
            CNT_WIDTH => CNT_WIDTH
    )
     port map(
        clk => clk,
        en_wr => '1',
        rden => '1',
        wen => en_column_write,
        raddr => addr_column_reg,
        waddr => ram_column_wr_addr_reg,
        w_data => ram_column_write,
        r_data => ram_column_read_reg
    );

   

    -------------------------------------------------------
    -- ROW
    -------------------------------------------------------
    P_SEQ_ROW_CNT_RAM_INPUT : process (clk)
        variable row_cnt_temp :  unsigned(CNT_WIDTH - 1 downto 0);
    begin 
        if rising_edge(clk) then 
            write_row <= '0';
            if state_reg = RECEIVING then 
                if next_row = '1' then 
                    write_row <= '1';
                    if increase_row = '1' then 
                        ram_row_write <= row_cnt_reg + 1;
                    else
                        ram_row_write <= row_cnt_reg;
                    end if;
                end if;
                start_point_row_reg <= (others => '0');
                last_value_row_reg <= (others => '0'); 
                out_row_cnt_row_reg <= (others => '0');
                temp_out_row_reg <= (others => '0');
                row_cnt_current_reg <= (others => '0');
            elsif state_reg = PROCESSING then
                ram_row_write <= (others => '0'); 
                row_cnt_current_reg <= row_cnt_current_reg;
                -- Here we increase the row cnt but this value is only taken later if 
                -- the pixel was actually set. This is done so the addition can be
                -- done in parrallel to the memory access.
                row_cnt_temp := row_cnt_current_reg + 1;
                if ram_row_read_reg /= 0 and addr_row_reg <= IMAGE_HEIGHT - 1 then 
                    if last_value_row_reg = 0 then 
                        start_point_row_reg <= to_unsigned(addr_row_reg, start_point_row_reg'length);
                    end if;
                    row_cnt_current_reg <= row_cnt_temp;
                end if;

                if addr_row_reg = IMAGE_HEIGHT - 1 or ((ram_row_read_reg = 0 and last_value_row_reg /= 0) and addr_row_reg <= IMAGE_HEIGHT - 1) then 
                    if out_row_cnt_row_reg < row_cnt_current_reg then 
                        out_row_cnt_row_reg        <= row_cnt_current_reg;
                        temp_out_row_reg           <= resize(shift_right(resize(start_point_row_reg, start_point_row_reg'length + 1) + to_unsigned(addr_row_reg - 1, start_point_row_reg'length + 1), 1), out_row_reg'length);
                    end if;
                    row_cnt_current_reg <= (others => '0');
                end if;
                
                last_value_row_reg <= ram_row_read_reg;
            end if;
        end if;
        
    end process;

    P_COMB_ROW_EN_CNT : process(state_reg, en_addr_cnt_row) begin 
        en_addr_cnt_row <= '0';
        if state_reg = PROCESSING then 
            en_addr_cnt_row <= '1';
        end if;
    end process;



    -------------------------------------------------------
    -- COLUMN
    -------------------------------------------------------
    P_SEQ_COLUMN_CNT_RAM_INPUT : process (clk)
        variable row_cnt_temp :  unsigned(CNT_WIDTH - 1 downto 0);
    begin 
        if rising_edge(clk) then 
            write_column <= '0';
            if state_reg = RECEIVING then 
                if next_pixel = '1' then 
                    -------------------------------------------------------
                    -- column counter logic
                    -------------------------------------------------------
                    write_column <= '1';
                    if increase_column = '1' then  
                        ram_column_write <= ram_column_read_reg + 1;
                    else 
                        ram_column_write <= ram_column_read_reg;
                    end if;
                    
                end if;
                start_point_column_reg <= (others => '0');
                out_row_cnt_column_reg <= (others => '0');
                temp_out_column_reg <= (others => '0');
                row_cnt_column_reg <= (others => '0');
            elsif state_reg = PROCESSING then
                ram_column_write <= (others => '0'); 
                row_cnt_temp := row_cnt_column_reg + 1;

                if ram_column_read_reg /= 0 and addr_column_reg /= IMAGE_WIDTH - 1 then 
                    if last_value_column_reg = 0 then 
                        start_point_column_reg <= to_unsigned(addr_column_reg, start_point_column_reg'length);
                    end if;
                    row_cnt_column_reg <= row_cnt_temp;
                end if;

                if addr_column_reg = IMAGE_WIDTH - 1 or (ram_column_read_reg = 0 and last_value_column_reg /= 0) then 
                    if out_row_cnt_column_reg < row_cnt_column_reg then 
                        out_row_cnt_column_reg   <= row_cnt_column_reg;
                        temp_out_column_reg           <= resize(shift_right(resize(start_point_column_reg, start_point_column_reg'length + 1) + to_unsigned(addr_column_reg - 1, start_point_column_reg'length + 1), 1), out_column_reg'length);
                    end if;
                    row_cnt_column_reg <= (others => '0');
                end if;
                last_value_column_reg <= ram_column_read_reg; 
            end if;
        end if;
        
    end process;

    P_COMB_COLUMN_RAM : process(state_reg, en_addr_cnt_column) begin 
        en_addr_cnt_column <= '0';
        if state_reg = PROCESSING then 
            en_addr_cnt_column <= '1';
        end if;
    end process;




    ----------------------------------------------------------------------
    --
    -- RAM ADDRESS HANDLER and COUNTING LOGIC
    --
    ----------------------------------------------------------------------



    -------------------------------------------------------
    -- VALUE COUNTERS 
    -------------------------------------------------------
    P_COMB_ROW_CNT : process (row_cnt_reg, increase_row, next_image, next_row)
    begin 
        row_cnt_nxt <= row_cnt_reg;

        if increase_row = '1' then 
            row_cnt_nxt <= row_cnt_reg + 1;
        end if;
        if next_row = '1' or next_image = '1' then 
            if increase_row = '1' then 
                row_cnt_nxt <= to_unsigned(1, row_cnt_nxt'length);
            else
                row_cnt_nxt <= (others => '0'); 
            end if;
        end if;
    end process;



    -------------------------------------------------------
    -- ADDRESS COUNTERS
    -------------------------------------------------------
    P_COMB_ROW_ADDR : process (addr_row_reg, next_row, en_addr_cnt_row, next_image, switch_to_receveing)
    begin 
        addr_row_nxt <= addr_row_reg;

        if next_row = '1' or en_addr_cnt_row = '1' then 
            if addr_row_reg /= IMAGE_WIDTH - 1 then
                addr_row_nxt <= addr_row_reg + 1;
            end if;
        end if;

        if next_image = '1' OR switch_to_receveing = '1' then 
            addr_row_nxt <= addr_type_row'low;
        end if;
    end process;

    P_COMB_COLUMN_ADDR : process (addr_column_reg, next_pixel, en_addr_cnt_column, next_row, next_image, state_reg, addr_row_reg, switch_to_receveing)
    begin 
        addr_column_nxt <= addr_column_reg;

        if next_pixel = '1' or en_addr_cnt_column = '1'then 
            if addr_column_reg /= IMAGE_HEIGHT - 1 then 
                addr_column_nxt <= addr_column_reg + 1;
            end if;
        end if;

        if (next_row = '1' and state_reg = RECEIVING and addr_row_reg /= IMAGE_WIDTH - 1) or next_image = '1' or switch_to_receveing = '1' then 
            addr_column_nxt <= addr_type_column'low;
        end if;
    end process;






    --------------------------------------------------------------------------------------------------
    --
    --
    -- AXI LITE INTERFACE
    --
    --
    --------------------------------------------------------------------------------------------------

    -- I/O Connections assignments

    S_AXI_AWREADY   <= axi_awready;
    S_AXI_WREADY    <= axi_wready;
    S_AXI_BRESP     <= axi_bresp;
    S_AXI_BVALID    <= axi_bvalid;
    S_AXI_ARREADY   <= axi_arready;
    S_AXI_RDATA     <= axi_rdata;
    S_AXI_RRESP     <= axi_rresp;
    S_AXI_RVALID    <= axi_rvalid;
    -- Implement axi_awready generation
    -- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
    -- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
    -- de-asserted when reset is low.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_awready <= '0';
          aw_en <= '1';
        else
          if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
            -- slave is ready to accept write address when
            -- there is a valid write address and write data
            -- on the write address and data bus. This design 
            -- expects no outstanding transactions. 
               axi_awready <= '1';
               aw_en <= '0';
            elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
               aw_en <= '1';
               axi_awready <= '0';
          else
            axi_awready <= '0';
          end if;
        end if;
      end if;
    end process;

    -- Implement axi_awaddr latching
    -- This process is used to latch the address when both 
    -- S_AXI_AWVALID and S_AXI_WVALID are valid. 

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_awaddr <= (others => '0');
        else
          if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
            -- Write Address latching
            axi_awaddr <= S_AXI_AWADDR;
          end if;
        end if;
      end if;                   
    end process; 

    -- Implement axi_wready generation
    -- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
    -- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
    -- de-asserted when reset is low. 

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_wready <= '0';
        else
          if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
              -- slave is ready to accept write data when 
              -- there is a valid write address and write data
              -- on the write address and data bus. This design 
              -- expects no outstanding transactions.           
              axi_wready <= '1';
          else
            axi_wready <= '0';
          end if;
        end if;
      end if;
    end process; 

    -- Implement memory mapped register select and write logic generation
    -- The write data is accepted and written to memory mapped registers when
    -- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
    -- select byte enables of slave registers while writing.
    -- These registers are cleared when reset (active low) is applied.
    -- Slave register write enable is asserted when valid address and data are available
    -- and the slave is ready to accept the write address and write data.
    --slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

    process (S_AXI_ACLK)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          slv_reg0 <= (others => '0');
          slv_reg1 <= (others => '0');
          slv_reg2 <= (others => '0');
          slv_reg3 <= (others => '0');
        else
          loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          if (slv_reg_wren = '1') then
            case loc_addr is
              when b"00" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 0
                    slv_reg0(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"01" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 1
                    slv_reg1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"10" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 2
                    slv_reg2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"11" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 3
                    slv_reg3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when others =>
                slv_reg0 <= slv_reg0;
                slv_reg1 <= slv_reg1;
                slv_reg2 <= slv_reg2;
                slv_reg3 <= slv_reg3;
            end case;
          end if;
        end if;
      end if;                   
    end process; 

    -- Implement write response logic generation
    -- The write response and response valid signals are asserted by the slave 
    -- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
    -- This marks the acceptance of address and indicates the status of 
    -- write transaction.

     process (S_AXI_ACLK)
     begin
       if rising_edge(S_AXI_ACLK) then 
         if S_AXI_ARESETN = '0' then
           axi_bvalid  <= '0';
           axi_bresp   <= "00"; --need to work more on the responses
         else
           if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
             axi_bvalid <= '1';
             axi_bresp  <= "00"; 
           elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
             axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
           end if;
         end if;
       end if;                   
     end process; 

    -- Implement axi_arready generation
    -- axi_arready is asserted for one S_AXI_ACLK clock cycle when
    -- S_AXI_ARVALID is asserted. axi_awready is 
    -- de-asserted when reset (active low) is asserted. 
    -- The read address is also latched when S_AXI_ARVALID is 
    -- asserted. axi_araddr is reset to zero on reset assertion.

    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
          axi_arready <= '0';
          axi_araddr  <= (others => '1');
        else
          if (axi_arready = '0' and S_AXI_ARVALID = '1') then
            -- indicates that the slave has acceped the valid read address
            axi_arready <= '1';
            -- Read Address latching 
            axi_araddr  <= S_AXI_ARADDR;           
          else
            axi_arready <= '0';
          end if;
        end if;
      end if;                   
    end process; 

    -- Implement axi_arvalid generation
    -- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
    -- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
    -- data are available on the axi_rdata bus at this instance. The 
    -- assertion of axi_rvalid marks the validity of read data on the 
    -- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
    -- is deasserted on reset (active low). axi_rresp and axi_rdata are 
    -- cleared to zero on reset (active low).  
    process (S_AXI_ACLK)
    begin
      if rising_edge(S_AXI_ACLK) then
        if S_AXI_ARESETN = '0' then
          axi_rvalid <= '0';
          axi_rresp  <= "00";
        else
          if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
            -- Valid read data is available at the read data bus
            axi_rvalid <= '1';
            axi_rresp  <= "00"; -- 'OKAY' response
          elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
            -- Read data is accepted by the master
            axi_rvalid <= '0';
          end if;            
        end if;
      end if;
    end process;

    -- Implement memory mapped register select and read logic generation
    -- Slave register read enable is asserted when valid address is available
    -- and the slave is ready to accept the read address.
    slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

    process (axi_out_row_reg, axi_out_column_reg, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
    begin
        -- Address decoding for reading registers
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"00" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_out_row_reg), C_S_AXI_DATA_WIDTH));
          when b"01" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_out_column_reg), C_S_AXI_DATA_WIDTH));
          when b"10" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_out_row_reg), C_S_AXI_DATA_WIDTH));
          when b"11" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_out_column_reg), C_S_AXI_DATA_WIDTH));
          when others =>
            reg_data_out  <= (others => '0');
        end case;
    end process; 

    -- Output register or memory read data
    process( S_AXI_ACLK ) is
    begin
      if (rising_edge (S_AXI_ACLK)) then
        if ( S_AXI_ARESETN = '0' ) then
          axi_rdata  <= (others => '0');
        else
          if (slv_reg_rden = '1') then
            -- When there is a valid read address (S_AXI_ARVALID) with 
            -- acceptance of read address by the slave (axi_arready), 
            -- output the read dada 
            -- Read address mux
              axi_rdata <= reg_data_out;     -- register read data
          end if;   
        end if;
      end if;
    end process;

end architecture;