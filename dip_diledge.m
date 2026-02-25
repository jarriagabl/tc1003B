function g = dip_diledge(f, n)
% Detects edges in an image using dilation
%   f: grayscale image
%   n: size of square structural element
s = strel("square", n);
g = imdilate(f, s) - f;
end