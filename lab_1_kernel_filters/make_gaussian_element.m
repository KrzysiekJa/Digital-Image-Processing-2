function [kernel, x, y] = make_gaussian_element(kernel_size, sigma)

[x, y] = meshgrid(-kernel_size:kernel_size, -kernel_size:kernel_size);

exp_comp = -(x.^2+y.^2) / (2*sigma*sigma);
kernel= exp(exp_comp) / (2*pi*sigma*sigma);
end
