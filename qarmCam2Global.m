function [pc_t] = qarmCam2Global(q, im)
    xi = qarmPose(q); % call qarmPose

    % Local point cloud from camera
    pc_local = pointCloudFromImage(im, 1.0, 0.2, 5);

    if isempty(pc_local)
        pc_t = [];
        return;
    end

    % Camera position relative to end-effector
    cam_pos = [0.05; 0; -0.095];
    cam_rot = eul2rotm([-pi/2, 0, 0], 'ZYX') %Corrected by - in point cloud
  

    T_ce = [cam_rot, cam_pos; 0 0 0 1];
    T_ge = xi(:,:,6);
    T_gc = T_ge * T_ce;

    % Transform points to global
    pc_local_hom = [pc_local, ones(size(pc_local,1),1)]'; % 4×N
    pc_global_hom = T_gc * pc_local_hom;                  % 4×N
    pc_t = pc_global_hom(1:3, :)';                        % N×3
end
