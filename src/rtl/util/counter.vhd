----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Counter
-- Details: 
--          This module is a simple counter which count to the specified value
--          after which it indicates that it finished counting. Can self reset
--          or reset at a specific value.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library util;
use util.util_pkg.all;


entity counter is
    Generic (
        RESET_VALUE : integer := 4;
        AUTO_RESET : std_logic := '1'
    );
    Port ( 
        en : in STD_LOGIC;
        finished : out STD_LOGIC;
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        value : out std_logic_vector(log2(RESET_VALUE) downto 0)
    );
end counter;


architecture Behavioral of counter is
    signal cnt_current, cnt_next : unsigned(log2(RESET_VALUE) downto 0) := (others => '0');
begin
    
    value <= std_logic_vector(cnt_current);
    
    seq : process (rst, clk, cnt_current) 
    begin
        if rising_edge(clk) then
            if rst = '0' then
                cnt_current <= (others => '0');
            else
                cnt_current <= cnt_next;
            end if;
        end if;
    end process;

    -- Finished is set here so that is does not deppend on the enable signal
    finished <= '1' when cnt_current >= RESET_VALUE else '0';

    com : process(cnt_current, en) 
    begin
        
        cnt_next <= cnt_current;
        if en = '1' then
            if cnt_current < RESET_VALUE then
                cnt_next <= cnt_current + 1;
            else
                if AUTO_RESET = '1' then
                    cnt_next <= (others => '0');
                end if;
            end if;
        end if;
    end process;

end Behavioral;
