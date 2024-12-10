% [[ GET DATA ]]
% read the data
data = readtable("benzene.dat");
% transform to matrix
% skip first line (string)
data = table2array(data(:, 2:5));


% [[ CREATE A 2D MESHGRID FOR PLOTTING ]]
% Find min and max coordinates for grid bounds
x_min = min(data(:,1)); x_max = max(data(:,1));
y_min = min(data(:,2)); y_max = max(data(:,2));
z_min = min(data(:,3)); z_max = max(data(:,2));
% Define a vector for grid
X = x_min - 1 : 0.02 : x_max + 1;
Y = y_min - 1 : 0.02 : y_max + 1;
% Make meshgrid
[x_grid, y_grid] = meshgrid(X, Y);


% [[ VARIABLES ]]
% sum of all potentials
V = zeros(size(x_grid));
% electrostatic constant
K = 1 / (4 * pi * 8.85e-12);
r = 0.1;


% [[ CALCULATE POTENTIALS ]]
% get potential for every particle (10 rows = 10 parcticles)
% calculate_potential_3D returns potential of charge
for i = 1 : size(data)
    V = V + calculate_potential_2D(x_grid, y_grid, data(i,1), data(i,2), data(i,4), K, r);
end


% [[ PLOT ]]
figure
contourf(x_grid, y_grid, V, 100, ':', 'LineWidth', 1)
colormap(jet)
ax=gca;
axis(ax,'equal')

figure
contour(x_grid, y_grid, V, 100, ':', 'LineWidth', 1)
colormap(jet)
ax=gca;
axis(ax,'equal')

figure
contourf(x_grid, y_grid, V, 100, 'LineStyle', 'none')
colormap(jet)
hold on
ax=gca;
axis(ax,'equal')