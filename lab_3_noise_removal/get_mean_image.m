function mean_img = get_mean_image(img, iter_amount, mean, std_dev)
mean_img = zeros(size(img));

for i = 1:iter_amount
    tmp_img = imnoise(img, 'gaussian', mean, std_dev);
    mean_img = mean_img + double(tmp_img);
end

mean_img = mean_img / iter_amount;
multipier = 255 / max(mean_img, [], 'all');

mean_img = uint8(mean_img * multipier);
end
