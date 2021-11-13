%% originals
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");

oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);


subplot(2,2,1), imshow(oranges_gray, []);
subplot(2,2,2), imshow(rabbit_gray, []);
subplot(2,2,3), imshow(scsihd_gray, []);
subplot(2,2,4), imshow(dome_gray, []);
sgtitle('original imgs in grayscale');


%% low-pass filtering: ones
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);


sizes = [3, 5, 9, 15, 35];


for i = 1:length(sizes)
    struct_el = ones(sizes(i), sizes(i));
    struct_el = struct_el / sum(struct_el, 'all');
    
    oranges_lp = conv_filtration(oranges_gray, struct_el);
    rabbit_lp = conv_filtration(rabbit_gray, struct_el);
    scsihd_lp = conv_filtration(scsihd_gray, struct_el);
    dome_lp = conv_filtration(dome_gray, struct_el);
    
    figure(i);
    subplot(2,2,1), imshow(oranges_lp);
    subplot(2,2,2), imshow(rabbit_lp);
    subplot(2,2,3), imshow(scsihd_lp);
    subplot(2,2,4), imshow(dome_lp);
    sgtitle(['after low-pass filtering ', num2str(sizes(i))]);
end


%% low-pass filtering: gaussian
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);


sizes = [3, 5, 9, 15, 35];
sigma = [1, 1, 2, 4, 4];


for i = 1:length(sizes)
    kernel_size = floor(sizes(i)/2);
    [struct_el, x, y] = make_gaussian_element(kernel_size, sigma(i));
    
    oranges_lp = conv_filtration_gaussian(oranges_gray, struct_el, x, y, kernel_size);
    rabbit_lp = conv_filtration_gaussian(rabbit_gray, struct_el, x, y, kernel_size);
    scsihd_lp = conv_filtration_gaussian(scsihd_gray, struct_el, x, y, kernel_size);
    dome_lp = conv_filtration_gaussian(dome_gray, struct_el, x, y, kernel_size);
    
    figure(i);
    subplot(2,2,1), imshow(oranges_lp);
    subplot(2,2,2), imshow(rabbit_lp);
    subplot(2,2,3), imshow(scsihd_lp);
    subplot(2,2,4), imshow(dome_lp);
    sgtitle(['after gaussian filtering ', num2str(sizes(i))]);
end


%% Laplace filters
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);


struct_elem_1 = [0 1 0 ; 1 -4 1 ; 0 1 0];
struct_elem_2 = [1 1 1 ; 1 -8 1 ; 1 1 1];

oranges_gray_l1 = conv_filtration(oranges_gray, struct_elem_1);
rabbit_gray_l1 = conv_filtration(rabbit_gray, struct_elem_1);
scsihd_gray_l1 = conv_filtration(scsihd_gray, struct_elem_1);
dome_gray_l1 = conv_filtration(dome_gray, struct_elem_1);

oranges_gray_l2 = conv_filtration(oranges_gray, struct_elem_2);
rabbit_gray_l2 = conv_filtration(rabbit_gray, struct_elem_2);
scsihd_gray_l2 = conv_filtration(scsihd_gray, struct_elem_2);
dome_gray_l2 = conv_filtration(dome_gray, struct_elem_2);


figure(1);
subplot(2,2,1), imshow(oranges_gray_l1, []);
subplot(2,2,2), imshow(rabbit_gray_l1, []);
subplot(2,2,3), imshow(scsihd_gray_l1, []);
subplot(2,2,4), imshow(dome_gray_l1, []);
sgtitle('after Laplace filter');

figure(2);
subplot(2,2,1), imshow(oranges_gray_l2, []);
subplot(2,2,2), imshow(rabbit_gray_l2, []);
subplot(2,2,3), imshow(scsihd_gray_l2, []);
subplot(2,2,4), imshow(dome_gray_l2, []);
sgtitle('after Laplace filter');


