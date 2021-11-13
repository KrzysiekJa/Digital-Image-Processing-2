function new_img = conv_filtration_gaussian(img, kernel, x, y, kernel_size)

M = size(x,1)-1;
N = size(y,1)-1;
I = double(img);
new_img=zeros(size(I));
I = padarray(I, [kernel_size kernel_size]);

for i = 1 : size(I,1)-M
    for j = 1 : size(I,2)-N
        tmp = I(i:i+M, j:j+M) .* kernel;
        new_img(i,j) = sum(tmp, 'all');
    end
end

new_img = uint8(new_img);
end
