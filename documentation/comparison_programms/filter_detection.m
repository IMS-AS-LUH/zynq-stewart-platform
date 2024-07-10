
clear;
img = imread("frame1.jpg");

time_sum = 0;

for i = 1:30
    clear smooth1;
    clear smooth2;
    clear edge;
    clear output;
    clear radii
    tic
    
    smooth1 = imgaussfilt(img, 2);
    smooth2 = imgaussfilt(smooth1, 2);
    
    edge = edge(smooth2, 'sobel');
    
    [output, radii] = imfindcircles(edge, [50 200])
    time = toc
    time_sum = time_sum + time;
end

disp('Final Time');
time_sum / 30

imshow(edge);