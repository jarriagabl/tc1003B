function g = dip_negative(f)
% Generates the negative of an image
%   f: original grayscale image
%   g: negative of f
    r = getrangefromclass(f);
    g = r(2) - f;
end