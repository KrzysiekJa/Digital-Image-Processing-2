%% mean = 0, std_dev = 0.01
clearvars; close all; clc;

pleiades = imread("Pleiades_large.jpeg");
chip = imread("umberto-chip.jpg");

pleiades_gray = rgb2gray(pleiades);
chip_gray = rgb2gray(chip);


pleiades_noise8 = get_mean_image(pleiades_gray, 8, 0, 0.01);
pleiades_noise16 = get_mean_image(pleiades_gray, 16, 0, 0.01);
pleiades_noise32 = get_mean_image(pleiades_gray, 32, 0, 0.01);
pleiades_noise64 = get_mean_image(pleiades_gray, 64, 0, 0.01);

figure(1)
subplot(2,2,1), imshow(pleiades_noise8), title('Noise(0, 00.1), iter num: 8');
subplot(2,2,2), imshow(pleiades_noise16), title('Noise(0, 00.1), iter num: 16');
subplot(2,2,3), imshow(pleiades_noise32), title('Noise(0, 00.1), iter num: 32');
subplot(2,2,4), imshow(pleiades_noise64), title('Noise(0, 00.1), iter num: 64');

pleiades_diff8 = rescale(pleiades_gray - pleiades_noise8, -255, 255);
pleiades_diff16 = rescale(pleiades_gray - pleiades_noise16, -255, 255);
pleiades_diff32 = rescale(pleiades_gray - pleiades_noise32, -255, 255);
pleiades_diff64 = rescale(pleiades_gray - pleiades_noise64, -255, 255);

figure(2)
subplot(2,2,1), imshow(pleiades_diff8), title('Diff origin - 8');
subplot(2,2,2), imshow(pleiades_diff16), title('Diff origin - 16');
subplot(2,2,3), imshow(pleiades_diff32), title('Diff origin - 32');
subplot(2,2,4), imshow(pleiades_diff64), title('Diff origin - 64');

figure(3)
subplot(2,2,1), histogram(pleiades_diff8), title('Histogram origin - 8');
subplot(2,2,2), histogram(pleiades_diff16), title('Histogram origin - 16');
subplot(2,2,3), histogram(pleiades_diff32), title('Histogram origin - 32');
subplot(2,2,4), histogram(pleiades_diff64), title('Histogram origin - 64');


chip_noise8 = get_mean_image(chip_gray, 8, 0, 0.01);
chip_noise16 = get_mean_image(chip_gray, 16, 0, 0.01);
chip_noise32 = get_mean_image(chip_gray, 32, 0, 0.01);
chip_noise64 = get_mean_image(chip_gray, 64, 0, 0.01);

figure(4)
subplot(2,2,1), imshow(chip_noise8), title('Noise(0, 00.1), iter num: 8');
subplot(2,2,2), imshow(chip_noise16), title('Noise(0, 00.1), iter num: 16');
subplot(2,2,3), imshow(chip_noise32), title('Noise(0, 00.1), iter num: 32');
subplot(2,2,4), imshow(chip_noise64), title('Noise(0, 00.1), iter num: 64');

chip_diff8 = rescale(chip_gray - chip_noise8, -255, 255);
chip_diff16 = rescale(chip_gray - chip_noise16, -255, 255);
chip_diff32 = rescale(chip_gray - chip_noise32, -255, 255);
chip_diff64 = rescale(chip_gray - chip_noise64, -255, 255);

figure(5)
subplot(2,2,1), imshow(chip_diff8), title('Diff origin - 8');
subplot(2,2,2), imshow(chip_diff16), title('Diff origin - 16');
subplot(2,2,3), imshow(chip_diff32), title('Diff origin - 32');
subplot(2,2,4), imshow(chip_diff64), title('Diff origin - 64');

figure(6)
subplot(2,2,1), histogram(chip_diff8), title('Histogram origin - 8');
subplot(2,2,2), histogram(chip_diff16), title('Histogram origin - 16');
subplot(2,2,3), histogram(chip_diff32), title('Histogram origin - 32');
subplot(2,2,4), histogram(chip_diff64), title('Histogram origin - 64');



%% mean = 0, std_dev = 0.04
clearvars; close all; clc;

pleiades = imread("Pleiades_large.jpeg");
chip = imread("umberto-chip.jpg");

pleiades_gray = rgb2gray(pleiades);
chip_gray = rgb2gray(chip);


pleiades_noise8 = get_mean_image(pleiades_gray, 8, 0, 0.04);
pleiades_noise16 = get_mean_image(pleiades_gray, 16, 0, 0.04);
pleiades_noise32 = get_mean_image(pleiades_gray, 32, 0, 0.04);
pleiades_noise64 = get_mean_image(pleiades_gray, 64, 0, 0.04);

figure(1)
subplot(2,2,1), imshow(pleiades_noise8), title('Noise(0, 00.4), iter num: 8');
subplot(2,2,2), imshow(pleiades_noise16), title('Noise(0, 00.4), iter num: 16');
subplot(2,2,3), imshow(pleiades_noise32), title('Noise(0, 00.4), iter num: 32');
subplot(2,2,4), imshow(pleiades_noise64), title('Noise(0, 00.4), iter num: 64');

pleiades_diff8 = rescale(pleiades_gray - pleiades_noise8, -255, 255);
pleiades_diff16 = rescale(pleiades_gray - pleiades_noise16, -255, 255);
pleiades_diff32 = rescale(pleiades_gray - pleiades_noise32, -255, 255);
pleiades_diff64 = rescale(pleiades_gray - pleiades_noise64, -255, 255);

figure(2)
subplot(2,2,1), imshow(pleiades_diff8), title('Diff origin - 8');
subplot(2,2,2), imshow(pleiades_diff16), title('Diff origin - 16');
subplot(2,2,3), imshow(pleiades_diff32), title('Diff origin - 32');
subplot(2,2,4), imshow(pleiades_diff64), title('Diff origin - 64');

figure(3)
subplot(2,2,1), histogram(pleiades_diff8), title('Histogram origin - 8');
subplot(2,2,2), histogram(pleiades_diff16), title('Histogram origin - 16');
subplot(2,2,3), histogram(pleiades_diff32), title('Histogram origin - 32');
subplot(2,2,4), histogram(pleiades_diff64), title('Histogram origin - 64');


chip_noise8 = get_mean_image(chip_gray, 8, 0, 0.04);
chip_noise16 = get_mean_image(chip_gray, 16, 0, 0.04);
chip_noise32 = get_mean_image(chip_gray, 32, 0, 0.04);
chip_noise64 = get_mean_image(chip_gray, 64, 0, 0.04);

figure(4)
subplot(2,2,1), imshow(chip_noise8), title('Noise(0, 00.4), iter num: 8');
subplot(2,2,2), imshow(chip_noise16), title('Noise(0, 00.4), iter num: 16');
subplot(2,2,3), imshow(chip_noise32), title('Noise(0, 00.4), iter num: 32');
subplot(2,2,4), imshow(chip_noise64), title('Noise(0, 00.4), iter num: 64');

chip_diff8 = rescale(chip_gray - chip_noise8, -255, 255);
chip_diff16 = rescale(chip_gray - chip_noise16, -255, 255);
chip_diff32 = rescale(chip_gray - chip_noise32, -255, 255);
chip_diff64 = rescale(chip_gray - chip_noise64, -255, 255);

figure(5)
subplot(2,2,1), imshow(chip_diff8), title('Diff origin - 8');
subplot(2,2,2), imshow(chip_diff16), title('Diff origin - 16');
subplot(2,2,3), imshow(chip_diff32), title('Diff origin - 32');
subplot(2,2,4), imshow(chip_diff64), title('Diff origin - 64');

figure(6)
subplot(2,2,1), histogram(chip_diff8), title('Histogram origin - 8');
subplot(2,2,2), histogram(chip_diff16), title('Histogram origin - 16');
subplot(2,2,3), histogram(chip_diff32), title('Histogram origin - 32');
subplot(2,2,4), histogram(chip_diff64), title('Histogram origin - 64');


