# FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq

This project is a technology showcase of an image-tracking system implemented into the video pipeline of a ZYNQ Z2. The design processes every frame of an incoming HDMI stream by extracting the position of a ball from it. This is done entirely using programmable logic. The position is then read from the design and used to balance the ball on a Stewart Platform by calculating the reverse kinematic in Python.

This project was submitted to the [AMDs Open Hardware Contest](https://www.openhw.eu/).

For an explanation of the design see `documentation/documentation.pdf`.


| Team Number | AOHW-239 |
| :-- | :-- |
| Project Name | FPGA accelerated Stewart Platform Stabilization using Xilinx Zynq |
| Repo | [Link](https://github.com/IMS-AS-LUH/zynq-stewart-platform
)|
| Showcase Video |[Link](https://youtu.be/tm8HUrqKewo) |
| Participant | Bastian Fuhlenriede (bastian.fuhlenriede@stud.uni-hannover.de) |
| Supervisor | Nils Stanislawski, M.Sc (nils.stanislawski@ims.uni-hannover.de) |
| Board Used| PYNQ Z2 |
| Software Version | Vivado 2022.2 |

# Dependencies
| Package | Version |
| :-- | :-- |
| `simple_pid`|>= 2.0.0 |
|  `numpy`|>= 1.21.5 |
| `opencv-pyton` |>= 4.5.4 |
| `pynq` |>= 3.0.1 |

# File Structure
```
/
├── documentation/              # Documentation folder
│   ├── comparison_programms
│   │   ├── calibration_circle.jpg      # Example frame for the testing
│   │   ├── filter_detectino.m          # Matlap script for simulating the pipeline
│   │   └── pipeline.py                 # Reference application
│   ├── pinout.pdf                  # Pin out for the raspberry pi connector, pdf
│   ├── pinout.xlsx                 # Pin out for the raspberry pi connector, excel table
│   └── documentation.pdf           # Documentation of the implemented pipeline design
├── setup/                      # Folder containing all files needed to quickly setup the design
│   ├── bit_files/                  # Latest version of build bit and hwh files
│   ├── calibration_circle.jpg      # Image used to calibrate the center of the final output
│   ├── const.py                    # Python file containing constants used to control the system
│   ├── pipelineOverlay.py          # Python file for the Overlay class for the pipeline
│   ├── Servo Setup.ipynb           # Jupyter script used to configure the servors
│   ├── servo.py                    # Python file containing the functions for calculating the servo positions
│   ├── stewart_controller.py       # Python file containing the logic to calculate the reverse kinematic
│   └── VideoPipelineSetup.ipynb    # Main Jupyter script used to run the system
├── src/                        # Various source files for the project
│   ├── bd/                         # Vivado Block design files
│   │   ├── base/                       # Design block design file
│   │   │   ├── hdl/                        
│   │   │   │   └── design_base_wrapper.vhd     # Pre generated wrapper file for bd
│   │   │   └── design_base.bd              # Block design file for the design
│   │   └── sim/                        # Simulation block design file
│   │       ├── hdl/                        
│   │       │   └── design_base_wrapper.vhd     # Pre generated wrapper file for bd
│   │       └── local_sim.bd              # Block design file for simulation
│   ├── ip/                         # IP Cores from the PYNQ Project
│   ├── python/                     # Python files used for running the system
│   │   ├── const.py                    # Python file containing constants used to control the system
│   │   ├── Servo Setup.ipynb           # Jupyter script used to configure the servors
│   │   ├── servo.py                    # Python file containing the functions for calculating the servo positions
│   │   ├── stewart_controller.py       # Python file containing the logic to calculate the reverse kinematic
│   │   └── VideoPipelineSetup.ipynb    # Main Jupyter script used to run the system
│   ├── rtl/                        # VHDL source files for the project                  
│   │   ├── filter/                     # Source Files for the filters
│   │   │   ├── filter_axis.vhd  
│   │   │   ├── filter_kernel.vhd
│   │   │   ├── filter_row.vhd
│   │   │   └── filter_slice.vhd
│   │   ├── memory/                     # Source Files for the memory modules
│   │   │   ├── ram_column.vhd  
│   │   │   ├── ram_row.vhd
│   │   │   └── ram_shift_register.vhdl
│   │   ├── servo/                      # Source Files for generating the pwm signals for the servos
│   │   │   ├── pulse_generator.vhdl
│   │   │   └── pwm_generator.vhdl
│   │   ├── stream_processing/          # Source Files for modules which work on a Video AXI-Stream
│   │   │   ├── crop_stream.vhd
│   │   │   └── histogram_projection.vhd
│   │   ├── top_level/                  # Top level source file
│   │   │   └── top_level.vhd
│   │   └── util                        # Utility modules
│   │       ├── counter.vhd
│   │       ├── hierarchicalAdder.vhd
│   │       └── util.vhd
│   ├── scripts/                        # TCL scripts for Vivado
│   │   └── post_write_bitstream.tcl        # TCL script to copy output files post write_bitstream
│   ├── sim/                            # Simulation sources
│   │   └── tb.sv                           # System Verilog testbench used for testing the filters
│   └── vivado/                         # Vivado project relevant files
│       ├── constraints/                    # Constraint files
│       │   └── base.xdc                        # Constraint file for the vivado project
│       ├── output/                         # Output folder for the design
│       └── create_project.tcl              # TCL script to generate the vivado project
├── .gitignore                      # gitignore file for the project
├── README.md                       # Read me file explaining the project
└── vhdl_ls.toml                    # toml file used for specifing the libraries for the extension "VHDL LS" in VSCode
```

# Build Design
> Tested using Vivado Version 2022.2

The first step in building the design is to generate the Vivado project. To do this, first start Vivado and, in the TCL console, navigate to `src/vivado`. To display your current path, use `pwd`, also on Linux, and change the directory using `cd [FOLDER]`. To execute commands of a shell or command line, use `exec [COMMAND]`. This can be used to list the current folder's contents. Once in the correct folder, use:
```
source ./create_project.tcl
```

This generates all relevant project files and should automatically open the project. The project can then be built by clicking `Generate Bitstream` on the left side of the window. The output files will then be in `src/vivado/output`.

# Setup System

> Requirements: 
> - PYNQ Z2 Board with the pynq linux image 
> - Servo-based Stewart Platform 
> - A Camera, cost effective actions cam have not worked, and a Raspberry Pi Cam was used to test the system


This section describes the setup process from the side of the board. For instructions on building a Stewart Platform, follow, for example, this [guide](https://www.instructables.com/Stewart-Platform/).

### Step 1
The first step is to set up the files on the PYNQ Board. This is done by copying all files from the `setup/` directory into Jupyter's main folder at `/home/xilinx/jupyter_notebooks`. This is easily done via the web interface. This already includes all the Python scripts and prebuilt bitfiles necessary.

Alternatively, the bit files could be built individually and be placed into a folder named `bit_files`. They should be labeled `top_level.bit` and `top_level.hwh`. The contents of `src/python` also need to be copied into the same folder.

### Step 2
To connect the board to the platform, follow the pins' allocations in the section `Servo Allocation`. The pair of adjacent servos are 0-2,  1-3, and 4-5. In a circular clockwise order, 0-2-5-4-3-2.

### Step 3
Use the `Servo Setup.ipynb` script to calibrate the servos. This offers a slider for each servo. Determine the value for -90° and 90° for each servo and set them in `servo.py::servo_limits`.

#### Step 4
Finally, execute all steps inside of `VideoPipelineSetup.ipynb`. This loads the bit file and configures the system. If no video input or output is connected at this point, it will probably hang and crash at some point. 

If the script is running, the design can then be controlled via the four buttons and two switches at the front of the board. The buttons turn on and off the individual filters. The switches add additional smoothing filters. For this, they work like a binary counter, so three additional smoothing stages can be added. They are only active if the smoothing is turned on, and one stage will always be active. From left to right, the buttons turn on the ball detection, the edge filter, the smoothing filter, and the image crop.

# Servo Allocation
The board outputs the generated PWM signals over the RPI-Connecter interface. It is located at the edge of the board between the HDMI connectors. The PWM outputs are connected as such:

| PWM Output  | Physical Pin | AXI Address  |
| ------      | ------       | -|
|   0         |  33          | 0x4  |
|   1         |  36          | 0x8  |
|   2         |  35          | 0xc  |
|   3         |  38          | 0x10  |
|   4         |  40          | 0x14  |
|   5         |  37          | 0x18  |

Also, see `documentation/pinout.[pdf|xlxs]` for the physical layout of the connector, including voltage and ground pins.

# Servo Interface
The values for the PWM signals for the servos are set through the AXI bus. The control unit is located at the address `0x4002_0000` and consists of 8 Registers. The changes to the register do not take effect immediately and need to be committed by writing a non-zero value into the commit register at offset `0x0`. This register is self-resetting.
 
| Reg         | Offset       | Function |
| ------      | ------       | ------                                |
|   0         |  0x0	     |  Indicates the commit of the changes  |
|   1         |  0x4	     |  PWM 0                                |
|   2         |  0x8	     |  PWM 1                                |
|   3         |  0xc	     |  PWM 2                                |
|   4         |  0x10        |  PWM 3                                |
|   5         |  0x14        |  PWM 4                                |
|   6         |  0x18        |  PWM 5                                |
|   7         |  0x1c        |  Not used                             |


# Pipeline Control Interface

The filter modules are not connected in a specific order. Instead, they are connected to an AXI switch that is used to set the order freely. It is located at address `0x4000_0000` and is configured by connecting the output ports to the inputs. For this, every output has its own register at a fixed offset to which the connected input number should be written. The table below shows the offset corresponding to the individual filters. For example, to route the edge detection output to the histogram projection input, one would write `2` into the register at offset `0x4c`. The changes to these registers do not take effect immediately. They need to be committed by writing a `0x2` into the register at offset `0x0`. More details can be found in the documentation of the AXI4-Stream Switch.

Every filter input and output is connected to the same input and output port index. For example, the edge detection output is connected to master port 2, and its input is connected to slave port 2. The first input port and output port represent the HDMI input and output.

| Filter                     | Connected Switch Port    | Reg Offset |
| ------                     | ------                   | ------     |
|   HDMI INPUT/OUTPUT        |  0                       |  0x40      |
|   Smoothing		         |  1                       |  0x44      |
|   Edge Detection	         |  2                       |  0x48      |
|   Histogram Projection     |  3                       |  0x4c      |
|   Smoothing		         |  4                       |  0x50      |
|   Smoothing		         |  5                       |  0x54      |
|   Smoothing		         |  6                       |  0x58      |
|   Single Bit Debug output		         |  7                       |  0x5c      |
|   Crop Stream		         |  8                       |  0x60      |


# Ball Detection Interface
The detected ball position can be accessed through the AXI bus. The module is located at address 0x4001_0000. The value for the x coordinate is located at offset 0x0, and the y coordinate is located at offset 0x4.

# Stream Image Crop Interface
The design contains a module that can be used to crop the frames inside the stream. It is located at address `0x4003_0000`. It is configured via four registers that specify the image range. Everything outside of the ranges is set to zero. The data is not removed from the frame because this will make them undisplayable via the HDMI Out, which is not desired.

| Reg                    | Offset    | 
| ------                 | ------                   | 
|   X Lower Limit        |  0x0                      | 
|   X Upper Limit        |  0x4                      | 
|   Y Lower Limit        |  0x8                     | 
|   Y Upper Limit        |  0xc                     | 

# References

https://www.instructables.com/Stewart-Platform/, gives instructions on how to build a Stewart Platform using servos.


# Potential Problems

## The output image contains artifacts at the edges
This happens because the pipeline is never emptied, as such the preceding frame can affect the edge of the following one. However, this should not lead to any problems. If it does, they can be removed using the crop module.

## The Kernel crashed
This can happen sometimes, mainly because the HDMI has not yet been connected. A rerun of the script should fix this, but see `The Image is shifted along the x-axis` for the side effect of reloading the overlay.

## The image is shifted along the x-axis
The output image can be shifted along the x-axis if the overlay has been loaded previously and is loaded again. It is unclear why this happens, and it is fixed by restarting the board.


## The script has been running for a long time.
The time it takes to detect the HDMI source can vary quite a lot between sources. If the Source can't be detected, it should eventually time out. See the `The configuration failed` section.

## The configuration failed
The configuration of the input HDMI module may fail because of the particular device used even if it is connected. The detection section of the design can't identify some devices. For example, some action cams can not be detected. However, the script will not immediately fail if it can't detect a connection. Instead, it will only fail after it hits its timeout delay. A way around this is to connect the cam over USB to a laptop and then connect the laptop to the board and just open an application on the laptop, for example, OBS, that shows the camera feed.
