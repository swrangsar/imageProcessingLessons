close all; clear all;

cd ~/Desktop/imageProcessingLessons/

inputImage = imread('sunflower.jpeg');
inputImageGray = rgb2gray(inputImage);

% % invert the image
maxGrayValue = 255;
inverseImage = maxGrayValue - inputImageGray;
figure('Name', 'Original Image'); imshow(abs(inputImageGray), []);
figure('Name', 'Inverse Image'); imshow(abs(inverseImage), []);