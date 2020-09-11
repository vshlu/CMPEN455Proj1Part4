%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Purpose:
%   Change the spatial resolution of a 512x512 image into an image
%   with a spatial resolution of 256x256 with a 6bits/pixel gray-scale
%   resolution.
%
%Returned Results:
%   A .gif file containing the new image.
%
%Processing Flow:
%   1. Initialize an empty array to store the image in
%   2. Populate the array with every other x and y pixel from the original
%       image while using a 6 bits/pixelgray-scale resolution.
%
%Restrictions/Notes: 
%   This program is made specifically for part 4 of CMPEN 455 Project 1.
%
%The following functions are called:
%   None
%
%Author:    Vladimir Shluharchuk
%Date:      9/10/20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
close all
f = imread('walkbridge.tif');
f = f(:,:,1);
[r c]=size(f);
t=[];
temp=1;
ctr=1;
%Grab every other pixel in order to shrink the image by half
for i=1:2:r
    for j=1:2:c
        t(temp,ctr)=4 * floor(double(f(i,j))/4);
        ctr=ctr+1;
    end
    temp=temp+1;
    ctr=1;
end
resized_img=uint8(t);
%Show original image along with original resolution
%figure;
%imshow(f);
%truesize
%Show resized image along with new resolution
%figure;
%imshow(resized_img);
%truesize

%Uncomment this line to see information about the new image.
%imtool(resized_img);

%Save new image
imwrite(resized_img,"resized_img.gif");

