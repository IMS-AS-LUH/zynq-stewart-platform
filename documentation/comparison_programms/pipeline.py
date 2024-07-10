import os
os.environ["OPENCV_LOG_LEVEL"]="SILENT"

import PIL.Image
import cv2
import numpy as np

import time



image_read = cv2.imread("calibration_circle.jpg")

print(image_read)

image = cv2.cvtColor(image_read, cv2.COLOR_RGB2GRAY)

time_sum = 0
N=1000
for i in range(N):
    time1 = time.time()
    smooth1 = cv2.GaussianBlur(image, (9,9),0)

    img_sobelx = cv2.Sobel(smooth1,cv2.CV_8U,1,0,ksize=3)
    img_sobely = cv2.Sobel(smooth1,cv2.CV_8U,0,1,ksize=3)
    img_sobel = img_sobelx + img_sobely
    
    output = cv2.HoughCircles(img_sobel, cv2.HOUGH_GRADIENT, 1, 1)
    
    time2 = time.time()
    time_dif = time2 - time1
    print(f"{i} : {time_dif} - {output}")
    time_sum = time_sum + time_dif
    
print(time_sum/N)

# 0.05836116147041321
#cv2.imwrite("smooth1.jpg", smooth1)
#cv2.imwrite("sobel_x.jpg", img_sobelx)
#cv2.imwrite("sobel_y.jpg", img_sobely)
#cv2.imwrite("img_sobel.jpg", img_sobel)