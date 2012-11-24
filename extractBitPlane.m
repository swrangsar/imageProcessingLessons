close all; clear all;

cd ~/Desktop/imageProcessingLessons/

inputImage = imread('sunflower.jpeg');
inputImageGray = double(rgb2gray(inputImage));
maxGrayLevel = 255;

bitPlane = 6;
bitLevel = 2 ^ bitPlane;
nextBitLevel = 2 ^ (bitPlane + 1);

bitPlaneImage = mod(inputImageGray, nextBitLevel);
bitPlaneImage = (bitPlaneImage >= bitLevel) * maxGrayLevel;


figure('Name', 'Original Image'); imshow(abs(inputImageGray), []);
figure('Name', 'Bit Plane Image'); imshow(abs(bitPlaneImage), []);
figure('Name', 'Histogram of the image'); hist(inputImageGray, 256);