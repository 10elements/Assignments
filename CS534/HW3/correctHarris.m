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