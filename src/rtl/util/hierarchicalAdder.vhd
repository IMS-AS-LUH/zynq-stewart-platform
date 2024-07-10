----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Hierarchical Adder
-- Details: 
--          This module is a pipelined hierarchical adder. It efficiently
--          adds a given number of operands of N in log(N) cylces. Every
--          layer the bit width is increased by one, which is done to prevent
--          redudant logic in the design that might be caused if the
--          final bit length is used from the start.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

library util;
use util.util_pkg.all;


entity hierarchicalAdder is
    Generic(
        OPERATOR_NUM    : integer;
        OPERATOR_WIDTH  : integer;
        OUTPUT_WIDTH    : integer;
        SIGNED_OP       : boolean;
        MIN_DELAY       : integer
    );
    Port ( 
        clk             : in std_logic;
        rst             : in std_logic;
        en              : in std_logic;
        input           : in std_logic_vector(OPERATOR_NUM * OPERATOR_WIDTH - 1 downto 0);
        output          : out std_logic_vector(OUTPUT_WIDTH - 1 downto 0)
    );
end hierarchicalAdder;

architecture Behavioral of hierarchicalAdder is
    -- Column are normalized to power of twos
    type sum_row_t is array(OPERATOR_NUM - 1 downto 0) of std_logic_vector((OPERATOR_WIDTH + log2(OPERATOR_NUM)) - 1 downto 0);
    type sum_mat_t is array(MIN_DELAY downto 0) of sum_row_t;
    
    
    signal output_current, output_next : std_logic_vector(OUTPUT_WIDTH - 1 downto 0) := (others => '0');
    signal sum_result_current, sum_result_next : sum_mat_t := (others => (others => (others => '0')));
    
    
    function cnt_row_values(row : integer) return integer is 
    begin
        return integer(ceil(real(OPERATOR_NUM) / real(pow2(row))));
    end function;
    
begin

    -- Setup the input layer for the adder. Here the inputs are immediatly connected to the input adders rather than beeing stored in a register
    genfor_adder_input : for i in 0 to OPERATOR_NUM - 1 generate
        sum_result_current(0)(i)(OPERATOR_WIDTH - 1 downto 0) <= input((OPERATOR_WIDTH * (i+1) - 1) downto OPERATOR_WIDTH * i );
    end generate;

    genif_signed : if SIGNED_OP = true generate 
         -- Generate the adders
        genfor_adder : for i in 1 to log2(OPERATOR_NUM) generate 
            -- Generate adders that have all of their input. The minus mod 2 handles the case of an uneven # of inputs
            genfor_row : for j in 0 to (cnt_row_values(i) - 1 - (cnt_row_values(i - 1) mod 2)) generate
                    sum_result_next(i)(j)((OPERATOR_WIDTH + i) - 1 downto 0) <= std_logic_vector(
                                          resize(signed(sum_result_current(i - 1)(2 * j    )(OPERATOR_WIDTH + i - 2 downto 0)), OPERATOR_WIDTH + i)
                                        + resize(signed(sum_result_current(i - 1)(2 * j + 1)(OPERATOR_WIDTH + i - 2 downto 0)), OPERATOR_WIDTH + i)
                                    );
            end generate;
            
            -- If the inputs are uneven the last value has to be passedthrough to the next stage
            genif_passthrough : if (cnt_row_values(i - 1) mod 2 = 1) generate 
                   sum_result_next(i)
                   (cnt_row_values(i) - 1)
                   ((OPERATOR_WIDTH + i) - 1 downto 0) <= std_logic_vector(resize(
                                            signed(sum_result_current(i - 1)(cnt_row_values(i - 1) - 1)(OPERATOR_WIDTH - 1 downto 0)), 
                                            OPERATOR_WIDTH + i
                                        ));
            end generate;
        end generate;
    
        genif_delay : if MIN_DELAY > log2(OPERATOR_NUM) generate 
            genfor_delay : for i in log2(OPERATOR_NUM) + 1 to MIN_DELAY generate
                sum_result_next(i)(0)(OPERATOR_WIDTH + log2(OPERATOR_NUM) - 1 downto 0) <= sum_result_current(i - 1)(0)(OPERATOR_WIDTH + log2(OPERATOR_NUM) - 1 downto 0);
            end generate;
        end generate;
        

        output_next <= std_logic_vector(resize(signed(sum_result_current(MIN_DELAY)(0)(OPERATOR_WIDTH + log2(OPERATOR_NUM) - 1 downto 0)), output_next'length));

    
        assert MIN_DELAY >= log2(OPERATOR_NUM) report "MIN_DELAY can't be shorter thant log2(OPERATOR_NUM)" severity error; 
    
    end generate;
        
    genif_unsigned : if SIGNED_OP = false generate 
        -- Generate the adders
        genfor_adder : for i in 1 to log2(OPERATOR_NUM) generate 
            -- Generate adders that have all of their input. The minus mod 2 handles the case of an uneven # of inputs
            genfor_row : for j in 0 to (cnt_row_values(i) - 1 - (cnt_row_values(i - 1) mod 2)) generate
                    sum_result_next(i)(j)((OPERATOR_WIDTH + i) - 1 downto 0) <= std_logic_vector(
                                          resize(unsigned(sum_result_current(i - 1)(2 * j    )(OPERATOR_WIDTH + i - 2 downto 0)), OPERATOR_WIDTH + i)
                                        + resize(unsigned(sum_result_current(i - 1)(2 * j + 1)(OPERATOR_WIDTH + i - 2 downto 0)), OPERATOR_WIDTH + i)
                                    );
            end generate;
            
            -- If the inputs are uneven the last value has to be passedthrough to the next stage
            genif_passthrough : if (cnt_row_values(i - 1) mod 2 = 1) generate 
                   sum_result_next(i)(cnt_row_values(i) - 1)((OPERATOR_WIDTH + i) - 1 downto 0) <= std_logic_vector(resize(
                                            unsigned(sum_result_current(i - 1)(cnt_row_values(i - 1) - 1)(OPERATOR_WIDTH - 1 downto 0)), 
                                            OPERATOR_WIDTH + i
                                        ));
            end generate;
        end generate;
    
        genif_delay : if MIN_DELAY > log2(OPERATOR_NUM) generate 
            genfor_delay : for k in log2(OPERATOR_NUM) + 1 to MIN_DELAY generate
                sum_result_next(k)(0) <= sum_result_current(k - 1)(0);
            end generate;
        end generate;
    
        output_next <= std_logic_vector(resize(unsigned(sum_result_current(MIN_DELAY)(0)(OPERATOR_WIDTH + log2(OPERATOR_NUM) - 1 downto 0)), output_next'length));
    
        assert MIN_DELAY >= log2(OPERATOR_NUM) report "MIN_DELAY can't be shorter thant log2(OPERATOR_NUM)" severity error; 

    
    end generate;

    proc_registers : process(clk, rst, en, sum_result_next)
    begin
        if rst = '0' then
            sum_result_current(MIN_DELAY downto 1) <= (others => (others => (others => '0')));
            output_current <= (others => '0');
        else
            if rising_edge(clk) then
                if en = '1' then
                    sum_result_current(MIN_DELAY downto 1) <= sum_result_next(MIN_DELAY downto 1);
                    output_current <= output_next;            
                end if;
            end if;
        end if;
    end process;

    output <= std_logic_vector(output_current);

end Behavioral;
