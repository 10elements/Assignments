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