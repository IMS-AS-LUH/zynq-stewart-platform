----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Filter Kernel
-- Details: 
--          This module is the actual filter and generates the needed hardware
--          based on the selected filter.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library util;
use util.util_pkg.all;

library filter;


entity filter_kernel is
    generic (
        FILTER_SIZE : natural := 3; -- has to correspond to the actual filter size selected with FILTER_TYPE
        FILTER_TYPE : integer := KERNEL_SMOOTHING_ID -- see, util/util.vhd for options
    );
    Port ( clk : in STD_LOGIC;
           rst : in std_logic;
           en : in std_logic;
           valid : out std_logic;
           data_in : in STD_LOGIC_VECTOR (8*FILTER_SIZE - 1 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
    end filter_kernel;

architecture Behavioral of filter_kernel is

    CONSTANT OPERAND_WIDTH : integer := 9;   
    
    signal result_next, result_current, result : std_logic_vector(FILTER_SIZE * OPERAND_WIDTH - 1 downto 0) := (others => '0');
    
    signal output_logic : std_logic_vector(OPERAND_WIDTH - 1 downto 0) := (others => '0');
    
    signal output_current, output_next : signed(OPERAND_WIDTH - 1 downto 0) := (others => '0');
    signal output_abs : std_logic_vector(OPERAND_WIDTH - 1 downto 0) := (others => '0');
    signal output_norm : std_logic_vector(7 downto 0) := (others => '0');
    
    signal data_out_next, data_out_current : std_logic_vector(7 downto 0);
 
    type mat_t is array(2 * CIRCLE_RADIUS + CIRCLE_BORDER_WIDTH downto 0) of std_logic_vector(2 * CIRCLE_RADIUS + CIRCLE_BORDER_WIDTH downto 0);
    
    signal circle_values_next, circle_values_current : mat_t := (others => (others => '0'));
    signal circle_result_next, circle_result_current : mat_t := (others => (others => '0'));
    
begin
    
    data_out <= data_out_current;
    
    valid <= '1';
    
    -- Debug output to just generate a single point on the output for testing filters
    genif_diracimpuls_out : if FILTER_TYPE = KERNEL_DIRAC_IMPULS generate
        signal cnt_out : std_logic;
    begin
        inst_dirac_cnt : entity util.counter 
                generic map (
                    RESET_VALUE => (1920 * 1080) / 2,
                    AUTO_RESET => '1'
                ) 
                port map (
                    en             => en,
                    finished       => cnt_out,
                    clk            => clk,
                    rst            => rst
                );
         data_out_next <= (others => cnt_out);   
    end generate;
    
    -------
    --
    -- Generation of the filter outputs, based on selected filter
    --
    -------
    genif_edge_out : if FILTER_TYPE = KERNEL_EDGE_ID generate
        output_abs <= std_logic_vector(output_current) when output_current >= 0 else std_logic_vector((not output_current) + 1);
        output_norm <= (others => '1') when signed(output_abs) > 20 else (others => '0');
        data_out_next <= output_norm(7 downto 0);
    end generate;
    
    genif_smoothing_out : if FILTER_TYPE = KERNEL_SMOOTHING_ID generate
        data_out_next <= std_logic_vector(output_current(7 downto 0)); -- when output(FILTER_SIZE) <= 255 else (others => '1');
    end generate;
    
    genif_circle_out : if FILTER_TYPE = KERNEL_CIRCLE_DETECTION_ID generate
    begin
        data_out_next <= std_logic_vector(output_current(7 downto 0)) when output_current >= 0 and output_current <= 255  else
                         -- If negative set to 255, because that would be an overflow
                         (others => '1') when output_current > 255 or output_current < 0 else 
                         (others => '0');      
    end generate;
    
    -- Register
    P_REG_SEQ : process (clk, rst, en, result_next, output_next, data_out_next)
    begin
        if rst = '0' then
            result_current <= (others => '0');
            data_out_current <= (others => '0');
            output_current <= (others => '0');
            circle_values_current <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if en = '1' then
                result_current <= result_next;
                data_out_current <= data_out_next;
                output_current <= output_next;
                circle_values_current <= circle_values_next;
                circle_result_current <= circle_result_next;
            end if;          
        end if;
    end process;

    -- Adder for summing the output of the rows
    inst_adder : entity util.hierarchicalAdder
        generic map (FILTER_SIZE, OPERAND_WIDTH, OPERAND_WIDTH, true, log2(FILTER_SIZE))
        port map (
            clk => clk,
            rst => rst,
            en => en,
            input => result,
            output => output_logic
        );
    output_next <= signed(output_logic);
    
    -- Generate filter rows
    forgen_rows : for i in 0 to FILTER_SIZE -1 generate
    begin
        ifgen_circle_exception : if (((i mod 3) = 1) or (FILTER_TYPE /= KERNEL_CIRCLE_DETECTION_ID)) generate
            ifgen_buffer : if FILTER_TYPE /= KERNEL_DIRAC_IMPULS generate
            filter_row_inst_i : entity filter.filter_row 
                generic map(FILTER_SIZE, i, FILTER_TYPE)
                port map(
                    clk => clk,
                    en => en,
                    data_in => data_in( (8 + 8 * i) - 1 downto 8 * i),
                    data_out => result(OPERAND_WIDTH * i + OPERAND_WIDTH - 1 downto OPERAND_WIDTH * i)
                );
            end generate;
        end generate;
    end generate;
        
end Behavioral;
