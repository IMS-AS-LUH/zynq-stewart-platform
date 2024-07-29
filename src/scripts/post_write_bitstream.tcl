# --------------------------------------------------------------------------------
#  (C) Institute of Microelectronic Systems
#      Architectures and Systems Group
#      Leibniz University of Hannover
#  
#  Project: FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq
#  Card:    PYNQ Z2
#  File:  Post Write Bitstream
#  Details: 
#           This script copies the results of the implementation from the 
# 			result folders into a more convenient location. It should be 
#			configured to run after the bitstream operation.
#  
#  Author:  bastian.fuhlenriede@stud.uni-hannover.de
# --------------------------------------------------------------------------------


# This should put the output order besides the vivado project folder
set RELATIVE_PATH {../../..}
set PROJECT_NAME [current_project]

if {[file exists $RELATIVE_PATH/output] == 0} {
	file mkdir $RELATIVE_PATH/output
}

if {[file exists $RELATIVE_PATH/output/top_level.bit] == 1} {
	file delete $RELATIVE_PATH/output/top_level.bit
}

if {[file exists $RELATIVE_PATH/output/top_level.hwh] == 1} {
	file delete $RELATIVE_PATH/output/top_level.hwh
}

#file copy top_level.bit $RELATIVE_PATH/output/top_level.bit
#file copy $RELATIVE_PATH/bd_base/design_base/hw_handoff/design_base.hwh $RELATIVE_PATH/output/top_level.hwh