clear; clc; close all;

load('Chair.mat'); % loads joint_pos and cam_d

n = 1;              % skip every 1 point (no longer needed for static plots)
pauseTime = 0.1;    % pause time (no longer needed for static plots)
maxDist = 1.0;      % maximum distance (m)
minDist = 0.2;      % minimum distance (m)
pixelStep = 5;      % pixel skip

T = size(joint_pos,2);
pc_total = [];
trajectory = [];

for t = 1:T
    q = joint_pos(2:5, t);
    im = cam_d(:,:,t);
    
    pc_t = qarmCam2Global(q, im);
    
    if ~isempty(pc_t)
        pc_total = [pc_total; pc_t];
    end

    xi = qarmPose(q);
    pos = xi(1:3,4,6); % End effector position
    trajectory = [trajectory, pos];
end

% --- Plot 3D Point Cloud (Chair) ---
figure(1); clf;
scatter3(pc_total(:,1), pc_total(:,2), pc_total(:,3), 1, '.');
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
title('3D Point Cloud of Chair');
axis equal;
grid on;
view(3);

% --- Plot End-Effector Trajectory (Red Dots) ---
figure(2); clf;
pauseTime = 0.1; % 0.1 second between points
animateTrajectory(trajectory, n, pauseTime);