close all; clear all;

cd ~/Desktop/imageProcessingLessons/

inputImage = imread('sunflower.jpeg');
inputImageGray = double(rgb2gray(inputImage));

% % log transform the image

maxGrayLevel = 255;
r1 = 30;
s1 = 0;
r2 = maxGrayLevel - r1;
s2 = maxGrayLevel - s1;

% % operation on lower values
lowerSlope = s1/r1;
lowerMask = (inputImageGray < r1);
lowerMaskedImage = inputImageGray .* lowerMask;
lowerPart = lowerMaskedImage * lowerSlope;

% % middle part
middleSlope = (s2 - s1) / (r2 - r1 + eps);
middleMask = (inputImageGray >= r1 & inputImageGray <= r2);
middleMaskedImage = middleMask .* inputImageGray;
middlePart = middleMaskedImage * middleSlope;
middlePart = (middlePart + s1) .* middleMask;

% % upper part
upperSlope = (maxGrayLevel - s2) / (maxGrayLevel - r2);
upperMask = inputImageGray > r2;
upperMaskedImage = upperMask .* inputImageGray;
upperPart = upperMaskedImage * upperSlope;
upperPart = (upperPart + s2) .* upperMask;

contrastStretchedImage = uint8(lowerPart + middlePart + upperPart);

figure('Name', 'Original Image'); imshow(abs(inputImageGray), []);
figure('Name', 'Contrast Stretched Image'); imshow(abs(contrastStretchedImage), []);
figure('Name', 'Histogram of original image'); hist(inputImageGray, 256);
figure('Name', 'Histogram of contrast stretched image'); hist(double(contrastStretchedImage), 256);