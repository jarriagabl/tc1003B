function g = dip_rgb2gray(f)
% Transforms a RGB image into grayscale
%   f: a RGB image
%   g: resulting grayscale image
    f = uint16(f);
    [red, green, blue] = imsplit(f);
    g = (red + green + blue) / 3;
    % Alternative
    % g = (f(:,:,1) + f(:,:,2) + f(:,:,3)) / 3;
    g = uint8(g);
end