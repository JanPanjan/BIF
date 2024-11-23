clear; close

% Define number of particles whose path we'll simulate
n_par = 100;
% Define number of steps or changes in position of each particle
n_step = 100;
% Array to store last coordinates x and y of a particle
last_pos = zeros(n_par, 2);
% Save absolute coordinate for x and y limits in plot
c_max = 0;

% Gets user input for wind direction and wind intensity
wind_dir = input("Enter wind direction [degrees]: ");
wind_str = input("Enter wind strength: ");

% Function makes a random number in interval [-1,1].
function r = gen_rand_num()
    r = 2 * rand - 1;
end

% For every particle it calculates and plots its position.
figure
hold on
for p = 1 : n_par
    % Array to hold x and y coordinates for every step the particle makes
    position = zeros(n_step, 2);

    % Variables to store last position. Starts at system origin.
    % Each new step new coordinates are added to last position.
    x = 0;
    y = 0;

    for s = 1 : n_step
        % [[ CALCULATES X AND Y COORDINATE ]] 

        % wind_str is used to to make the step bigger in general.
        % Adds alpha to "normalize" inputs (0 means step will be at coordinates (0,0))
        % (alpha was chosen through experimentation).
        % Takes the absolute value of wind strength, to handle negative
        % values passed by the user.
        alpha = 0.3;
        str_influence = abs(wind_str) * alpha;
        
        % wind_dir is used with sin and cos to get x and y coordinates, respectively
        % Since sin and cos accept radians, degrees passed as wind_dir have to be 
        % converted first (script accepts degrees as unit, since thinking in degrees
        % is more intuitive for most in my opinion).
        wind_dir_rad = deg2rad(wind_dir);

        % Strength influence 0 means that no external force from wind is
        % affecting our particles, therefore angle influence will be put to
        % 0 by multiplication. 
        ang_influence_x = sin(wind_dir_rad) * str_influence;
        ang_influence_y = cos(wind_dir_rad) * str_influence;

        % A random number gets added to base coordinates (0,0). 
        % Angle influence is subtracted, since sin and cos values point IN the direction of wind. 
        % To make a particle move in the opposite direction, the values are reversed (subtracted).
        x = x + gen_rand_num() - ang_influence_x;
        y = y + gen_rand_num() - ang_influence_y;

        % Saves new coordinates to position array.
        position(s, 1) = x;
        position(s, 2) = y;
    end

    % Updates max coordinate.
    tmp = max(abs(position), [], 'all');
    if tmp > c_max
        c_max = tmp;
    end

    % Plots path of particle.
    plot(position(:, 1), position(:, 2), 'Color', [0.5, 0.5, 0.5])  % gray color
    drawnow  % wacky animation

    % Saves last coordinates.
    last_pos(p, :) = position(n_step, :);
end

% Plots starting and ending position of each particle as blue points
% Coordinates (0,0) are colored red, to get a grasp of the distribution of particles
% around the origin.
scatter(0, 0, 'r', 'filled')

% Last particle coordinates (particles' last positons) are colored blue.
scatter(last_pos(:, 1), last_pos(:, 2), 'b', 'filled');
xlim([-c_max * 1.1, c_max * 1.1])
ylim([-c_max * 1.1, c_max * 1.1])
