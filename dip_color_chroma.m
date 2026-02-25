function g = dip_color_chroma(f, h, B, t)
% Chroma key composition
%   f: foreground RGB image
%   h: background RGB image
%   B: background color's value (vector)
%   t: threshold for background color
s = size(f);
g = imresize(h, s(1:2));
B = reshape(B, [1 1 3]);
mask = f >= B - t & f <= B + t;
mask = mask(:,:,1) & mask(:,:,2) & mask(:,:,3);
mask = cat(3, mask, mask, mask);
g(~mask) = f(~mask);
end