function [xi] = poseDH(theta, d, r, alpha)

    xi = [cos(theta), -sin(theta)*cos(alpha),  sin(theta)*sin(alpha), r*cos(theta);
          sin(theta),  cos(theta)*cos(alpha), -cos(theta)*sin(alpha), r*sin(theta);
          0,          sin(alpha),             cos(alpha),             d;
          0,          0,                      0,                      1];

end