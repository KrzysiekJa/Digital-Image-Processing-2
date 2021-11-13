%% grayscale
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");

oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);


figure(1);
subplot(2,4,1), imshow(oranges), title('originals');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,6), imshow(rabbit_gray, []);
subplot(2,4,7), imshow(scsihd_gray, []);
subplot(2,4,8), imshow(dome_gray, []);


%% histogram
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");

oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);

oranges_hist = make_histogram(oranges_gray);
rabbit_hist = make_histogram(rabbit_gray);
scsihd_hist = make_histogram(scsihd_gray);
dome_hist = make_histogram(dome_gray);


figure(1);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), bar(oranges_hist), title('histograms');
subplot(2,4,6), bar(rabbit_hist);
subplot(2,4,7), bar(scsihd_hist);
subplot(2,4,8), bar(dome_hist);


%% binarization
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");

oranges_bin = get_grayscale_image(oranges) > 71;
rabbit_bin = get_grayscale_image(rabbit) > 53;
scsihd_bin = get_grayscale_image(scsihd) > 61;
dome_bin = get_grayscale_image(dome) > 35;


figure(1);
subplot(2,4,1), imshow(oranges_bin), title('own binarizations');
subplot(2,4,2), imshow(rabbit_bin);
subplot(2,4,3), imshow(scsihd_bin);
subplot(2,4,4), imshow(dome_bin);

subplot(2,4,5), imshow(im2bw(oranges, 71/255)), title('matlab binarizations');
subplot(2,4,6), imshow(im2bw(rabbit, 53/255));
subplot(2,4,7), imshow(im2bw(scsihd, 61/255));
subplot(2,4,8), imshow(im2bw(dome, 35/255));


%% ln LUT on grayscale image
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);

LUT = make_LUT(@log);

oranges_gray_lut = process_thru_LUT(oranges_gray, LUT);
rabbit_gray_lut = process_thru_LUT(rabbit_gray, LUT);
scsihd_lut = process_thru_LUT(scsihd_gray, LUT);
dome_lut = process_thru_LUT(dome_gray, LUT);


figure(1);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), imshow(oranges_gray_lut, []), title('after lut');
subplot(2,4,6), imshow(rabbit_gray_lut, []);
subplot(2,4,7), imshow(scsihd_lut, []);
subplot(2,4,8), imshow(dome_lut, []);


%% gamma 4, 2, 0.4, 0.2 LUT on grayscale image
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");

oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);


LUT = make_LUT(@(x)2 * x.^4);

oranges_gray_lut4 = process_thru_LUT(oranges_gray, LUT);
rabbit_gray_lut4 = process_thru_LUT(rabbit_gray, LUT);
scsihd_gray_lut4 = process_thru_LUT(scsihd_gray, LUT);
dome_gray_lut4 = process_thru_LUT(dome_gray, LUT);

LUT = make_LUT(@(x)2 * x.^2);

oranges_gray_lut2 = process_thru_LUT(oranges_gray, LUT);
rabbit_gray_lut2 = process_thru_LUT(rabbit_gray, LUT);
scsihd_gray_lut2 = process_thru_LUT(scsihd_gray, LUT);
dome_gray_lut2 = process_thru_LUT(dome_gray, LUT);

LUT = make_LUT(@(x)3 * x.^0.4);

oranges_gray_lut04 = process_thru_LUT(oranges_gray, LUT);
rabbit_gray_lut04 = process_thru_LUT(rabbit_gray, LUT);
scsihd_gray_lut04 = process_thru_LUT(scsihd_gray, LUT);
dome_gray_lut04 = process_thru_LUT(dome_gray, LUT);

LUT = make_LUT(@(x)3 * x.^0.2);

oranges_gray_lut02 = process_thru_LUT(oranges_gray, LUT);
rabbit_gray_lut02 = process_thru_LUT(rabbit_gray, LUT);
scsihd_gray_lut02 = process_thru_LUT(scsihd_gray, LUT);
dome_gray_lut02 = process_thru_LUT(dome_gray, LUT);



figure(1);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), imshow(oranges_gray_lut4, []), title('after lut gamma 4');
subplot(2,4,6), imshow(rabbit_gray_lut4, []);
subplot(2,4,7), imshow(scsihd_gray_lut4, []);
subplot(2,4,8), imshow(dome_gray_lut4, []);


figure(2);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), imshow(oranges_gray_lut2, []), title('after lut gamma 2');
subplot(2,4,6), imshow(rabbit_gray_lut2, []);
subplot(2,4,7), imshow(scsihd_gray_lut2, []);
subplot(2,4,8), imshow(dome_gray_lut2, []);


figure(3);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), imshow(oranges_gray_lut04, []), title('after lut gamma 0.4');
subplot(2,4,6), imshow(rabbit_gray_lut04, []);
subplot(2,4,7), imshow(scsihd_gray_lut04, []);
subplot(2,4,8), imshow(dome_gray_lut04, []);


figure(4);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), imshow(oranges_gray_lut02, []), title('after lut gamma 0.2');
subplot(2,4,6), imshow(rabbit_gray_lut02, []);
subplot(2,4,7), imshow(scsihd_gray_lut02, []);
subplot(2,4,8), imshow(dome_gray_lut02, []);


%% linear LUT on grayscale image
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


oranges_gray = get_grayscale_image(oranges);
rabbit_gray = get_grayscale_image(rabbit);
scsihd_gray = get_grayscale_image(scsihd);
dome_gray = get_grayscale_image(dome);

LUT = 0:255;
LUT(82:162) = uint8(( (1/3)*255 + (2/3)*255 )/2);

oranges_gray_lut = process_thru_LUT(oranges_gray, LUT);
rabbit_gray_lut = process_thru_LUT(rabbit_gray, LUT);
scsihd_gray_lut = process_thru_LUT(scsihd_gray, LUT);
dome_gray_lut = process_thru_LUT(dome_gray, LUT);


figure(1);
subplot(2,4,1), imshow(oranges_gray, []), title('grayscale images');
subplot(2,4,2), imshow(rabbit_gray, []);
subplot(2,4,3), imshow(scsihd_gray, []);
subplot(2,4,4), imshow(dome_gray, []);

subplot(2,4,5), imshow(oranges_gray_lut, []), title('after lut');
subplot(2,4,6), imshow(rabbit_gray_lut, []);
subplot(2,4,7), imshow(scsihd_gray_lut, []);
subplot(2,4,8), imshow(dome_gray_lut, []);


%% ln LUT on RGB image
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


LUT = make_LUT(@log);

oranges_lut = process_chanel_thru_LUT(oranges, LUT, 1);
rabbit_lut = process_chanel_thru_LUT(rabbit, LUT, 2);
scsihd_lut = process_chanel_thru_LUT(scsihd, LUT, 3);
dome_lut = process_chanel_thru_LUT(process_chanel_thru_LUT(dome, LUT, 1), LUT, 2);
dome_lut = process_chanel_thru_LUT(dome_lut, LUT, 3);


figure(1);
subplot(2,4,1), imshow(oranges), title('RGB images');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_lut), title('after lut on Red');
subplot(2,4,6), imshow(rabbit_lut), title('after lut on Green');
subplot(2,4,7), imshow(scsihd_lut), title('after lut on Blue');
subplot(2,4,8), imshow(dome_lut), title('after lut on RGB');


%% gamma 4, 2, 0.4, 0.2 LUT on RGB image
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


LUT = make_LUT(@(x)2 * x.^4);

oranges_lut4 = process_chanel_thru_LUT(oranges, LUT, 1);
rabbit_lut4 = process_chanel_thru_LUT(rabbit, LUT, 2);
scsihd_lut4 = process_chanel_thru_LUT(scsihd, LUT, 3);
dome_lut4 = process_chanel_thru_LUT(process_chanel_thru_LUT(dome, LUT, 1), LUT, 2);
dome_lut4 = process_chanel_thru_LUT(dome_lut4, LUT, 3);

LUT = make_LUT(@(x)2 * x.^2);

oranges_lut2 = process_chanel_thru_LUT(oranges, LUT, 1);
rabbit_lut2 = process_chanel_thru_LUT(rabbit, LUT, 2);
scsihd_lut2 = process_chanel_thru_LUT(scsihd, LUT, 3);
dome_lut2 = process_chanel_thru_LUT(process_chanel_thru_LUT(dome, LUT, 1), LUT, 2);
dome_lut2 = process_chanel_thru_LUT(dome_lut2, LUT, 3);

LUT = make_LUT(@(x)3 * x.^0.4);

oranges_lut04 = process_chanel_thru_LUT(oranges, LUT, 1);
rabbit_lut04 = process_chanel_thru_LUT(rabbit, LUT, 2);
scsihd_lut04 = process_chanel_thru_LUT(scsihd, LUT, 3);
dome_lut04 = process_chanel_thru_LUT(process_chanel_thru_LUT(dome, LUT, 1), LUT, 2);
dome_lut04 = process_chanel_thru_LUT(dome_lut04, LUT, 3);

LUT = make_LUT(@(x)3 * x.^0.2);

oranges_lut02 = process_chanel_thru_LUT(oranges, LUT, 1);
rabbit_lut02 = process_chanel_thru_LUT(rabbit, LUT, 2);
scsihd_lut02 = process_chanel_thru_LUT(scsihd, LUT, 3);
dome_lut02 = process_chanel_thru_LUT(process_chanel_thru_LUT(dome, LUT, 1), LUT, 2);
dome_lut02 = process_chanel_thru_LUT(dome_lut02, LUT, 3);



figure(1);
subplot(2,4,1), imshow(oranges), title('RGB images');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_lut4), title('after lut on Red');
subplot(2,4,6), imshow(rabbit_lut4), title('after lut on Green');
subplot(2,4,7), imshow(scsihd_lut4), title('after lut on Blue');
subplot(2,4,8), imshow(dome_lut4), title('after lut on RGB');


figure(2);
subplot(2,4,1), imshow(oranges), title('RGB images');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_lut2), title('after lut on Red');
subplot(2,4,6), imshow(rabbit_lut2), title('after lut on Green');
subplot(2,4,7), imshow(scsihd_lut2), title('after lut on Blue');
subplot(2,4,8), imshow(dome_lut2), title('after lut on RGB');


figure(3);
subplot(2,4,1), imshow(oranges), title('RGB images');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_lut04), title('after lut on Red');
subplot(2,4,6), imshow(rabbit_lut04), title('after lut on Green');
subplot(2,4,7), imshow(scsihd_lut04), title('after lut on Blue');
subplot(2,4,8), imshow(dome_lut04), title('after lut on RGB');


figure(4);
subplot(2,4,1), imshow(oranges), title('RGB images');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_lut02), title('after lut on Red');
subplot(2,4,6), imshow(rabbit_lut02), title('after lut on Green');
subplot(2,4,7), imshow(scsihd_lut02), title('after lut on Blue');
subplot(2,4,8), imshow(dome_lut02), title('after lut on RGB');


%% linear LUT on RGB image
clearvars; close all; clc;

oranges = imread("oranges.jpg");
rabbit = imread("rabbit.jpg");
scsihd = imread("scsi-hd.jpg");
dome = imread("dome.jpg");


LUT = 0:255;
LUT(82:162) = uint8(( (1/3)*255 + (2/3)*255 )/2);

oranges_lut = process_chanel_thru_LUT(oranges, LUT, 1);
rabbit_lut = process_chanel_thru_LUT(rabbit, LUT, 2);
scsihd_lut = process_chanel_thru_LUT(scsihd, LUT, 3);
dome_lut = process_chanel_thru_LUT(process_chanel_thru_LUT(dome, LUT, 1), LUT, 2);
dome_lut = process_chanel_thru_LUT(dome_lut, LUT, 3);


figure(1);
subplot(2,4,1), imshow(oranges), title('RGB images');
subplot(2,4,2), imshow(rabbit);
subplot(2,4,3), imshow(scsihd);
subplot(2,4,4), imshow(dome);

subplot(2,4,5), imshow(oranges_lut), title('after lut on Red');
subplot(2,4,6), imshow(rabbit_lut), title('after lut on Green');
subplot(2,4,7), imshow(scsihd_lut), title('after lut on Blue');
subplot(2,4,8), imshow(dome_lut), title('after lut on RGB');



