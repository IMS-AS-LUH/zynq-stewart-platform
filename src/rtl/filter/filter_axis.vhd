----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  AXI-Stream Filter
-- Details: 
--          This module is the wrapper which connects the filter with
--          the AXI-Stream. It also handels the data buffers.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library util;
use util.util_pkg.all;

library filter;
library memory;

entity filter_axis is
    generic (
        FILTER_SIZE : integer := 3;
        BUFFER_SIZE : integer := 1920;
        FILTER_TYPE : integer := KERNEL_SMOOTHING_ID
    );
    Port (
        -- Base
        clk                 : in STD_LOGIC;
        reset               : in STD_LOGIC;
        
        -- AXIS Slave Interface
        s_tvalid       : in std_logic;                       -- Transfer valid (required)
        s_tready       : out std_logic;                       -- Transfer ready (optional)
        s_tdata        : in std_logic_vector(23 downto 0);   -- Transfer Data (optional)
        s_tlast        : in std_logic;                       -- Packet Boundary Indicator (optional)
        s_tuser        : in std_logic_vector(0 downto 0);    -- Transfer user sideband (optional)

		-- AXIS Master Interface
        m_tvalid      : out std_logic;                       -- Transfer valid (required)
        m_tready      : in std_logic;                        -- Transfer ready (optional)
        m_tdata       : out std_logic_vector(23 downto 0);   -- Transfer Data (optional)
        m_tlast       : out std_logic;                       -- Packet Boundary Indicator (optional)
        m_tuser       : out std_logic_vector(0 downto 0)     -- Transfer user sideband (optional)

    );
end filter_axis;

architecture Behavioral of filter_axis is

    ATTRIBUTE X_INTERFACE_INFO : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_INFO of s_tready: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
    ATTRIBUTE X_INTERFACE_INFO of s_tdata: SIGNAL is "xilinx.com:interface:axis:1.0  S_AXIS TDATA";
    ATTRIBUTE X_INTERFACE_INFO of s_tlast: SIGNAL is "xilinx.com:interface:axis:1.0  S_AXIS TLAST";
    ATTRIBUTE X_INTERFACE_INFO of s_tuser: SIGNAL is "xilinx.com:interface:axis:1.0  S_AXIS TUSER";
    ATTRIBUTE X_INTERFACE_INFO of s_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
    
    ATTRIBUTE X_INTERFACE_INFO of m_tready: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
    ATTRIBUTE X_INTERFACE_INFO of m_tdata: SIGNAL is "xilinx.com:interface:axis:1.0  M_AXIS TDATA";
    ATTRIBUTE X_INTERFACE_INFO of m_tlast: SIGNAL is "xilinx.com:interface:axis:1.0  M_AXIS TLAST";
    ATTRIBUTE X_INTERFACE_INFO of m_tuser: SIGNAL is "xilinx.com:interface:axis:1.0  M_AXIS TUSER";
    ATTRIBUTE X_INTERFACE_INFO of m_tvalid: SIGNAL is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
    
    ATTRIBUTE X_INTERFACE_PARAMETER of s_tvalid: SIGNAL is "FREQ_HZ 142857132, CLK_DOMAIN base_ps7_0_0_FCLK_CLK1";
    ATTRIBUTE X_INTERFACE_PARAMETER of m_tvalid: SIGNAL is "FREQ_HZ 142857132, CLK_DOMAIN base_ps7_0_0_FCLK_CLK1";

    type line_buffer_connections_t is array(FILTER_SIZE downto 0) of std_logic_vector(7 downto 0);
    
    signal line_buffer_connections : line_buffer_connections_t := (others => (others => '0'));

    signal buffer_en : std_logic := '0';

    signal kernel_input : STD_LOGIC_VECTOR (8*FILTER_SIZE - 1 downto 0) := (others => '0');

    
    signal kernel_din : STD_LOGIC_VECTOR (8*FILTER_SIZE - 1 downto 0) := (others => '0');
    signal kernel_dout : std_logic_vector (7 downto 0) := (others => '0');
    
    signal kernel_valid : std_logic := '0';
    
    signal next_kernel_en, current_kernel_en : std_logic := '0';
    
    signal next_axis_valid, current_axis_valid : std_logic := '0';
    signal next_axis_last_shift, current_axis_last_shift : std_logic_vector(KERNEL_DELAYS(FILTER_TYPE) downto 0) := (others => '0');
    signal next_axis_user_shift, current_axis_user_shift : std_logic_vector(KERNEL_DELAYS(FILTER_TYPE) downto 0) := (others => '0');

begin
    
    filter_core : entity filter.filter_kernel
        generic map (FILTER_SIZE, FILTER_TYPE)
        port map(
            clk => clk,
            rst => reset,
            en => current_kernel_en,
            valid => kernel_valid,
            data_in => kernel_din,
            data_out => kernel_dout
        );
        
     kernel_din <= kernel_input;
    
    ------------------------------------------------------------------------------------------
    --
    -- Line Buffer Logic
    --
    ------------------------------------------------------------------------------------------
    line_buffer_connections(0) <= s_tdata(7 downto 0);
    
    --
    -- Generate buffer
    --
    buffer_en <= s_tvalid and m_tready;
    forgen_line_gen : for i in FILTER_SIZE - 1 downto 0 generate
        signal shift_ram_output : std_logic_vector(7 downto 0) := (others => '0');
    begin
        -- Setup connections to kernel and following buffer line
        kernel_input( (8 + 8 * i) - 1  downto 8 * i) <= shift_ram_output;
        line_buffer_connections(i+1) <= shift_ram_output;
        
        -- Initialize RAM based shift register
        shift_ram : entity memory.ram_shift_register 
        generic map(
            DATA_WIDTH  => 8,
            DEPTH       => BUFFER_SIZE
        )
        port map(
            clk => clk,
            rst_n => reset,
            en => buffer_en,
            data_in => line_buffer_connections(i),
            data_out => shift_ram_output
        );

    end generate;
    
    ------------------------------------------------------------------------------------------
    --
    -- Registers
    --
    ------------------------------------------------------------------------------------------
    P_REG_SEQ : process (reset, clk,  next_kernel_en, next_axis_user_shift, next_axis_last_shift) is --cnt_next, next_rst_write, next_select_read, next_finished, next_state, next_select_write, next_value) is 
    begin
        if reset = '0' then          
            current_kernel_en <= '0';

            current_axis_valid <= '0';
            current_axis_user_shift <= (others => '0');
            current_axis_last_shift <= (others => '0');
        else
            if rising_edge(clk) then              
                current_kernel_en <= next_kernel_en;

                current_axis_valid <= next_axis_valid;
                current_axis_user_shift <= next_axis_user_shift;
                current_axis_last_shift <= next_axis_last_shift;
            end if;
        end if;
    
    end process;
    
    ------------------------------------------------------------------------------------------
    --
    -- AXI-Stream
    --
    ------------------------------------------------------------------------------------------
    
    -----------------------------
    -- Last and User Signal Shift Req
    -- 
    -- This is used to compensate delay added by the pipelined adder of the
    -- filter.
    -----------------------------
    next_axis_last_shift(0) <= s_tlast when s_tvalid = '1' and m_tready = '1' else current_axis_last_shift(0);
    forgen_shift_axis_valid : for i in KERNEL_DELAYS(FILTER_TYPE) - 1 downto 0 generate
        next_axis_last_shift(i+1) <= current_axis_last_shift(i)when s_tvalid = '1' and m_tready = '1' else current_axis_last_shift(i+1);
    end generate;
    
    next_axis_user_shift(0) <= s_tuser(0) when s_tvalid = '1' and m_tready = '1' else current_axis_user_shift(0); -- Can be more than one bit so it is always an array type even if it is only one bit like here
    forgen_shift_axis_user : for i in KERNEL_DELAYS(FILTER_TYPE) - 1 downto 0 generate
        next_axis_user_shift(i+1) <= current_axis_user_shift(i) when s_tvalid = '1' and m_tready = '1' else current_axis_user_shift(i+1);
    end generate;
    
    
    -----------------------------
    -- Slave
    -----------------------------
    s_tready <= m_tready;
    proc_s_axis : process(s_tvalid, m_tready, s_tdata, s_tuser, s_tlast) is 
    begin
        next_kernel_en <= '0';
        if s_tvalid = '1' and m_tready = '1' then
            next_kernel_en <= '1';
        end if;
    end process;
    
    -----------------------------
    -- Master
    -----------------------------
    m_tvalid <= s_tvalid;
    proc_m_axis : process(m_tready, kernel_valid, kernel_dout, current_axis_last_shift, current_axis_user_shift) is
    begin
        
        --m_tvalid <= '0';
        m_tdata <= (others => '0');
        m_tuser <= "0";
        m_tlast <= '0';

        if m_tready = '1' and kernel_valid = '1' then
            --m_tvalid <= '1';
            m_tdata <= std_logic_vector(to_unsigned(0, 16)) & kernel_dout;
            m_tuser <= (others => current_axis_user_shift(current_axis_user_shift'length - 1));
            m_tlast <= current_axis_last_shift(current_axis_last_shift'length - 1);
        end if;
    end process;
   
end Behavioral;