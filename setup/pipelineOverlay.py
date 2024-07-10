import pynq
from pynq.mmio import MMIO
from pynq.lib.video import *

from const import *

import PIL.Image

import numpy as np

import cv2

import time

from servo import map_servo_pwm_signal, radian_to_pwm

class PipelineOverlay(pynq.Overlay):
    """ The Base overlay for the Pynq-Z2

    This overlay is designed to detect a ball in an hdmi stream and controll a 
    stewart platform to balance the ball. It exposes the following
    attributes:

    Attributes
    ----------
    video : pynq.lib.video.HDMIWrapper
         HDMI input and output interfaces
    leds : AxiGPIO
         4-bit output GPIO for interacting with the green LEDs LD0-3
    buttons : AxiGPIO
         4-bit input GPIO for interacting with the buttons BTN0-3
    switches : AxiGPIO
         2-bit input GPIO for interacting with the switches SW0 and SW1
    circle_detect: MMIO
        MMIO devide for the circle detect unit
    video_pipeline_switch: MMIO
        MMIO device representing the AXIS switch for the filters in the
        video pipeline
    pwm_controller: MMIO
        MMIO device representing the PWM Controller
    stream_crop: MMIO
        MMIO device representing the Stream Crop Module
    """

    def __init__(self, bitfile, invert_servo_signals=True, **kwargs):
        super().__init__(bitfile, **kwargs)
        if self.is_loaded():
            self.is_video_out_started = False
            self.is_video_in_started  = False
            self.leds = self.leds_gpio.channel1
            self.switches = self.switches_gpio.channel1
            self.buttons = self.btns_gpio.channel1
            self.leds.setlength(4)
            self.switches.setlength(2)
            self.buttons.setlength(4)
            self.leds.setdirection("out")
            self.switches.setdirection("in")
            self.buttons.setdirection("in")
            self.circle_detect = MMIO(AXI_ADDR_CIRCLE_DETECT, length=AXI_LENGTH_CIRCLE_DETECT)
            self.video_pipeline_switch = MMIO(AXI_ADDR_AXIS_SWITCH, length=AXI_LENGTH_AXIS_SWITCH)
            self.pwm_controller = MMIO(AXI_ADDR_PWM_CONTROLLER, length=AXI_LENGTH_PWM_CONTROLLER)
            self.stream_crop = MMIO(AXI_ADDR_STREAM_CROP, length=AXI_LENGTH_STREAM_CROP)
            
            # Setup the servos to a neutral position
            for i in range(6):
                self.pwm_controller_set(i, map_servo_pwm_signal(i, radian_to_pwm(0, i)))
            self.pwm_controller_commit()
            
            # Invert the servo signals. Used if they are inverted again outside of the board
            if invert_servo_signals:
                self.pwm_controller.write(0x1c, 1)
    
    def pwm_controller_set(self, pwm_output, value):
        """
            Sets the pulse width for a given pwm output. Pulse width should
            be given in microseconds.
            For the canges to take effect pwm_controller_commit has to be called.
        """
        self.pwm_controller.write(0x4*(pwm_output + 1), value)
    
    def pwm_controller_get(self, pwm_output):
        """
            Returns the current pulse width for a given pwm output.
        """
        return self.pwm_controller.read(0x4*(pwm_output + 1))
    
    
    def pwm_controller_commit(self):
        """
            Commits the current changes to the pwm values.
        """
        return self.pwm_controller.write(0x0, 1)
    
    def axis_switch_setup_connect(self, input_port, output_port):
        """
            Sets the register in a axis switch to connect an output with a corresponding input.
            axis_switch_commit needs to be called after this for the changes to take effect.
        """
        self.video_pipeline_switch.write(output_port * 4 + 0x40, input_port)
        
        
    def axis_switch_reset(self):
        """
            Resets all connetions of the axis switch controlling the filter for the image
            processing pipeline.
        """
        self.axis_switch_setup_connect(DISABLED, 0)
        self.axis_switch_setup_connect(DISABLED, 1)
        self.axis_switch_setup_connect(DISABLED, 2)
        self.axis_switch_setup_connect(DISABLED, 3)
        self.axis_switch_setup_connect(DISABLED, 4)
        self.axis_switch_setup_connect(DISABLED, 5)
        self.axis_switch_setup_connect(DISABLED, 6)
        self.axis_switch_setup_connect(DISABLED, 7)
        self.axis_switch_setup_connect(DISABLED, 8)
        
    def axis_switch_commit(self):
        """
            Signals the AXIS Switch that changes were done to its configuration.
            This register is self reseting.
        """
        self.video_pipeline_switch.write(0x0, 0x2)
        
    def determine_inital_center(self, reset_state=False):
        """
            Determines the initial center of the image. This is done by setting 
            the output to a static image which is then processed by the full pipeline.
        """
        print("Starting Center Initialization")

        
        self.start_video_out()
        print("Started HDMI")
        
        # Setup AXIS Switch
        self.axis_switch_reset()
        print("Reset Axis Switch")
        
        self.axis_switch_setup_connect(INPUT         , SMOOTHING_1)
        self.axis_switch_setup_connect(SMOOTHING_1   , SMOOTHING_2)
        self.axis_switch_setup_connect(SMOOTHING_2   , SMOOTHING_3)
        self.axis_switch_setup_connect(SMOOTHING_3   , SMOOTHING_4)
        self.axis_switch_setup_connect(SMOOTHING_4   , EDGE)
        self.axis_switch_setup_connect(EDGE          , CROP_PIPELINE)
        self.axis_switch_setup_connect(CROP_PIPELINE , CIRCLE_DETECT)
        self.axis_switch_setup_connect(CIRCLE_DETECT , OUTPUT)
        print("Set Axis Switch")
        
        self.axis_switch_commit()
        print("Commit axis switch")
        
        ## Open Image and covert to numpy array
        img = PIL.Image.open("calibration_circle.jpg")
        a = np.asarray(img)
    
        ## Convert image to grayscale and write to frame memory
        gray = cv2.cvtColor(a, cv2.COLOR_BGR2GRAY)
        outframe = self.video.hdmi_out.newframe()
        outframe[:] = gray
    
        print("Write frame to memory")
        self.video.hdmi_out.writeframe(outframe)
        print("Wrote Frame")
        
        # Some time for the pipeline to process
        time.sleep(5)
        
        # Get the circle position
        self.center_x = self.circle_detect.read(AXI_CIRCLE_DETECT_X_REG)
        self.center_y = self.circle_detect.read(AXI_CIRCLE_DETECT_Y_REG)
        
        print("Got Circle Pos")
        
        # Reset Switch
        if reset_state:
            self.axis_switch_reset()
            self.axis_switch_commit()
            
            self.video.hdmi_out.stop()

        print(f"Finished Center Initialization with X {self.center_x} and Y {self.center_y}")

    def start_video_out(self, mode=VideoMode(width=1920, height=1080, bits_per_pixel=8)):
        """
            Only starts the video output. This should only be used if frames 
            are written from the python code. If video in through hdmi is desired
            use start_video.
            Defaults to grayscale output.
        """
        
        # ensure the pipeline is not running
        if self.is_video_out_started:
            self.video.hdmi_out.stop()
            self.is_video_out_started = False
            
        self.is_video_out_started = True
        # Set the modes
        self.video.hdmi_out.configure(mode)
        
        self.video.hdmi_out.start()
    
    def start_video_in(self):
        if self.is_video_in_started:
            self.video.hdmi_in.stop()
            is_video_in_started = False
        is_video_in_started = True
        
        self.video.hdmi_in.configure(PIXEL_GRAY)
        self.video.hdmi_in.start()
        self.video.hdmi_in.tie(self.video.hdmi_out)
    
    def start_video(self):
        """
            Starts the Video Pipeline.
        """
        # ensure the pipeline is not running
        self.video.hdmi_in.stop()
        self.video.hdmi_out.stop()
        
        # Set the modes
        self.video.hdmi_in.configure()
        self.video.hdmi_out.configure(self.video.hdmi_in.mode)
        
        self.video.hdmi_in.start()
        self.video.hdmi_out.start()
        
        hdmi_in.tie(hdmi_out)
    
    def set_crop_limits(self, x_lower_limit, x_upper_limit, y_lower_limit, y_upper_limit):
        self.stream_crop.write(0x0, x_lower_limit)
        self.stream_crop.write(0x4, x_upper_limit)
        self.stream_crop.write(0x8, y_lower_limit)
        self.stream_crop.write(0xc, y_upper_limit)
  