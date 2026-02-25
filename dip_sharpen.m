function g = dip_sharpen(f)
% Sharpens an image
%   f: grayscale image
filter = [0 -1 0; -1 5 -1; 0 -1 0];
g = imfilter(f, filter);
end