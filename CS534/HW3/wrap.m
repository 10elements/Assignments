function [ output, r ] = wrap( H, simg, dimg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
mPoints = [1, size(simg, 1); 1, 1; size(simg, 2), 1; size(simg, 2), size(simg, 1)];
orgCrdnts = [0, 0, 0.27, 0.27; 0, 0.21, 0.21, 0; 1, 1, 1, 1];
fPoints = H * orgCrdnts;
fPoints = [(fPoints(1,:) ./ fPoints(3,:))', (fPoints(2, :) ./ fPoints(3, :))'];
transf = fitgeotrans(mPoints, fPoints, 'Projective');
ref = imref2d([size(dimg, 1), size(dimg, 2)]);
[output, r] = imwarp(simg, transf, 'OutputView', ref);
end

