function [ output_args ] = ObjAugment(H, K, R, t, img, P)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure
imagesc(img)
hold on
if R(:, 3)' * t > 0
    R(:, 3) = -R(:, 3);
end
M = K * [R, t];
p = M * P;
p_real = [p(1, :) ./ p(3, :); p(2, :) ./ p(3, :)];
plot(p_real(1, 1:2), p_real(2, 1:2), 'c');
plot(p_real(1, 2:3), p_real(2, 2:3), 'c');
plot(p_real(1, 3:4), p_real(2, 3:4), 'c');
plot([p_real(1, 1), p_real(1, 4)], [p_real(2, 1), p_real(2, 4)], 'c');
plot(p_real(1, 5:6), p_real(2, 5:6), 'c');
plot(p_real(1, 6:7), p_real(2, 6:7), 'c');
plot(p_real(1, 7:8), p_real(2, 7:8), 'c');
plot([p_real(1, 5), p_real(1, 8)], [p_real(2, 5), p_real(2, 8)], 'c');
plot([p_real(1, 1), p_real(1, 5)], [p_real(2, 1), p_real(2, 5)], 'c');
plot([p_real(1, 2), p_real(1, 6)], [p_real(2, 2), p_real(2, 6)], 'c');
plot([p_real(1, 3), p_real(1, 7)], [p_real(2, 3), p_real(2, 7)], 'c');
plot([p_real(1, 4), p_real(1, 8)], [p_real(2, 4), p_real(2, 8)], 'c');
hold off
end

