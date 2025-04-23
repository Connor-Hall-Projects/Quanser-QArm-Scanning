function animateTrajectory(locationTL, n, pauseTime)
    
    figure(2); 
    hold on;
    grid on;
    %xlabel('X (m)');
    %ylabel('Y (m)');
    %zlabel('Z (m)');
    title('Animated End Effector Trajectory');
    %axis equal;
    view(3); 

    % Animate
    for i = 1:n:size(locationTL, 2) %skip according to n
        % Swap X and Y to match 
        figure(2); 
        scatter3(locationTL(1,i), locationTL(2,i), locationTL(3,i), 20, 'r', 'filled');
        pause(pauseTime);
    end
end
