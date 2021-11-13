function grayscale_im = get_grayscale_image(image)

[x, y, ~] = size(image);
grayscale_im = zeros(x, y);

for i = 1:x
    for j = 1:y
        grayscale_im(i,j) = 0.2989 * image(i,j,1) + 0.5870 * image(i,j,2) + 0.1140 * image(i,j,3);
    end
end

end
