function new_image = process_thru_LUT(image, LUT)

[x, y] = size(image);
new_image = zeros(x,y);

for i=1:x
    for j=1:y
        new_image(i, j) = LUT(image(i, j)+1);
    end
end

end
