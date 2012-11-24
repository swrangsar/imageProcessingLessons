close all; clear all;

cd ~/Desktop/imageProcessingLessons/

inputImage = imread('sunflower.jpeg');
inputImageGray = double(rgb2gray(inputImage));

% % log transform the image

gammaValue = 0.6;
scalingConstant = 1.0;
powerLawImage = scalingConstant * (inputImageGray .^ gammaValue);
figure('Name', 'Original Image'); imshow(abs(inputImageGray), []);
figure('Name', 'Power Law Image'); imshow(abs(powerLawImage), []);