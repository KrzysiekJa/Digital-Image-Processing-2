%% frequency domain 
clearvars; close all; clc;

car = imread("halftone.png");
moon = imread("moon_corrupted.png");

car_fft = fftshift(fft2(car));
moon_fft = fftshift(fft2(moon));

abs_log = @(X)(log(abs(X)));


thresh = 40;
[rows, cols] = size(moon_fft);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
H_lp = exp( -(R.^2 / (2*thresh.^2)));
moon_fft_tresh = moon_fft .* H_lp;
moon_fft_tresh(R > 80) = 0;


figure(1)
subplot(2,2,1), imshow((moon), []), 
title("Image 1 - original");
subplot(2,2,2), imshow(imresize(abs_log(moon_fft), [512 512]), []), 
title("Image 1 - spectral");
subplot(2,2,3), imshow(imresize(abs_log(moon_fft_tresh), [512 512]), []), 
title(['Image 1 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,4), imshow(abs(ifft2(moon_fft_tresh)), []), 
title('Image 1 after gaussian filtering');


thresh = 45;
[rows, cols] = size(car_fft);
rx = linspace(-cols/2, cols/2, cols);
ry = linspace(-rows/2, rows/2, rows);

[X, Y] = meshgrid(rx, ry);
R = sqrt(X.^2 + Y.^2);
H_lp = exp( -(R.^2 / (2*thresh.^2)));
car_fft_tresh = car_fft .* H_lp;


figure(2)
subplot(2,2,1), imshow((car), []), 
title("Image 2 - original");
subplot(2,2,2), imshow(imresize(abs_log(car_fft), [512 512]), []), 
title("Image 2 - spectral");
subplot(2,2,3), imshow(imresize(abs_log(car_fft_tresh), [512 512]), []), 
title(['Image 2 spectral with filter, thresh=', num2str(thresh)]);
subplot(2,2,4), imshow(abs(ifft2(car_fft_tresh)), []), 
title('Image 2 after gaussian filtering');


%% image domain 
clearvars; close all; clc;

car = uint8(imread("halftone.png") * 255);


gaussian_kernel = fspecial('gaussian', 3, 1);
laplacian_kernel = [0 -1 0; -1 5 -1; 0 -1 0];
aver_kernel = fspecial('average', 5);

filtred_car = imfilter(car, gaussian_kernel);


for i = 1:12
    filtred_car = imfilter(filtred_car, gaussian_kernel);
end

filtred_car = uint8(conv2(filtred_car, aver_kernel, 'same'));
filtred_car = imfilter(filtred_car, laplacian_kernel);


figure(1)
subplot(2,1,1), imshow((car), []), 
title("Image - original");
subplot(2,1,2), imshow(filtred_car, []), 
title("Image - after gaussian filtering");



