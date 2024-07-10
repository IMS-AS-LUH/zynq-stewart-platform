----------------------------------------------------------------------------------
-- (C) Institute of Microelectronic Systems
--     Architectures and Systems Group
--     Leibniz University of Hannover
-- 
-- Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
-- Card:    PYNQ Z2
-- Module:  Top Level
-- Details: 
--          This is the top level module of the project.
--          The inputs and signals which are commented represent the
--          unsused connections of the board. If they are needed the 
--          corresponding entries in the constraint file also need to be
--          uncommented.
--          Also the base_wrapper is auto generated based on the base.bd block design.
--          To support new signals the block design needs to be modified. A reference
--          for this is the original PYNQ project.
-- 
-- Author:  bastian.fuhlenriede@stud.uni-hannover.de
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
 port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    IIC_1_scl_io : inout STD_LOGIC;
    IIC_1_sda_io : inout STD_LOGIC;
    -- Vaux13_v_n : in STD_LOGIC;
    -- Vaux13_v_p : in STD_LOGIC;
    -- Vaux15_v_n : in STD_LOGIC;
    -- Vaux15_v_p : in STD_LOGIC;
    -- Vaux1_v_n : in STD_LOGIC;
    -- Vaux1_v_p : in STD_LOGIC;
    -- Vaux5_v_n : in STD_LOGIC;
    -- Vaux5_v_p : in STD_LOGIC;
    -- Vaux6_v_n : in STD_LOGIC;
    -- Vaux6_v_p : in STD_LOGIC;
    -- Vaux9_v_n : in STD_LOGIC;
    -- Vaux9_v_p : in STD_LOGIC;
    -- Vp_Vn_v_n : in STD_LOGIC;
    -- Vp_Vn_v_p : in STD_LOGIC;
    -- arduino_direct_iic_scl_io : inout STD_LOGIC;
    -- arduino_direct_iic_sda_io : inout STD_LOGIC;
    -- arduino_direct_spi_io0_io : inout STD_LOGIC;
    -- arduino_direct_spi_io1_io : inout STD_LOGIC;
    -- arduino_direct_spi_sck_io : inout STD_LOGIC;
    -- arduino_direct_spi_ss_io : inout STD_LOGIC_VECTOR ( 0 to 0 );
    -- arduino_gpio_tri_io : inout STD_LOGIC_VECTOR ( 19 downto 0 );
    --audio_clk_10MHz : out STD_LOGIC;
    --bclk : out STD_LOGIC;
    btns_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    --codec_addr : out STD_LOGIC_VECTOR ( 1 downto 0 );
    hdmi_in_clk_n : in STD_LOGIC;
    hdmi_in_clk_p : in STD_LOGIC;
    hdmi_in_data_n : in STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_in_data_p : in STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_in_ddc_scl_io : inout STD_LOGIC;
    hdmi_in_ddc_sda_io : inout STD_LOGIC;
    hdmi_in_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    hdmi_out_clk_n : out STD_LOGIC;
    hdmi_out_clk_p : out STD_LOGIC;
    hdmi_out_data_n : out STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_out_data_p : out STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_out_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    leds_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    --lrclk : out STD_LOGIC;
    -- pmoda_rpi_gpio_tri_io : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    -- pmodb_gpio_tri_io : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    --rgbleds_6bits_tri_o : out STD_LOGIC_VECTOR ( 5 downto 0 );
    -- rpi_gpio_tri_io : inout STD_LOGIC_VECTOR ( 19 downto 0 );
    rpi_gpio : out STD_LOGIC_VECTOR (19 downto 0);
    --sdata_i : in STD_LOGIC
    --sdata_o : out STD_LOGIC;
    sws_2bits_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end top_level;

architecture Behavioral of top_level is
    
    
component design_base_wrapper is
  port (
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    IIC_1_scl_io : inout STD_LOGIC;
    IIC_1_sda_io : inout STD_LOGIC;
    btns_4bits_tri_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    hdmi_in_clk_n : in STD_LOGIC;
    hdmi_in_clk_p : in STD_LOGIC;
    hdmi_in_data_n : in STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_in_data_p : in STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_in_ddc_scl_io : inout STD_LOGIC;
    hdmi_in_ddc_sda_io : inout STD_LOGIC;
    hdmi_in_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    hdmi_out_clk_n : out STD_LOGIC;
    hdmi_out_clk_p : out STD_LOGIC;
    hdmi_out_data_n : out STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_out_data_p : out STD_LOGIC_VECTOR ( 2 downto 0 );
    hdmi_out_hpd : out STD_LOGIC_VECTOR ( 0 to 0 );
    leds_4bits_tri_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sws_2bits_tri_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rpi_gpio : out STD_LOGIC_VECTOR (19 downto 0)
  );
  end component design_base_wrapper;
begin

design_base_wrapper_inst : component design_base_wrapper
  port map (
    DDR_addr                     =>  DDR_addr                 ,
    DDR_ba                       =>  DDR_ba                   ,
    DDR_cas_n                    =>  DDR_cas_n                ,
    DDR_ck_n                     =>  DDR_ck_n                 ,
    DDR_ck_p                     =>  DDR_ck_p                 ,
    DDR_cke                      =>  DDR_cke                  ,
    DDR_cs_n                     =>  DDR_cs_n                 ,
    DDR_dm                       =>  DDR_dm                   ,
    DDR_dq                       =>  DDR_dq                   ,
    DDR_dqs_n                    =>  DDR_dqs_n                ,
    DDR_dqs_p                    =>  DDR_dqs_p                ,
    DDR_odt                      =>  DDR_odt                  ,
    DDR_ras_n                    =>  DDR_ras_n                ,
    DDR_reset_n                  =>  DDR_reset_n              ,
    DDR_we_n                     =>  DDR_we_n                 ,
    FIXED_IO_ddr_vrn             =>  FIXED_IO_ddr_vrn         ,
    FIXED_IO_ddr_vrp             =>  FIXED_IO_ddr_vrp         ,
    FIXED_IO_mio                 =>  FIXED_IO_mio             ,
    FIXED_IO_ps_clk              =>  FIXED_IO_ps_clk          ,
    FIXED_IO_ps_porb             =>  FIXED_IO_ps_porb         ,
    FIXED_IO_ps_srstb            =>  FIXED_IO_ps_srstb        ,
    IIC_1_scl_io                 =>  IIC_1_scl_io             ,
    IIC_1_sda_io                 =>  IIC_1_sda_io             ,
    -- Vaux13_v_n                   =>  Vaux13_v_n               ,
    -- Vaux13_v_p                   =>  Vaux13_v_p               ,
    -- Vaux15_v_n                   =>  Vaux15_v_n               ,
    -- Vaux15_v_p                   =>  Vaux15_v_p               ,
    -- Vaux1_v_n                    =>  Vaux1_v_n                ,
    -- Vaux1_v_p                    =>  Vaux1_v_p                ,
    -- Vaux5_v_n                    =>  Vaux5_v_n                ,
    -- Vaux5_v_p                    =>  Vaux5_v_p                ,
    -- Vaux6_v_n                    =>  Vaux6_v_n                ,
    -- Vaux6_v_p                    =>  Vaux6_v_p                ,
    -- Vaux9_v_n                    =>  Vaux9_v_n                ,
    -- Vaux9_v_p                    =>  Vaux9_v_p                ,
    -- Vp_Vn_v_n                    =>  Vp_Vn_v_n                ,
    -- Vp_Vn_v_p                    =>  Vp_Vn_v_p                ,
    -- arduino_direct_iic_scl_io    =>  arduino_direct_iic_scl_io,
    -- arduino_direct_iic_sda_io    =>  arduino_direct_iic_sda_io,
    -- arduino_direct_spi_io0_io    =>  arduino_direct_spi_io0_io,
    -- arduino_direct_spi_io1_io    =>  arduino_direct_spi_io1_io,
    -- arduino_direct_spi_sck_io    =>  arduino_direct_spi_sck_io,
    -- arduino_direct_spi_ss_io     =>  arduino_direct_spi_ss_io ,
    -- arduino_gpio_tri_io          =>  arduino_gpio_tri_io      ,
    --audio_clk_10MHz              =>  audio_clk_10MHz          ,
    --bclk                         =>  bclk                     ,
    btns_4bits_tri_i             =>  btns_4bits_tri_i         ,
    --codec_addr                   =>  codec_addr               ,
    hdmi_in_clk_n                =>  hdmi_in_clk_n            ,
    hdmi_in_clk_p                =>  hdmi_in_clk_p            ,
    hdmi_in_data_n               =>  hdmi_in_data_n           ,
    hdmi_in_data_p               =>  hdmi_in_data_p           ,
    hdmi_in_ddc_scl_io           =>  hdmi_in_ddc_scl_io       ,
    hdmi_in_ddc_sda_io           =>  hdmi_in_ddc_sda_io       ,
    hdmi_in_hpd                  =>  hdmi_in_hpd              ,
    hdmi_out_clk_n               =>  hdmi_out_clk_n           ,
    hdmi_out_clk_p               =>  hdmi_out_clk_p           ,
    hdmi_out_data_n              =>  hdmi_out_data_n          ,
    hdmi_out_data_p              =>  hdmi_out_data_p          ,
    hdmi_out_hpd                 =>  hdmi_out_hpd             ,
    leds_4bits_tri_o             =>  leds_4bits_tri_o         ,
    --lrclk                        =>  lrclk                    ,
    -- pmoda_rpi_gpio_tri_io        =>  pmoda_rpi_gpio_tri_io    ,
    -- pmodb_gpio_tri_io            =>  pmodb_gpio_tri_io        ,
    --rgbleds_6bits_tri_o          =>  rgbleds_6bits_tri_o      ,
    rpi_gpio              =>  rpi_gpio          ,
    --sdata_i                      =>  sdata_i                  
    --sdata_o                      =>  sdata_o                  ,
    sws_2bits_tri_i              =>  sws_2bits_tri_i          
  );

end Behavioral;
