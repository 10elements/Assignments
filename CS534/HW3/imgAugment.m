function [ tim ] = imgAugment(H, sim, tim)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[output2, r2] = wrap(H, sim, tim);
gopt2 = rgb2gray(output2);
gmask2 = (gopt2 == 255 | gopt2 == 0);
mask2 = [~gmask2, ~gmask2, ~gmask2];
mask2 = reshape(mask2, size(tim));
tim(mask2) = output2(mask2);
end

