function histogram = make_histogram(image)

[x, y] = size(image);
histogram = zeros(1, 256);

for i = 1:x
    for j = 1:y
        histogram(image(i,j)+1) = histogram(image(i,j)+1) + 1;
    end
end

end

