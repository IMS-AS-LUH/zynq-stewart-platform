----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Pulse generator
-- Details: 
--          This module is generates a pulse based on a specified cycle and 
--          pulse length. It can be configure to just run once or continuously  
--          by resetting itself.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity pulse_generator is
    Generic(
        CYCLE_WIDTH : integer;
        PULSE_WIDTH : integer;
        SELF_RESET : integer
    );
    Port ( 
        clk                 : in std_logic;
        nreset              : in std_logic;
        cycle_length        : in std_logic_vector(CYCLE_WIDTH - 1 downto 0); 
        pulse_length        : in std_logic_vector(PULSE_WIDTH - 1 downto 0);
        output              : out std_logic
    );
end pulse_generator;

architecture Behavioral of pulse_generator is
    
    ------
    -- Cycle Signals
    ------
    signal cnt_cycle_current, cnt_cycle_next   : unsigned(CYCLE_WIDTH - 1 downto 0) := (others => '0');
    
    
    ------
    -- Pulse Signals
    ------
    signal cnt_pulse_current, cnt_pulse_next   : unsigned(PULSE_WIDTH - 1 downto 0) := (others => '0');
begin
    
    output <= '1' when cnt_pulse_current < unsigned(pulse_length) and nreset /= '0' else '0';
    
    -- main process, cnt up 
    proc_reg : process (clk, nreset)
    begin
        if rising_edge(clk) then
            if nreset = '0' then
                cnt_cycle_current <= (others => '0');
                cnt_pulse_current <= (others => '0');
            else
                cnt_cycle_current <= cnt_cycle_next;
                cnt_pulse_current <= cnt_pulse_next;
            end if;
        end if;
    end process;
    
    -- counter for Cycle, reset at current_cycle >= cycle_length, reset pulse counter, not an output
    -- counter for pulse, output 1 if pulse_length < current pulse_length, used for output
    cnt : process(cnt_pulse_current, cnt_cycle_current, cycle_length, pulse_length)
    begin
        
        if SELF_RESET = 1 then
            cnt_cycle_next <= (others => '0');
            cnt_pulse_next <= (others => '0');
        else
            cnt_cycle_next <= cnt_cycle_current;
            cnt_pulse_next <= cnt_pulse_current;
        end if;
        
        if cnt_cycle_current < (unsigned(cycle_length) - 1) then
            cnt_cycle_next <= cnt_cycle_current + 1;
            cnt_pulse_next <= cnt_pulse_current;
            
            if cnt_pulse_current < unsigned(pulse_length) then
                cnt_pulse_next <= cnt_pulse_current + 1;
            end if;
        end if;
    end process;

end Behavioral;
