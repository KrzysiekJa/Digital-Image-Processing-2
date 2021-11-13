function new_img = conv_filtration(img, kernel)

[x, y] = size(img);
margin = floor(length(kernel)/2);
new_img = img;

for i = 1+margin : x-margin
    for j = 1+margin : y-margin
        new_img(i, j) = sum(double(img(i-margin:i+margin, j-margin:j+margin)) .* kernel, 'all');
    end
end

new_img = uint8(new_img);
end
