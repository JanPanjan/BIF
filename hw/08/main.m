clear; close

% Define number of particles whose path we'll simulate
n_par = 100;
% Define number of steps or changes in position of each particle
n_step = 100;
% array to store last coordinates x and y of a particle
last_pos = zeros(n_par, 2);
% save absolute coordinate for x and y limits in plot
c_max = 0;

% get user input for wind direction and wind intensity
disp("tvoja")
wind_dir = input("Enter wind direction [degrees]: ");
wind_str = input("Enter wind strength: ");

% function makes a random number in interval [-1,1]
function r = gen_rand_num()
    r = 2 * rand - 1;
end

% for every particle it calculates and plots its position
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
        % [[ calculate x and y coordinate ]] 

        % wind_str is used to to make the step bigger in general.
        % Adds alpha to "normalize" inputs (0 means step will be coordinate 0)
        % (alpha was chosen through experimentation with different values).
        % Takes the absolute value of wind strength, to handle negative
        % values passed by the user.
        alpha = 0.3;
        str_influence = abs(wind_str) * alpha;
        
        % wind_dir is used with sin and cos to get x and y, respectively, to
        % make x and y bigger or smaller (or nothing) based on wind diretion.
        % Since sin and cos accept radians, the degree of angle passed as
        % wind_dir has to be converted first.
        %     e.g. wind_dir = 0 => North to South => all x coordinates get 
        %     smaller, while y coordinates don't change

        % Strength influence 0 means that no external force from wind is
        % affecting our particles, therefore angle influence will be put to
        % 0 by multiplication.
        wind_dir_rad = deg2rad(wind_dir);
        ang_influence_x = sin(wind_dir_rad) * str_influence;
        ang_influence_y = cos(wind_dir_rad) * str_influence;

        % get_rand_num makes a random number, that gets added to base
        % coordinates (0,0). Angle influence is subtracted, since sin and
        % cos point IN the wind direction. To make a particle move in the
        % opposite direction, the values are reversed.
        x = x + gen_rand_num() - ang_influence_x;
        y = y + gen_rand_num() - ang_influence_y;

        % x = x + 2 * rand - 1;
        % y = y + 2 * rand - 1;
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