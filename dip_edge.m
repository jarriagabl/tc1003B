function g = dip_edge(f)
% Finds edges of an image
%   f: grayscale image
filter = [1 0 -1; 0 0 0; -1 0 1];
g = imfilter(f, filter);
end