function [ rows ] = transfer( orgCoordinate, cmCoordinate )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
zeroVec = zeros([1,4]);
u = cmCoordinate(1);
v = cmCoordinate(2);
P = [orgCoordinate, 1];
rows = [P, zeroVec, -u * P; zeroVec, P, -v * P];
end
