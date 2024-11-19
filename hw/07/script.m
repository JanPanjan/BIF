% clear workspace since we are about to load a lot of data
clear; clc; close all;  

% number of iterations for different cases (1e3 = 1 × 10^3)
iterations = [1e2, 1e4, 1e6];

% for each interval of iterations we make a counter for points inside of the "circle"
% and an array to store pi estimates
for k = 1:length(iterations)
    n_iter = iterations(k);
    points_inside = 0;
    pi_estimates = zeros(n_iter, 1);

    % [[ MONTE CARLO SIMULATION ]]
    % Generate random points and estimate pi
    for i = 1:n_iter
        % rand returns values in interval [0,1]. to make points around the origin
        % in (0,0) with radius of lenght 2, we multiply by 2 (now [0,2]) and subtract
        % 1 (now [-1,1])
        x = 2 * rand() - 1;
        y = 2 * rand() - 1;

        % for a circle - the point is either an inner or a boundary point if x 
        % and y satisfy this (in)equation
        if (x^2 + y^2 <= 1)
            points_inside = points_inside + 1;
        end
        
        % pi estimate is calculated as the ratio between circle and square
        % surface area. area of circle = pi × r^2, area of square = 2r × 2r.
        % let r = 1. now pi × 1^2 = pi => area of circle = pi, area of square = 4.
        % ratio = pi / 4 => ratio × 4 = pi, where ratio = points inside of circle.
        % the estimation if better with more points, as it is seen on the graph.
        pi_estimates(i) = 4 * points_inside / i;
    end
    
    relative_error = abs(pi_estimates - pi) / pi * 100;
    
    figure
    %       x           y
    plot(1:n_iter, pi_estimates, 'b')
    hold on
    yline(pi, 'r')
    xlabel('Iterations')
    ylabel('Estimated π value')
    title(sprintf('π estimation with %d iterations', n_iter))
    grid on
    
    fprintf('For %d iterations:\n', n_iter)
    fprintf('Final π estimate: %.6f\n', pi_estimates(end))
    fprintf('Final relative error: %.6f%%\n\n', relative_error(end))
end
