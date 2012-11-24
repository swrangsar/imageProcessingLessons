close all; clear all;

cd ~/Desktop/imageProcessingLessons/

inputImage = imread('sunflower.jpeg');
inputImageGray = double(rgb2gray(inputImage));
maxGrayLevel = 255;

cumulativeDensity = zeros(maxGrayLevel + 1, 1);
totalDensity = numel(inputImageGray);

for k = 0:maxGrayLevel
    mask = inputImageGray <= k;
    cumulativeDensity(k + 1) = sum(mask(:)) / totalDensity;
end

transformedImage = cumulativeDensity(inputImageGray + 1) * maxGrayLevel;
transformedImage = round(transformedImage);

figure('Name', 'Original'); imshow(abs(inputImageGray), []);
figure('Name', 'Histogram equalized'); imshow(abs(transformedImage), []);
figure('Name', 'Histogram'); hist(transformedImage, 256);