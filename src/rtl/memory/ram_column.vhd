----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  RAM Column
-- Details: 
--          This module is a dual port RAM used for storing the values of the 
--          column histogram.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

entity ram_column is
    generic (
        IMAGE_HEIGHT     : integer := 1080;
        CNT_WIDTH     : integer := 12
    );
    port (
        clk   : in std_logic;

        
        en_wr   : in std_logic;
        rden   : in std_logic;
        wen    : in std_logic;
        raddr  : in integer;
        waddr  : in integer;
        w_data : in unsigned(CNT_WIDTH - 1 downto 0);
        r_data : out unsigned(CNT_WIDTH -1 downto 0)
    );
end entity;

architecture rtl of ram_column is
    type ram_type is array(0 to IMAGE_HEIGHT - 1) of std_logic_vector(CNT_WIDTH - 1 downto 0);
    
    signal RAM : ram_type := (others => (others => '0'));
    
    attribute ram_style : string;
    attribute ram_style of RAM : signal is "block";
begin
    P_SEQ_WRITE : process (clk)
    begin
        if rising_edge(clk) then 
            if en_wr = '1' then 
                if wen = '1' then 
                    RAM(waddr) <= std_logic_vector(w_data);
                end if;
            end if;
        end if;
    end process;

    P_SEQ_READ : process (clk)
    begin
        if rising_edge(clk) then
            if rden = '1' then 
                r_data <= unsigned(RAM(raddr));
            end if;
        end if;
    end process;
end architecture;