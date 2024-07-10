----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Filter Slice
-- Details: 
--          This is the processing element of the filter. The logic generated 
--          is determined by the selected filter type.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library util;
use util.util_pkg.all;


entity filter_slice is
    generic (
        FILTER_ROW : integer := 0;
        FILTER_COL : integer := 0;
        FILTER_TYPE : integer := KERNEL_SMOOTHING_ID;
        DATA_WIDTH : integer := 8;
        RESULT_WIDTH : integer := 9
    );
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           data_out : out STD_LOGIC_VECTOR (DATA_WIDTH - 1 downto 0);
           result_in : in STD_LOGIC_VECTOR (RESULT_WIDTH - 1 downto 0);
           result_out : out STD_LOGIC_VECTOR (RESULT_WIDTH - 1 downto 0)
           );
end filter_slice;

architecture Behavioral of filter_slice is
    
    signal reg_current, reg_next : std_logic_vector(DATA_WIDTH - 1 downto 0) := (others => '0');
    signal outd : std_logic_vector(RESULT_WIDTH - 1 downto 0) := (others => '0');
    
begin
    
    reg_next <= data_in when en = '1' else reg_current;
    data_out <= reg_current;
    
    result_out <= outd;
    
    P_REG_SEQ: process (clk, reg_next) begin
        if rising_edge(clk) then
            if en = '1' then
                reg_current <= reg_next;
            end if;
        end if;
    end process;
    
    -- Output generation for the smoothing filter
    genif_smooth : if FILTER_TYPE = KERNEL_SMOOTHING_ID generate
        comb : process(result_in, reg_current) begin
                outd <= std_logic_vector(signed(result_in) + shift_right(signed('0' & reg_current), KERNEL_SMOOTH(FILTER_ROW)(FILTER_COL)));
        end process;
    end generate;
 
 
    --
    -- This is the edge calculation. This calculates both the value of the x and the y edge.
    -- The values are then accumulated together. This is supposed to reduce the amount of filters
    -- used and should result in the same result.
    --
    genif_edge : if FILTER_TYPE = KERNEL_EDGE_ID generate
        -- Signals are for debugging purpose only
        signal xProd, yProd : signed(9 downto 0) := (others => '0');
        signal out_result : signed(9 downto 0) := (others => '0');
    begin
        comb : process(result_in, reg_current) 
            variable tempXprod, tempYprod : signed(9 downto 0) := (others => '0');
            variable result : signed(9 downto 0) := (others => '0');
        begin
            
            ------
            -- X Calculation
            ------
        
            -- Multiplication with factor, either -1 or 1 or 0
            if KERNEL_EDGE_X(FILTER_ROW)(FILTER_COL) > 0 then
                tempXprod := signed("00" & reg_current);
            elsif KERNEL_EDGE_X(FILTER_ROW)(FILTER_COL) < 0 then
                -- Make Number negative
                tempXprod := (not signed("00" & reg_current)) + 1;
            else
                tempXprod := to_signed(0, tempXprod'length);
            end if;
            
            xProd <= tempXprod; 
   
            ------
            -- Y Calculation
            ------
            
            -- Multiplication with factor, either -1 or 1 or 0
            if KERNEL_EDGE_Y(FILTER_ROW)(FILTER_COL) > 0 then
                tempYprod := signed("00" & reg_current);
            elsif KERNEL_EDGE_Y(FILTER_ROW)(FILTER_COL) < 0 then
                -- Make Number negative
                tempYprod := (not signed("00" & reg_current)) + 1;
            else
                tempYprod := to_signed(0, tempYprod'length);
            end if;
            
            yProd <= tempYprod;

            -- Result of both edges
            result :=  signed(result_in) + shift_right((tempYProd) + (tempXProd), 2);

            out_result <= result;
            
            -- Fitting result into pixel
            if result > 255 or result < -255 then
                -- Most Positive 011111111 255
                -- Most negative 100000001 -255
                outd(outd'length - 1) <= result(result'length - 1); -- set highest bit
                outd(outd'length - 2 downto 1) <= (others => not result(result'length - 1));
                outd(0) <= '1';
            else
                outd <= std_logic_vector( result(result'length-1) & result(7 downto 0)); -- (others => '0'); -- 
            end if;
        end process;
    end generate;

end Behavioral;
