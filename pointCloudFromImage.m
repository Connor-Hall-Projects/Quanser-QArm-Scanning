function [pc] = pointCloudFromImage(im, maxDist, minDist, pixelStep)
    [R, C] = size(im);
    pc = [];
    lambda_px = 0.0017; % radians per pixel
    centerX = C / 2;
    centerY = R / 2;

    for r = 1:pixelStep:R %Pixel step functionality (3)
        for c = 1:pixelStep:C
            depth = im(r, c);
            if depth > minDist && depth < maxDist %Ignore values outside of range (3)
                % Horizontal and vertical angles
                theta_x = (c - centerX) * lambda_px; % horizontal
                theta_y = (r - centerY) * lambda_px; % vertical

                x = -depth * tan(theta_x); %I flipped depth to negative
                y = -depth * tan(theta_y); %I flipped depth to negative
                z = depth;

                pc = [pc; x, y, z];
            end
        end
    end
end
