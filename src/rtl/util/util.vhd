----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Utils
-- Details: 
--          This file contains various utility function used across the design.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

package util_pkg is
    function log2 (depth : in natural) return integer;
    function pow2 (power : in natural) return integer;
    function max (a, b : in integer) return integer;

    -- Unused, as the circle filter was removed
    constant CIRCLE_RADIUS : natural := 50;
    constant CIRCLE_BORDER_WIDTH : natural := 20;

    -- Delays of the TUSER signal in each respective Filter unit
    type delays_t is array(0 to 3) of integer;

    type coff_row_t is array(2 downto 0) of integer;
    type coff_mat_t is array(2 downto 0) of coff_row_t;
    
    -- Kernel cooeffiecients
    constant KERNEL_SMOOTH : coff_mat_t := ((4,3,4), (3,2,3), (4,3,4));
    constant KERNEL_EDGE_X : coff_mat_t := ((-1,0,1), (-1,0,1), (-1,0,1));
    constant KERNEL_EDGE_Y : coff_mat_t := ((-1,-1,-1), (0,0,0), (1,1,1));
    
    -- Delays of the TUSER signal in each respective Filter unit
    -- This log delay comes from the adders used in side the filer. 
    -- The 
    constant KERNEL_DELAYS : delays_t := (
        log2(3) + 1 + 9,
        log2(3) + 1 + 9,
        log2(CIRCLE_RADIUS * 2 + CIRCLE_BORDER_WIDTH) + 1 + 132 * 132, -- 
        1);
        
    -- IDs of the Filters    
    CONSTANT KERNEL_SMOOTHING_ID : integer := 0;
    CONSTANT KERNEL_EDGE_ID : integer := 1;
    CONSTANT KERNEL_CIRCLE_DETECTION_ID : integer := 2;
    CONSTANT KERNEL_DIRAC_IMPULS: integer := 3;
    
end util_pkg;

package body util_pkg is

    -- log2 with celling output
    function log2( depth : natural) return integer is
        variable temp    : real := real(depth);
        variable ret_val : integer := 0;
    begin
        while temp > real(1) loop
            ret_val := ret_val + 1;
            temp    := temp / 2.0;
        end loop;

        -- cell function
        if temp > real(1) then
            return ret_val + 1;
        else 
            return ret_val;
        end if;
    end function;

    function pow2(power : natural) return integer is
        variable temp : integer := power;
        variable ret_val : integer := 1;
    begin
        while temp > 0 loop
            ret_val := ret_val * 2;
            temp := temp - 1;
        end loop;
        
        return ret_val;
    end function;    
    
    function max (a, b : in integer) return integer is 
    begin
        if a > b then 
            return a;
        else
            return b;
        end if;
    end function;
    
end package body util_pkg;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity util is
end util;

architecture Behavioral of util is

begin


end Behavioral;
