function g = dip_halftone(f, blockSize)
% Creates a halftone artistic effect from a grayscale image
%   f         - Grayscale image
%   blockSize - Size of each halftone cell (e.g., 8 or 10)
%   g         - Halftone image

% Convert input image to double in the range [0, 1].
f = im2double(f);

% Get number of rows and columns in image
[rows, cols] = size(f);

% Generate output image g as white background of same size as f
% (matrix of 1s of size (rows, cols))
g = ones(rows, cols);

% Loop r, from 1 to the number of rows - blockSize +1, with a step of size
% blockSize
for r = 1:blockSize:rows-blockSize+1
    for c = 1:blockSize:cols-blockSize+1
        
        % Extract a block by selecting a square region of f
        % of size (blockSize, blockSize)
        block = f(r:r+blockSize-1, c:c+blockSize-1);
        
        % Find the average intensity (value) in the block
        intensity = mean(block, "all");
        
        % Convert intensity to dot radius
        radius = (1 - intensity) * (blockSize/2);
        
        % Find the dot center
        cx = r + blockSize/2;
        cy = c + blockSize/2;
        
        % Draw circular dot
        for x = r:r+blockSize-1
            for y = c:c+blockSize-1
                if ((x - cx)^2 + (y - cy)^2) <= radius^2
                    g(x,y) = 0;
                end
            end
        end
    end
end
end