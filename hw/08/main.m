clear; close

% Define number of particles whose path we'll simulate
n_par = 100;
% Define number of steps or changes in position of each particle
n_step = 100;
% array to store last coordinates x and y of a particle
last_pos = zeros(n_par, 2);
% save absolute coordinate for x and y limits in plot
c_max = 0;

% for every particle calculate and plot its position
figure
hold on
for p = 1 : n_par
    % array to hold x and y coordinates for particle
    position = zeros(n_step, 2);

    % variables to store last position. starts at system origin.
    % each step new coordinates are added to last position
    x = 0;
    y = 0;

    for s = 1 : n_step
        % calculate x and y coordinate and store it in array
        % random value in [-1,1], since rand gives values in [0,1]
        x = x + 2 * rand - 1;
        y = y + 2 * rand - 1;
        position(s, 1) = x;
        position(s, 2) = y;
    end

    % update max coordinate
    tmp = max(abs(position), [], 'all');
    if tmp > c_max
        c_max = tmp;
    end

    % plot path of particle
    plot(position(:, 1), position(:, 2), 'Color', [0.5, 0.5, 0.5])  % gray color
    % plot(position(:, 1), position(:, 2))  % rainbow color
    drawnow  % animation :0

    % save last coordinates
    last_pos(p, :) = position(n_step, :);
end

% plot starting and ending position of each particle as blue points
% initial coordiantes are colored red
scatter(0, 0, 'r', 'filled')
% last particle coordinates are colored blue
scatter(last_pos(:, 1), last_pos(:, 2), 'b', 'filled');
xlim([-c_max * 1.1, c_max * 1.1])
ylim([-c_max * 1.1, c_max * 1.1])