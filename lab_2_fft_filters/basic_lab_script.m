%% fft
clearvars; close all; clc;

img_1 = zeros(512, 521);
img_1(246:266, 216:296) = 255;
img_2 = img_1';

figure(1);
subplot(1,2,1), imshow(img_1), title('Image no 1');
subplot(1,2,2), imshow(img_2), title('Image no 2');


fft_img_1 = fft2(img_1);
fft_oranges_shifted = fftshift(fft_img_1);
fft_oranges_shifted = log(abs(fft_oranges_shifted));
fft_scsihd_gray = fft2(img_2);
fft_scsihd_shifted = fftshift(fft_scsihd_gray);
fft_scsihd_shifted = log(abs(fft_scsihd_shifted));

figure(2);
subplot(1,2,1), imshow(fft_oranges_shifted, []), title('FFT for img 1');
subplot(1,2,2), imshow(fft_scsihd_shifted, []), title('FFT for img 2');


%% fft of images
clearvars; close all; clc;

oranges = imread("oranges.jpg");
scsihd = imread("scsi-hd.jpg");

oranges_gray = get_grayscale_image(oranges);
scsihd_gray = get_grayscale_image(scsihd);

figure(1)
subplot(2,2,1), imshow(oranges_gray, []), title('Image no 1');
subplot(2,2,2), imshow(scsihd_gray, []), title('Image no 2');


fft_oranges = fft2(oranges_gray);
fft_oranges_shifted = fftshift(fft_oranges);
fft_oranges_shifted = log(abs(fft_oranges_shifted));
fft_scsihd = fft2(scsihd_gray);
fft_scsihd_shifted = fftshift(fft_scsihd);
fft_scsihd_shifted = log(abs(fft_scsihd_shifted));

subplot(2,2,3), imshow(imresize(fft_oranges_shifted, [512 512]), []), title('FFT for img 1');
subplot(2,2,4), imshow(imresize(fft_scsihd_shifted, [512 512]), []), title('FFT for img 2');



