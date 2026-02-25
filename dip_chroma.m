function g = dip_chroma(f, h, B)
% Chroma color replacement
%   f: foreground grayscale image
%   h: background grayscale image
%   B: background color's value (scalar)
g = imresize(h, size(f));
% mask = f ~= B;
mask = f < B - 1 | f > B + 1;
g(mask) = f(mask);
end