----------------------------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
--
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Crop Stream
-- Details: 
--          This modules crops the images in the stream. This is used to focus on a section
--          of interest and remove problem section around it.

-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------------------------

Library xpm;
use xpm.vcomponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity crop_stream is
    generic(
        -- Width of S_AXI data bus
        C_S_AXI_DATA_WIDTH    : integer    := 32;
        -- Width of S_AXI address bus
        C_S_AXI_ADDR_WIDTH    : integer    := 12;
        DEFAULT_LIMIT_LOWER_X : integer     := 0;
        DEFAULT_LIMIT_UPPER_X : integer     := 1920;
        DEFAULT_LIMIT_LOWER_Y : integer     := 0;
        DEFAULT_LIMIT_UPPER_Y : integer     := 1080
    );
    port (
        clk     : in std_logic;
        rst_n   : in std_logic;

    --------------------------------------------------------
    -- AXIS Signals
    --------------------------------------------------------
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

    --------------------------------------------------------
    -- AXI4LITE Signals
    --------------------------------------------------------
        -- Global Clock Signal
        S_AXI_ACLK    : in std_logic;
        S_AXI_ARESETN    : in std_logic;
        S_AXI_AWADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_AWPROT    : in std_logic_vector(2 downto 0);
        S_AXI_AWVALID    : in std_logic;
        S_AXI_AWREADY    : out std_logic;
        S_AXI_WDATA    : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_WSTRB    : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        S_AXI_WVALID    : in std_logic;
        S_AXI_WREADY    : out std_logic;
        S_AXI_BRESP    : out std_logic_vector(1 downto 0);
        S_AXI_BVALID    : out std_logic;
        S_AXI_BREADY    : in std_logic;
        S_AXI_ARADDR    : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        S_AXI_ARPROT    : in std_logic_vector(2 downto 0);
        S_AXI_ARVALID    : in std_logic;
        S_AXI_ARREADY    : out std_logic;
        S_AXI_RDATA    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_RRESP    : out std_logic_vector(1 downto 0);
        S_AXI_RVALID    : out std_logic;
        S_AXI_RREADY    : in std_logic
    );
end entity;

architecture rtl of crop_stream is

--------------------------------------------------------
-- AXI4LITE signals START
--------------------------------------------------------
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
    signal slv_reg_rden    : std_logic;
    signal slv_reg_wren    : std_logic;
    signal reg_data_out    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_en    : std_logic;
    
    
--------------------------------------------------------
-- AXI4LITE signals END
--------------------------------------------------------


--------------------------------------------------------
-- Architecture Signals
--------------------------------------------------------
    signal cnt_limit_x_reg, cnt_limit_y_reg : unsigned(C_S_AXI_DATA_WIDTH - 1 downto 0);

    signal axi_limit_lower_x_reg, axi_limit_upper_x_reg : unsigned(C_S_AXI_DATA_WIDTH - 1 downto 0);
    signal axi_limit_lower_y_reg, axi_limit_upper_y_reg : unsigned(C_S_AXI_DATA_WIDTH - 1 downto 0);

    signal axis_limit_lower_x_reg, axis_limit_upper_x_reg : unsigned(C_S_AXI_DATA_WIDTH - 1 downto 0);
    signal axis_limit_lower_y_reg, axis_limit_upper_y_reg : unsigned(C_S_AXI_DATA_WIDTH - 1 downto 0);

    signal cdc_active : std_logic;
    
    signal cdc_axis_data : std_logic_vector(4*C_S_AXI_DATA_WIDTH - 1 downto 0);
    signal cdc_axis_avail : std_logic;
    
    signal cdc_axi_data : std_logic_vector(4*C_S_AXI_DATA_WIDTH - 1 downto 0);
    signal cdc_axi_ready, cdc_axi_ack : std_logic;
    
    signal m_tvalid_buf     : std_logic;
    signal m_tlast_buf      : std_logic;
    signal m_tuser_buf      : std_logic_vector(0 downto 0);
    signal m_tdata_buff     : std_logic_vector(23 downto 0);

begin

    s_tready    <= m_tready;

    P_REG_SEQ : process(clk) begin
        if rising_edge(clk) then 

            m_tvalid_buf    <= s_tvalid;
            m_tlast_buf     <= s_tlast;
            m_tuser_buf     <= s_tuser;
            m_tdata_buff    <= s_tdata;

            m_tvalid    <= m_tvalid_buf;
            m_tlast     <= m_tlast_buf;
            m_tuser     <= m_tuser_buf;

            -- Only send the data if it is inside the crop window
            if (cnt_limit_x_reg >= axis_limit_lower_x_reg and cnt_limit_x_reg < axis_limit_upper_x_reg) and
                (cnt_limit_y_reg >= axis_limit_lower_y_reg and cnt_limit_y_reg < axis_limit_upper_y_reg) then 
                m_tdata <= m_tdata_buff;
            else
                m_tdata <= (others => '0');
            end if;
        end if;
    end process;

    -----------------------------------------------------------------------
    --
    -- Counter Specification
    --
    -----------------------------------------------------------------------

    P_CNT_X_SEQ : process(clk) begin 
        if rising_edge(clk) then 
            if rst_n = '0' then 
                cnt_limit_x_reg <= to_unsigned(0, cnt_limit_x_reg'length);
            else 
                cnt_limit_x_reg <= cnt_limit_x_reg;

                if s_tvalid = '1' and m_tready = '1'then 
                    if s_tlast = '1' or s_tuser(0) = '1' then 
                        cnt_limit_x_reg <= to_unsigned(0, cnt_limit_x_reg'length);
                    else
                        cnt_limit_x_reg <= cnt_limit_x_reg + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;


    P_CNT_Y_SEQ : process(clk) begin 
        if rising_edge(clk) then 
            if rst_n = '0' then 
                cnt_limit_y_reg <= to_unsigned(0, cnt_limit_y_reg'length);
            else 
                cnt_limit_y_reg <= cnt_limit_y_reg;
                if s_tvalid = '1' and m_tready = '1' then 
                    
                    if s_tuser(0) = '1' then 
                        cnt_limit_y_reg <= to_unsigned(0, cnt_limit_y_reg'length);
                    elsif s_tlast = '1' then 
                        cnt_limit_y_reg <= cnt_limit_y_reg + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;


    
    -----------------------------------------------------------------------
    --
    -- Clock Doman Crossing for AXI Register to AXIS
    --
    -----------------------------------------------------------------------

    P_CDC_AXI_SEQ : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then 
            if S_AXI_ARESETN = '0' then 
                cdc_active <= '0';
                cdc_axi_data <= (others => '0');
                cdc_axi_ready <= '0';
            else
                cdc_active <= cdc_active;
                if cdc_active = '0' and cdc_axi_ack /= '1' then 
                    cdc_active <= '1';
                    cdc_axi_data <= std_logic_vector(axi_limit_upper_y_reg & axi_limit_lower_y_reg &  axi_limit_upper_x_reg & axi_limit_lower_x_reg );
                end if;

                if cdc_active = '1' then 
                    cdc_axi_ready <= '1';
                    if cdc_axi_ack = '1' then 
                        cdc_axi_ready <= '0';
                        cdc_active <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    p_CDC_AXIS_SEQ : process(clk)
    begin
        if rising_edge(clk) then 
            if rst_n = '0' then 
                axis_limit_lower_x_reg  <= to_unsigned(0, axis_limit_lower_x_reg'length);
                axis_limit_upper_x_reg  <= to_unsigned(0, axis_limit_upper_x_reg'length); 
                axis_limit_lower_y_reg  <= to_unsigned(0, axis_limit_lower_y_reg'length);
                axis_limit_upper_y_reg  <= to_unsigned(0, axis_limit_upper_y_reg'length);
            else
                if cdc_axis_avail = '1' then
                    axis_limit_lower_x_reg  <= unsigned(cdc_axis_data(1 * C_S_AXI_DATA_WIDTH - 1 downto 0 * C_S_AXI_DATA_WIDTH));
                    axis_limit_upper_x_reg  <= unsigned(cdc_axis_data(2 * C_S_AXI_DATA_WIDTH - 1 downto 1 * C_S_AXI_DATA_WIDTH)); 
                    axis_limit_lower_y_reg  <= unsigned(cdc_axis_data(3 * C_S_AXI_DATA_WIDTH - 1 downto 2 * C_S_AXI_DATA_WIDTH));
                    axis_limit_upper_y_reg  <= unsigned(cdc_axis_data(4 * C_S_AXI_DATA_WIDTH - 1 downto 3 * C_S_AXI_DATA_WIDTH));
                else
                    axis_limit_lower_x_reg  <= axis_limit_lower_x_reg;
                    axis_limit_upper_x_reg  <= axis_limit_upper_x_reg; 
                    axis_limit_lower_y_reg  <= axis_limit_lower_y_reg;
                    axis_limit_upper_y_reg  <= axis_limit_upper_y_reg;
                end if;
            end if;
        end if;
    end process; 

    xpm_cdc_handshake_inst : xpm_cdc_handshake
    generic map (
        DEST_EXT_HSK => 0,   -- DECIMAL; 0=internal handshake, 1=external handshake
        DEST_SYNC_FF => 4,   -- DECIMAL; range: 2-10
        INIT_SYNC_FF => 1,   -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
        SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
        SRC_SYNC_FF => 4,    -- DECIMAL; range: 2-10
        WIDTH => 4 * C_S_AXI_DATA_WIDTH   -- DECIMAL; range: 1-1024
    )
    port map (
        dest_clk => clk,
        dest_out => cdc_axis_data, 
        dest_req => cdc_axis_avail, 
        dest_ack => '0',

        src_clk => S_AXI_ACLK,       
        src_in => cdc_axi_data,   
        src_rcv => cdc_axi_ack,   
        src_send => cdc_axi_ready 
    );


    --------------------------------------------------------------------------------------------------
    --
    --
    -- AXI LITE INTERFACE - AUTO GENERATED
    --
    --
    --------------------------------------------------------------------------------------------------

    -- I/O Connections assignments

    S_AXI_AWREADY    <= axi_awready;
    S_AXI_WREADY    <= axi_wready;
    S_AXI_BRESP    <= axi_bresp;
    S_AXI_BVALID    <= axi_bvalid;
    S_AXI_ARREADY    <= axi_arready;
    S_AXI_RDATA    <= axi_rdata;
    S_AXI_RRESP    <= axi_rresp;
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
    slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

    process (S_AXI_ACLK)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
    begin
      if rising_edge(S_AXI_ACLK) then 
        if S_AXI_ARESETN = '0' then
            axi_limit_lower_x_reg <= to_unsigned(DEFAULT_LIMIT_LOWER_X, axi_limit_lower_x_reg'length);
            axi_limit_upper_x_reg <= to_unsigned(DEFAULT_LIMIT_UPPER_X, axi_limit_upper_x_reg'length);
            axi_limit_lower_y_reg <= to_unsigned(DEFAULT_LIMIT_LOWER_Y, axi_limit_lower_y_reg'length);
            axi_limit_upper_y_reg <= to_unsigned(DEFAULT_LIMIT_UPPER_Y, axi_limit_upper_y_reg'length);
        else
          loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          if (slv_reg_wren = '1') then
            case loc_addr is
              when b"00" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 0
                    axi_limit_lower_x_reg(byte_index*8+7 downto byte_index*8) <= unsigned(S_AXI_WDATA(byte_index*8+7 downto byte_index*8));
                  end if;
                end loop;
              when b"01" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 1
                    axi_limit_upper_x_reg(byte_index*8+7 downto byte_index*8) <= unsigned(S_AXI_WDATA(byte_index*8+7 downto byte_index*8));
                  end if;
                end loop;
              when b"10" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 2
                    axi_limit_lower_y_reg(byte_index*8+7 downto byte_index*8) <= unsigned(S_AXI_WDATA(byte_index*8+7 downto byte_index*8));
                  end if;
                end loop;
              when b"11" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 3
                    axi_limit_upper_y_reg(byte_index*8+7 downto byte_index*8) <= unsigned(S_AXI_WDATA(byte_index*8+7 downto byte_index*8));
                  end if;
                end loop;
              when others =>
                axi_limit_lower_x_reg <= axi_limit_lower_x_reg;
                axi_limit_upper_x_reg <= axi_limit_upper_x_reg;
                axi_limit_lower_y_reg <= axi_limit_lower_y_reg;
                axi_limit_upper_y_reg <= axi_limit_upper_y_reg;
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

    process (axi_limit_lower_x_reg, axi_limit_upper_x_reg, axi_limit_lower_y_reg, axi_limit_upper_y_reg, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
    begin
        -- Address decoding for reading registers
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"00" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_limit_lower_x_reg), C_S_AXI_DATA_WIDTH));
          when b"01" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_limit_upper_x_reg), C_S_AXI_DATA_WIDTH));
          when b"10" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_limit_lower_y_reg), C_S_AXI_DATA_WIDTH));
          when b"11" =>
            reg_data_out <= std_logic_vector(resize(unsigned(axi_limit_upper_y_reg), C_S_AXI_DATA_WIDTH));
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