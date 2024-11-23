% plots a circle in area [-2,2] in both x and y axis with coordinate axes
fprintf("sin(1): %d\n", sin(deg2rad(1)));
fprintf("sin(0): %d\n", sin(deg2rad(0)));
fprintf("cos(1): %d\n", cos(deg2rad(1)));
fprintf("cos(0): %d\n", cos(deg2rad(0)));

% Plot the axes lines first
hold on  % allows multiple plots on same figure
plot([-1.5 1.5], [0 0], 'k-', 'LineWidth', 1)  % x-axis in both x and y axis
plot([0 0], [-1.5 1.5], 'k-', 'LineWidth', 1)  % y-axis

% Plot the circle
theta = linspace(0, 2*pi, 100);  % create 100 points around the circle
r = 1;  % radius of the circle
x = r * cos(theta);  % x coordinates
y = r * sin(theta);  % y coordinates

plot(x, y);  % plot the circle
axis equal;  % make the aspect ratio 1:1
grid on;     % add grid
xlim([-1.5 1.5]);  % set x axis limits
ylim([-1.5 1.5]);  % set y axis limits
title('Unit Circle with Coordinate Axes');

scatter(1, 0, 'filled');
scatter(-1, 0, 'filled');
scatter(0, 1, 'filled');
scatter(0, -1, 'filled');


hold off    % release the plot hold
