%% logical operations
clearvars; close all; clc;

m_size = 256;
matrix_triangle = tril(zeros(m_size, m_size));
matrix_circle = zeros(m_size, m_size);


% for matrix_triangle
for i = 120:240
    for j = i:240
        matrix_triangle(i, j) = 1;
    end
end

% for matrix_circle
[rows, cols] = size(matrix_circle);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
matrix_circle(R < 50) = 1;



figure(1)
subplot(2,3,1), imshow(matrix_triangle), title("Image 1");
subplot(2,3,2), imshow(matrix_circle), title("Image 2");
subplot(2,3,3), imshow(matrix_triangle & matrix_circle), title("Product");
subplot(2,3,4), imshow(matrix_triangle | matrix_circle), title("Sum");
subplot(2,3,5), imshow(~matrix_circle), title("Negative of circle");
subplot(2,3,6), imshow(matrix_triangle - matrix_circle), title("Difference: triangle - circle");


%% morfological operations
clearvars; close all; clc;

pleiades = imread("Pleiades_large.jpeg");
chip = imread("umberto-chip.jpg");


pleiades_gray = rgb2gray(pleiades);
chip_gray = rgb2gray(chip);

pleiades_bin = pleiades_gray > 128;
chip_bin = chip_gray > 128;

struct_pleiades = strel('disk', 10);
struct_chip = strel('square', 5);

pleiades_open = imopen(pleiades_bin, struct_pleiades);
chip_open = imopen(chip_bin, struct_chip);

pleiades_close = imclose(pleiades_open, struct_pleiades);
chip_close = imclose(chip_open, struct_chip);


figure(1)
subplot(1,3,1), imshow(pleiades_bin), title("Image 1");
subplot(1,3,2), imshow(pleiades_open), title("After opening");
subplot(1,3,3), imshow(pleiades_close), title("After closing");


figure(2)
subplot(1,3,1), imshow(chip_bin), title("Image 2");
subplot(1,3,2), imshow(chip_open), title("After opening");
subplot(1,3,3), imshow(chip_close), title("After closing");


