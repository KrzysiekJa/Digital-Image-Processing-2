function new_image = process_chanel_thru_LUT(image, LUT, chanel)

[x, y, ~] = size(image);
new_image = image;

for i=1:x
    for j=1:y
        new_image(i, j, chanel) = LUT(image(i, j, chanel)+1);
    end
end

end