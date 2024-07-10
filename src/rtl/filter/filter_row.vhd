----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Filter Row
-- Details: 
--          This module represent a row in the kernel of the filter. The hardware
--          generated depends on the selected filter. 
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library util;
use util.util_pkg.all;

library filter;

entity filter_row is
    Generic (
        FILTER_LENGTH : natural := 3;
        FILTER_ROW : integer := 0;
        FILTER_TYPE : integer := KERNEL_SMOOTHING_ID
    );
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (8 downto 0));
end filter_row;

architecture Behavioral of filter_row is
    
    signal result_connections : std_logic_vector(FILTER_LENGTH * 9 - 1 downto 0) := (others => '0');
    
    type connections_t is array(FILTER_LENGTH downto 0) of std_logic_vector(7 downto 0);
    signal data_connections : connections_t := (others => (others => '0'));
    
    signal dout : STD_LOGIC_VECTOR(8 downto 0) := (others => '0');
    
begin

    -- Generate slices for the row
    genif_std_slice : if FILTER_TYPE = KERNEL_EDGE_ID or
                         FILTER_TYPE = KERNEL_SMOOTHING_ID
    generate
        
        data_out <= dout;
        
        inst_std_adder : entity util.hierarchicalAdder
        generic map (FILTER_LENGTH, 9, 9, true, log2(FILTER_LENGTH))
        port map(
            clk => clk,
            rst => '1',
            en => en,
            input => result_connections,
            output => dout
        );
    
        data_connections(0) <= data_in;
        
        genfor_filter : for i in 0 to FILTER_LENGTH - 1 generate
            filter_slice_i : entity filter.filter_slice 
                generic map (FILTER_ROW, i, FILTER_TYPE, 8, 9)
                port map(
                    clk => clk,
                    en => en,
                    data_in => data_connections(i),
                    data_out => data_connections(i+1),
                    -- Result in is not connected as all the outputs are connected to a 
                    -- seperate adder unit which is pipelined.
                    result_in => (others => '0'),
                    result_out => result_connections(i*9 + 9 - 1 downto i * 9)
                );
        end generate;
    end generate;
    
end Behavioral;
