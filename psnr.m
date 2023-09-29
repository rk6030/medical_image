% Clean up.
clc;
close all; 
clear all; 
format long;
workspace;
grayImage= imread('E:\MATLAB\image1.tif');
%grayImage  = rgb2gray(grayImage1);

[rows columns] = size(grayImage);
subplot(2, 2, 1);
imshow(grayImage, []);
title('Original Gray Scale Image');
%set(gcf, 'Position', get(0,'Screensize')); % Maximize figure.

nImage = imread('E:\MATLAB\modified_image.tif');
%nImage=rgb2gray(nImage1);
subplot(2, 2, 2);
imshow(nImage, []);
title('Noisy Image');
squaredErrorImage = (grayImage) - (nImage) .^ 2;

% subplot(2, 2, 3);
% imshow(squaredErrorImage, []);
% title('Squared Error Image');
msee = sum(sum(squaredErrorImage)) / (rows * columns);
%mse=mse1/3;
PSNR = 10 * log10( 256^2 / msee);
 m2 = sprintf('The mean square error is %7.2f.\n    The PSNR = %9.2f', msee, PSNR);
 msgbox(m2);    