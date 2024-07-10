#
# This file contains some functions used for controlling the servos.
# For this a mapping with servo_limits is needed as they tend to not be perfect
# and differ slightly. To ensure correct positioning this needs to accounted for.
#

import numpy as np

servo_limits = [
    [520, 1850],
    [580, 1940],
    [620, 1950],
    [570, 1920],
    [470, 1850],
    [470, 1840],
]


servo_reorder_map = {
    0 : 0,
    1 : 2,
    2 : 5,
    3 : 4,
    4 : 3,
    5 : 1,
}

def reorder_servo_signals(angles, mapping=servo_reorder_map):
    """
        This functions reorders the servo angles from a list
        which assumes they are sequentially numbered to the
        actual order.
    """
    reordered_angles = [x for x in range(6) ]
    for k,v in mapping.items():
        reordered_angles[v] = angles[k]
    
    return reordered_angles

def map_servo_pwm_signal(servo, pwm, mapping_table=servo_limits, revers_servo =  [2,4,1]):
    """
        The servos either point the left or the right and based 
        on that the value need stay the same or be inverted.
    """
    if servo in revers_servo:
        return mapping_table[servo][1] - (pwm - mapping_table[servo][0])
    else:
        return pwm
    
def radian_to_pwm(angle, servo, mapping_table=servo_limits):
    """
        Map the radian to a pwm signal. For this the radian range 
        of -pi/2 to pi/2 needs to be mapped onto the pwm range.
        This is done by first normalizing the pwm range to 0 to 1.
        This new range is then converted into the pwm range.
        Then the offset is applied.
    """
    # Bring the angle to just a positive range and than 
    # normalize it to [1,0]
    normalized_angle = (angle + np.pi/2)/ np.pi
    # Mapping to pwm range and applying offset
    mapped_pwm = normalized_angle * (mapping_table[servo][1] - mapping_table[servo][0])
    offset_pwm = mapped_pwm + mapping_table[servo][0]
    return int(offset_pwm)

def pos_to_radian(pos, input_type=0, limits=[int(1920/2), int(1080)], radian_range=0.15):
    """
        Map the detected position value to the angle the
        platform should be in. This depends on the direction
        of the angle. The default maximum in the directions is 
        determined by half their length. This assumes
        that the position is normalized to the center.
        input_type
            0 => x
            1 => y
    """
    normalized_pos = pos/limits[input_type]
    angle = normalized_pos * radian_range
    
    return angle