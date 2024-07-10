----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  PWM Generator
-- Details: 
--          This is an AXI connected module which is used to generate the 
--          pwm signals for the servos of the Stewart Platform. The values are 
--          set via memory mapped registers.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

Library xpm;
use xpm.vcomponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library servo;

entity pwm_generator is
    generic (
        -- Do not modify the parameters beyond this line
        -- Width of S_AXI data bus
        C_S_AXI_DATA_WIDTH    : integer    := 32;
        -- Width of S_AXI address bus
        C_S_AXI_ADDR_WIDTH    : integer    := 12 -- Technically overkill
    );
    Port (  
        clk : in STD_LOGIC;
        clk_1m : in std_logic;
        rst : in STD_LOGIC;
        pwm0 : out std_logic;
        pwm1 : out std_logic;
        pwm2 : out std_logic;
        pwm3 : out std_logic;
        pwm4 : out std_logic;
        pwm5 : out std_logic;
    
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
        S_AXI_ARVALID    : in std_logic;
        S_AXI_ARREADY    : out std_logic;
        S_AXI_RDATA    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        S_AXI_RRESP    : out std_logic_vector(1 downto 0);
        S_AXI_RVALID    : out std_logic;
        S_AXI_RREADY    : in std_logic
        
    );
end pwm_generator;

architecture Behavioral of pwm_generator is

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
    constant OPT_MEM_ADDR_BITS : integer := 2;
    
    ------------------------------------------------
    ---- Signals for user logic register space example
    --------------------------------------------------
    ---- Number of Slave Registers 4
    
    signal slv_reg0    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg1    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg2    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg3    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg4    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg5    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg6    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
    signal slv_reg7    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := std_logic_vector(TO_UNSIGNED(1, C_S_AXI_DATA_WIDTH));
    signal slv_reg_rden    : std_logic;
    signal slv_reg_wren    : std_logic;
    signal reg_data_out    :std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_en    : std_logic;
    
    
    --------------------------------------------------------
    -- AXI4LITE signals END
    --------------------------------------------------------
    
    constant PWM_BIT_LENGTH : integer := 13;
    
    signal clk_50_cdc_in, clk_50_cdc_out : std_logic;
    
    type pwm_pulse_length_t is array(5 downto 0) of std_logic_vector(PWM_BIT_LENGTH - 1 downto 0);
    
    signal pwm_out : std_logic_vector(5 downto 0);
    
    signal pwm_cdc_in, pwm_cdc_out : std_logic_vector(5 downto 0);

    signal pwm_pulse_length_current, pwm_pulse_length_next  : std_logic_vector(PWM_BIT_LENGTH * 6 - 1  downto 0) := (others => '0');
    
    
    signal pwm_pulse_length : pwm_pulse_length_t;
    signal pwm_cdc_in_pulse_length, pwm_cdc_out_pulse_length : pwm_pulse_length_t;
    signal pwm_cdc_pl_avail_c0, pwm_cdc_pl_ack_c0, pwm_cdc_pl_avail_c1 : std_logic_vector(5 downto 0);
begin

    pwm_out <= pwm_cdc_out;

    pwm0 <= slv_reg7(0) xor pwm_out(0);
    pwm1 <= slv_reg7(0) xor pwm_out(1);
    pwm2 <= slv_reg7(0) xor pwm_out(2);
    pwm3 <= slv_reg7(0) xor pwm_out(3);
    pwm4 <= slv_reg7(0) xor pwm_out(4);
    pwm5 <= slv_reg7(0) xor pwm_out(5);
    
    proc_comb : process (clk, rst) begin
       
        if rising_edge(clk) then
            if rst = '0' then
                pwm_pulse_length_current <= (others => '0');
            else
                pwm_pulse_length_current <= pwm_pulse_length_next;
            end if;
        end if;
        
    end process;
    
    proc_pulse_length_commit : process(slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, pwm_pulse_length_current) begin
        
        pwm_pulse_length_next <= pwm_pulse_length_current;
        
        if unsigned(slv_reg0) > 0 then
            pwm_pulse_length_next <= slv_reg6(PWM_BIT_LENGTH - 1 downto 0) & slv_reg5(PWM_BIT_LENGTH - 1 downto 0)& slv_reg4(PWM_BIT_LENGTH -1 downto 0)& slv_reg3(PWM_BIT_LENGTH -1 downto 0)& slv_reg2(PWM_BIT_LENGTH -1 downto 0) & slv_reg1(PWM_BIT_LENGTH -1 downto 0);
        end if;
        
    end process;
                
    -- 50 HZ clock -> cycle 2.000.000, pulse 1, self_reset true
    clk_50_inst : entity servo.pulse_generator 
    generic map(
        22, 
        22, 
        1
    ) 
    port map(
        clk                 => clk,
        nreset              => rst,
        cycle_length        => std_logic_vector(to_unsigned(2000000, 22)), --20000
        pulse_length        => std_logic_vector(to_unsigned(1000000, 22)),
        output              => clk_50_cdc_in
    );
    
    -- CDC for transferring 50Hz clock into the pulse generation clock domain
    xpm_cdc_single_inst_clk_50 : xpm_cdc_single
        generic map (
            DEST_SYNC_FF => 4,   
            INIT_SYNC_FF => 1,   
            SIM_ASSERT_CHK => 0, 
            SRC_INPUT_REG => 1   
        )
        port map (
            dest_out => clk_50_cdc_out, 
            dest_clk => clk_1m, 
            src_clk => clk,  
            src_in => clk_50_cdc_in
        );


    -- 6 x PWM -> cycle = (don't care but not to small); pulse = 1000 + a register value, self_reset false
    -- Reset input is connected to the output of the 50 Hz clk
    genfor_pwm_pulse :  for i in 0 to 5 generate

        -- Pulse generator running at 1MHz so the calculation from pulse length to 
        -- actual time is simpler
        pwm_1_inst : entity servo.pulse_generator 
                    generic map(PWM_BIT_LENGTH + 1, PWM_BIT_LENGTH, 0) 
                    port map(
                        clk                 => clk_1m,
                        nreset              => clk_50_cdc_out,
                        cycle_length        => (others => '1'),
                        pulse_length        => std_logic_vector(pwm_pulse_length(i)),
                        output              => pwm_cdc_in(i)
                    );

        -- Transfer of pulse length register into pwm gen clock domain
        xpm_cdc_handshake_inst : xpm_cdc_handshake
        generic map (
            DEST_EXT_HSK => 0,   
            DEST_SYNC_FF => 4,   
            INIT_SYNC_FF => 1,  
            SIM_ASSERT_CHK => 0, 
            SRC_SYNC_FF => 4,    
            WIDTH => pwm_cdc_in_pulse_length(0)'length
        )
        port map (
            dest_out => pwm_cdc_out_pulse_length(i), 
            dest_req => pwm_cdc_pl_avail_c1(i),
            src_rcv => pwm_cdc_pl_ack_c0(i),
            dest_ack => '0',
            dest_clk => clk_1m, 
            src_clk => clk,
            src_in => pwm_cdc_in_pulse_length(i),
            src_send => pwm_cdc_pl_avail_c0(i)
        );
            
        P_SEQ_CDC_C1 : process (clk_1m) 
        begin
            if rising_edge(clk_1m) then 
                if pwm_cdc_pl_avail_c1(i) = '1' then
                    pwm_pulse_length(i) <= pwm_cdc_out_pulse_length(i);
                end if;
            end if;
        end process;

        P_SEQ_CDC : process(clk, rst)
        begin
            if rising_edge(clk) then 
                if rst = '0' then 
                    pwm_cdc_in_pulse_length(i)      <= (others => '0');
                    pwm_cdc_pl_avail_c0(i)          <= '0';
                else
                    if pwm_cdc_pl_ack_c0(i) = '0' and pwm_cdc_pl_avail_c0(i) = '0' then 
                        pwm_cdc_pl_avail_c0(i) <= '1';
                        pwm_cdc_in_pulse_length(i) <= std_logic_vector(resize(unsigned(pwm_pulse_length_current(PWM_BIT_LENGTH*(i + 1) - 1 downto 0 + PWM_BIT_LENGTH*i)), PWM_BIT_LENGTH));
                    else
                        if pwm_cdc_pl_ack_c0(i) = '1' then 
                            pwm_cdc_pl_avail_c0(i) <= '0';
                        end if;
                    end if;
                end if;
            end if;
        end process;

        -- Transfer of pwm signal out of the pwm gen clock domain
        xpm_cdc_single_inst : xpm_cdc_single
            generic map (
                DEST_SYNC_FF => 4,   
                INIT_SYNC_FF => 1,   
                SIM_ASSERT_CHK => 0, 
                SRC_INPUT_REG => 1 
            )
            port map (
                dest_out => pwm_cdc_out(i), 
                dest_clk => clk, 
                src_clk => clk_1m,   
                src_in => pwm_cdc_in(i)
            );
    end generate;
    
    
    -------------------------------------------------
    --
    -- AXI LITE INTERFACE
    --
    -------------------------------------------------

    -- I/O Connections assignments

    S_AXI_AWREADY    <= axi_awready;
    S_AXI_WREADY    <= axi_wready;
    S_AXI_BRESP    <= axi_bresp;
    S_AXI_BVALID    <= axi_bvalid;
    S_AXI_ARREADY    <= axi_arready;
    S_AXI_RDATA    <= axi_rdata;
    S_AXI_RRESP    <= axi_rresp;
    S_AXI_RVALID    <= axi_rvalid;

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
    
       -- This register indicates the commit of the changes to the pwm signals
       -- this means the values of reg1 and reg2 are propegated into the pulse generators
       
      if rising_edge(S_AXI_ACLK) then 
        slv_reg0 <= (others => '0');
        if S_AXI_ARESETN = '0' then
          slv_reg0 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg1 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg2 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg3 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg4 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg5 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg6 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
          slv_reg7 <= std_logic_vector(TO_UNSIGNED(1000, C_S_AXI_DATA_WIDTH));
        else
          loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
          if (slv_reg_wren = '1') then
            case loc_addr is
              when b"000" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 0
                    slv_reg0(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"001" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 1
                    slv_reg1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"010" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 2
                    slv_reg2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"011" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 3
                    slv_reg3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"100" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    slv_reg4(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"101" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    slv_reg5(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"110" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    slv_reg6(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when b"111" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    slv_reg7(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
              when others =>
                slv_reg0 <= slv_reg0;
                slv_reg1 <= slv_reg1;
                slv_reg2 <= slv_reg2;
                slv_reg3 <= slv_reg3;
                slv_reg4 <= slv_reg4;
                slv_reg5 <= slv_reg5;
                slv_reg6 <= slv_reg6;
                slv_reg7 <= slv_reg7;
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

    process (slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, axi_araddr, S_AXI_ARESETN, slv_reg_rden)
    variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
    begin
        -- Address decoding for reading registers
        loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
        case loc_addr is
          when b"000" =>
            reg_data_out <= slv_reg0;
          when b"001" =>
            reg_data_out <= slv_reg1;
          when b"010" =>
            reg_data_out <= slv_reg2;
          when b"011" =>
            reg_data_out <= slv_reg3;
          when b"100" =>
            reg_data_out <= slv_reg4;
          when b"101" =>
            reg_data_out <= slv_reg5;
          when b"110" =>
            reg_data_out <= slv_reg6;
          when b"111" =>
            reg_data_out <= slv_reg7;
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

end Behavioral;
