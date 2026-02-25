function g = dip_blur(f)
% Blurs an image
%   f: grayscale image
filter = ones(3, "double") / 9;
g = imfilter(f, filter);
end