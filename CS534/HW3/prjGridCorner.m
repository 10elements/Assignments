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
