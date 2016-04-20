im_apple = imread('1.jpg');
im2 = imread('images2.png');
opt2 = imgAugment(H_2_harris, im_apple, im2);
imshow(opt2)
im9 = imread('images9.png');
opt9 = imgAugment(H_9_harris, im_apple, im9);
imshow(opt9)
im12 = imread('images12.png');
opt12 = imgAugment(H_12_harris, im_apple, im12);
imshow(opt12)
im20 = imread('images20.png');
opt20 = imgAugment(H_20_harris, im_apple, im20);
imshow(opt20)