%% ideal filter
clearvars; close all; clc;

oranges = imread("oranges.jpg");
scsihd = imread("scsi-hd.jpg");

oranges_gray = get_grayscale_image(oranges);
scsihd_gray = get_grayscale_image(scsihd);


oranges_fft = fftshift(fft2(oranges_gray));
scsihd_fft = fftshift(fft2(scsihd_gray));
thresh = 100;


[rows, cols] = size(oranges_gray);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
oranges_fft(R < thresh) = 0;

[rows, cols] = size(scsihd_gray);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
scsihd_fft(R < thresh) = 0;


abs_log = @(X)(log(abs(X)));

figure(1);
subplot(2,2,1), imshow(imresize(abs_log(oranges_fft), [512 512]), []), 
title(['Image 1 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,2), imshow(imresize(abs_log(scsihd_fft), [512 512]), []), 
title(['Image 2 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,3), imshow(abs(ifft2(oranges_fft)), []), title('Image 1 after ideal filtering');
subplot(2,2,4), imshow(abs(ifft2(scsihd_fft)), []), title('Image 2 after ideal filtering');


%% Butterworth filter
clearvars; close all; clc;

oranges = imread("oranges.jpg");
scsihd = imread("scsi-hd.jpg");

oranges_gray = get_grayscale_image(oranges);
scsihd_gray = get_grayscale_image(scsihd);


oranges_fft = fftshift(fft2(oranges_gray));
scsihd_fft = fftshift(fft2(scsihd_gray));
thresh = 100;


[rows, cols] = size(oranges_gray);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
n = 2;
H = 1 ./ (1 + (R/thresh).^(2*n));
oranges_fft = oranges_fft .* (1 - H);

[rows, cols] = size(scsihd_gray);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
n = 2;
H = 1 ./ (1 + (R/thresh).^(2*n));
scsihd_fft = scsihd_fft .* (1 - H);


abs_log = @(X)(log(abs(X)));

figure(1);
subplot(2,2,1), imshow(imresize(abs_log(oranges_fft), [512 512]), []), 
title(['Image 1 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,2), imshow(imresize(abs_log(scsihd_fft), [512 512]), []), 
title(['Image 2 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,3), imshow(abs(ifft2(oranges_fft)), []), title('Image 1 after Butterworth filtering');
subplot(2,2,4), imshow(abs(ifft2(scsihd_fft)), []), title('Image 2 after Butterworth filtering');


%% gaussian filter
clearvars; close all; clc;

oranges = imread("oranges.jpg");
scsihd = imread("scsi-hd.jpg");

oranges_gray = get_grayscale_image(oranges);
scsihd_gray = get_grayscale_image(scsihd);


oranges_fft = fftshift(fft2(oranges_gray));
scsihd_fft = fftshift(fft2(scsihd_gray));
thresh = 100;


[rows, cols] = size(oranges_gray);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
H = exp( -(R.^2 / (2*thresh.^2)));
oranges_fft = oranges_fft .* (1 - H);

[rows, cols] = size(scsihd_gray);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
H = exp( -(R.^2 / (2*thresh.^2)));
scsihd_fft = scsihd_fft .* (1 - H);


abs_log = @(X)(log(abs(X)));

figure(1);
subplot(2,2,1), imshow(imresize(abs_log(oranges_fft), [512 512]), []), 
title(['Image 1 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,2), imshow(imresize(abs_log(scsihd_fft), [512 512]), []), 
title(['Image 2 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,3), imshow(abs(ifft2(oranges_fft)), []), title('Image 1 after gaussian filtering');
subplot(2,2,4), imshow(abs(ifft2(scsihd_fft)), []), title('Image 2 after gaussian filtering');



