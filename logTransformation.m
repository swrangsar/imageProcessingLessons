close all; clear all;

cd ~/Desktop/imageProcessingLessons/

inputImage = imread('sunflower.jpeg');
inputImageGray = double(rgb2gray(inputImage));

% % log transform the image
scalingConstant = 2.0;
logImage = scalingConstant * log(1 + inputImageGray);
figure('Name', 'Original Image'); imshow(abs(inputImageGray), []);
figure('Name', 'Log Image'); imshow(abs(logImage), []);