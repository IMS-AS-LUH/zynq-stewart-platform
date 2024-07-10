--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
--Date        : Sat Jun  8 22:50:03 2024
--Host        : Baeshen-PC running 64-bit major release  (build 9200)
--Command     : generate_target local_sim_wrapper.bd
--Design      : local_sim_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity local_sim_wrapper is
  port (
    axis_clk : in STD_LOGIC;
    axis_rst : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    switch_mode : in STD_LOGIC
  );
end local_sim_wrapper;

architecture STRUCTURE of local_sim_wrapper is
  component local_sim is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    axis_clk : in STD_LOGIC;
    axis_rst : in STD_LOGIC;
    switch_mode : in STD_LOGIC
  );
  end component local_sim;
begin
local_sim_i: component local_sim
     port map (
      axis_clk => axis_clk,
      axis_rst => axis_rst,
      clk => clk,
      rst => rst,
      switch_mode => switch_mode
    );
end STRUCTURE;
