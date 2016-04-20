i2 = imread('images2.png');
i9 = imread('images9.png');
i12 = imread('images12.png');
i20 = imread('images20.png');
imagesc(i2);
[i2_x, i2_y] = ginput(4)
imagesc(i9);
[i9_x, i9_y] = ginput(4)
imagesc(i12);
[i12_x, i12_y] = ginput(4)
imagesc(i20);
[i20_x, i20_y] = ginput(4)
orgCrdnts = [0, 0, 0.27, 0.27; 0, 0.21, 0.21, 0; 1, 1, 1, 1];
i2Crdnts = [i2_x'; i2_y'; 1, 1, 1, 1];
H2 = homography2d(orgCrdnts, i2Crdnts);
i9Crdnts = [i9_x'; i9_y'; 1, 1, 1, 1];
H9 = homography2d(orgCrdnts, i9Crdnts);
i12Crdnts = [i12_x'; i12_y'; 1, 1, 1, 1];
H12 = homography2d(orgCrdnts, i12Crdnts);
i20Crdnts = [i20_x'; i20_y'; 1, 1, 1, 1];
H20 = homography2d(orgCrdnts, i20Crdnts);
rows_2 = createVrows(H2);
rows_9 = createVrows(H9);
rows_12 = createVrows(H12);
rows_20 = createVrows(H20);
V = [rows_2; rows_9; rows_12; rows_20];
[U_1, S_1, V_1] = svd(V);
b = V_1(:, 6);
B = [b(1), b(2), b(4); b(2), b(3), b(5); b(4), b(5), b(6)]
v0 = (b(2) .* b(4) - b(1) .* b(5)) ./ (b(1) .* b(3) - b(2)^2)
lambda = b(6) - (b(4)^2 + v0 .* (b(2) .* b(4) - b(1) .* b(5))) ./ b(1)
aplha = sqrt(lambda ./ b(1))
beta = sqrt(lambda .* b(1) ./ (b(1) .* b(3) - b(2)^2))
gamma = -b(2) * aplha^2 * beta ./ lambda
u0 = gamma * v0 ./ aplha - b(4) .* aplha^2 ./ lambda
A = [aplha, gamma, u0; 0, beta, v0; 0, 0, 1]
r2_1 = lambda .* inv(A) * H2(:,1)
r2_2 = lambda .* inv(A) * H2(:,2)
r2_3 = cross(r2_1, r2_2)
R2 = [r2_1, r2_2, r2_3]
t2 = lambda .* inv(A) * H2(:,3)
r9_1 = lambda .* inv(A) * H9(:,1)
r9_2 = lambda .* inv(A) * H9(:,2)
r9_3 = cross(r9_1, r9_2)
R9 = [r9_1, r9_2, r9_3]
t9  = lambda .* inv(A) * H9(:,3)
r12_1 = lambda .* inv(A) * H12(:,1)
r12_2 = lambda .* inv(A) * H12(:,2)
r12_3 = cross(r12_1, r12_2)
R12 = [r12_1, r12_2, r12_3]
t12 = lambda .* inv(A) * H12(:,3)
r20_1 = lambda .* inv(A) * H20(:,1)
r20_2 = lambda .* inv(A) * H20(:,2)
r20_3 = cross(r20_1, r20_2)
R20 = [r20_1, r20_2, r20_3]
t20 = lambda .* inv(A) * H20(:,3)
R2 * R2'
[U2, S2, V2] = svd(R2);
newR2 = U2 * V2'
newR2 * newR2'
R9 * R9'
[U9, S9, V9] = svd(R9);
newR9 = U9 * V9'
newR9 * newR9'
R12 * R12'
[U12, S12, V12] = svd(R12);
newR12 = U12 * V12'
newR12 * newR12'
R20 * R20'
[U20, S20, V20] = svd(R20);
newR20 = U20 * V20' 
newR20 * newR20'

x = zeros([1,80]);
y = zeros([1,80]);
index = 1;
for i=1:10;
    for j=1:8
        x(index) = (i - 1) .* 0.03;
        y(index) = (j - 1) .* 0.03;
        index = index + 1;
    end
end
orgGrids = [x; y; ones([1, 80])];
p_approx2 = H2 * orgGrids;
figure
imagesc(i2)
hold on
scatter(p_approx2(1,:) ./ p_approx2(3, :), p_approx2(2,:) ./ p_approx2(3, :));
hold off
figure
p_approx9 = H9 * orgGrids;
imagesc(i9)
hold on
scatter(p_approx9(1,:) ./ p_approx9(3, :), p_approx9(2, :) ./ p_approx9(3, :));
hold off
p_approx12 = H12 * orgGrids;
figure
imagesc(i12)
hold on
scatter(p_approx12(1,:) ./ p_approx12(3, :), p_approx12(2, :) ./ p_approx12(3, :));
hold off
p_approx20 = H20 * orgGrids;
figure
imagesc(i20)
hold on
scatter(p_approx20(1,:) ./ p_approx20(3, :), p_approx20(2, :) ./ p_approx20(3, :));
hold off

[cim2, r2, c2, rsubp2, csubp2] = harris(rgb2gray(i2), 2, 500, 2, 0);
figure
imagesc(i2)
hold on
scatter(csubp2, rsubp2)
hold off
[cim9, r9, c9, rsubp9, csubp9] = harris(rgb2gray(i9), 2, 500, 2, 0);
figure
imagesc(i9)
hold on
scatter(csubp9, rsubp9)
hold off
[cim12, r12, c12, rsubp12, csubp12] = harris(rgb2gray(i12), 2, 500, 2, 0);
figure
imagesc(i12)
hold on
scatter(csubp12, rsubp12)
hold off
[cim20, r20, c20, rsubp20, csubp20] = harris(rgb2gray(i20), 2, 500, 2, 0);
figure
imagesc(i20)
hold on
scatter(csubp20, rsubp2020)
hold off

harrisCrdnts2 = [csubp2, rsubp2];
d2 = dist2([(p_approx2(1,:) ./ p_approx2(3, :))', (p_approx2(2,:) ./ p_approx2(3, :))'], harrisCrdnts2);
[sd2, index2] = sort(d2, 2);
p_correct2 = harrisCrdnts2(index2(:, 1), :);
figure
imagesc(i2)
hold on
scatter(p_correct2(:, 1), p_correct2(:, 2));
hold off

harrisCrdnts9 = [csubp9, rsubp9];
d9 = dist2([(p_approx9(1,:) ./ p_approx9(3, :))', (p_approx9(2,:) ./ p_approx9(3, :))'], harrisCrdnts9);
[sd9, index9] = sort(d9, 2);
p_correct9 = harrisCrdnts9(index9(:, 1), :);
figure
imagesc(i9)
hold on
scatter(p_correct9(:, 1), p_correct9(:, 2));
hold off

harrisCrdnts12 = [csubp12, rsubp12];
d12 = dist2([(p_approx12(1,:) ./ p_approx12(3, :))', (p_approx12(2,:) ./ p_approx12(3, :))'], harrisCrdnts12);
[sd12, index12] = sort(d12, 2);
p_correct12 = harrisCrdnts12(index12(:, 1), :);
figure
imagesc(i12)
hold on
scatter(p_correct12(:, 1), p_correct12(:, 2));
hold off

harrisCrdnts20 = [csubp20, rsubp20];
d20 = dist2([(p_approx20(1,:) ./ p_approx20(3, :))', (p_approx20(2,:) ./ p_approx20(3, :))'], harrisCrdnts20);
[sd20, index20] = sort(d20, 2);
p_correct20 = harrisCrdnts20(index20(:, 1), :);
figure
imagesc(i20)
hold on
scatter(p_correct20(:, 1), p_correct20(:, 2));
hold off

H_2_harris = homography2d(orgGrids, [p_correct2'; ones([1, 80])])
H_9_harris = homography2d(orgGrids, [p_correct9'; ones([1, 80])])
H_12_harris = homography2d(orgGrids, [p_correct12'; ones([1, 80])])
H_20_harris = homography2d(orgGrids, [p_correct20'; ones([1, 80])])

[K, R2_ha, R9_ha, R12_ha, R20_ha, t2_ha, t9_ha, t12_ha, t20_ha] = ...
    calibration(H_2_harris, H_9_harris, H_12_harris, H_20_harris)

p_grids2 = H_2_harris * orgGrids;
p_grids2 = [p_grids2(1, :) ./ p_grids2(3, :); p_grids2(2, :) ./ p_grids2(3, :)];
sum(sqrt(sum((p_correct2' - p_grids2) .^ 2))) / 80

p_grids9 = H_9_harris * orgGrids;
p_grids9 = [p_grids9(1, :) ./ p_grids9(3, :); p_grids9(2, :) ./ p_grids9(3, :)];
sum(sqrt(sum((p_correct9' - p_grids9) .^ 2))) / 80

p_grids12 = H_12_harris * orgGrids;
p_grids12 = [p_grids12(1, :) ./ p_grids12(3, :); p_grids12(2, :) ./ p_grids12(3, :)];
sum(sqrt(sum((p_correct12' - p_grids12) .^ 2))) / 80

p_grids20 = H_20_harris * orgGrids;
p_grids20 = [p_grids20(1, :) ./ p_grids20(3, :); p_grids20(2, :) ./ p_grids20(3, :)];
sum(sqrt(sum((p_correct20' - p_grids20) .^ 2))) / 80