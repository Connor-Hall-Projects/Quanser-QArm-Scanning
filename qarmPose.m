function [xi] = qarmPose(q)
    
    limit = [-2.9671, 2.9671;
        -1.4835, 1.4835;
        -1.6581, 1.3090;
        -2.7925, 2.7925];

    if length(q) ~= 4
        xi = nan(4,4,6);
        return;
    end

    if any(q < limit(:,1)') | any(q > limit(:,2)')
        xi = nan(4,4,6);
        return;
    end

    J1 = poseDH(q(1), 0.14, 0, -pi/2);
    J2 = poseDH(q(2) - 1.4289, 0, 0.3535, 0);
    J3 = poseDH(q(3) - 0.14189, 0, 0, -pi/2);
    J4 = poseDH(q(4), 0.315, 0, 0);

    xi(:,:,1) = eye(4);         % global frame
    xi(:,:,2) = eye(4);         % first joint (base)
    xi(:,:,3) = J1;             % second joint
    xi(:,:,4) = J1 * J2;        % third joint
    xi(:,:,5) = J1 * J2 * J3;   % fourth joint
    xi(:,:,6) = J1 * J2 * J3 * J4; % end effector
end

%Reject values outside of mechanical limits