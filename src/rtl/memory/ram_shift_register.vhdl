----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  RAM Shift Register
-- Details: 
--          This module is a RAM based shift register. If the DEPTH is chosen
--          to small it will uses logic to implement the shift register.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ram_shift_register is
    Generic (
            DATA_WIDTH    : natural       := 8;
            DEPTH         : natural       := 1024 
        );
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           data_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           en : in STD_LOGIC);
end ram_shift_register;

architecture Behavioral of ram_shift_register is
    
    -- RAM
    type ram_type is array(0 to DEPTH - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal RAM : ram_type := (others => (others => '0'));

    constant RAM_LIMIT : integer := 32;
    
begin

    -- Use logic to generate shift register
    IG_SHIFT_REG : if DEPTH <= RAM_LIMIT generate
        type shift_reg_t is array(0 to DEPTH - 1) of std_logic_vector(DATA_WIDTH - 1 downto 0);
        
        signal shift_reg_current, shift_reg_next : shift_reg_t := (others => (others => '0') );
    begin
        shift_reg_next(0) <= data_in;
        
        data_out <= shift_reg_current(DEPTH - 1);
        IG_SHIFT : if DEPTH > 1 generate
            FG_SHIFT_REG : for i in 1 to DEPTH - 1 generate
                shift_reg_next(i) <= shift_reg_current(i - 1);
            end generate FG_SHIFT_REG;    
        end generate IG_SHIFT;
    
        P_SHIFT_REG_SEQ : process(clk, rst_n) begin
            if rising_edge(clk) then
                if rst_n = '0' then
                    shift_reg_current <= (others => (others => '0'));
                else 
                    shift_reg_current <= shift_reg_next;
                end if;
            end if;
        end process P_SHIFT_REG_SEQ;
    end generate IG_SHIFT_REG;


    -- Use RAM to generate shift register
    IG_RAM : if DEPTH > RAM_LIMIT generate
        subtype addr_type is integer range ram_type'range;
        signal addr_reg, addr_nxt, addr_mod : addr_type; 
        signal ram_data_out_reg : STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
    begin
        -- RAM Write
        P_RAM_WRITE_SEQ : process (clk)
        begin
            if rising_edge(clk) then 
                if en = '1' then
                    ram(addr_reg) <= data_in;
                end if;
            end if;
        end process;
        
        -- RAM READ
        addr_mod <= (addr_reg + 1) mod (addr_type'high + 1);
        data_out <= ram_data_out_reg;
        P_RAM_READ_SEQ : process (clk)
        begin
            if rising_edge(clk) then 
                ram_data_out_reg <= ram(addr_mod);
            end if;
        end process;
    
        -- Register
        P_ADDR_SEQ : process (clk, rst_n)
        begin
            if rising_edge(clk) then
                if rst_n = '0' then
                    addr_reg <= 0;
                else
                    addr_reg <= addr_nxt;
                end if;
            end if;
        end process;
    
        -- Addres Increment logic
        P_ADDR_COMB : process (en, addr_reg)
        begin
            addr_nxt <= addr_reg;
    
            if en = '1' then
                if addr_reg = addr_type'high then
                    addr_nxt <= addr_type'low;
                else
                    addr_nxt <= addr_reg + 1;
                end if;
            end if;
        end process;
    end generate IG_RAM;

end Behavioral;
