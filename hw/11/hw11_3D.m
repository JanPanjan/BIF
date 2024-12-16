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
z_min = min(data(:,3)); z_max = max(data(:,3));
% Define a vector for grid
X = x_min - 1 : 0.02 : x_max + 1;
Y = y_min - 1 : 0.02 : y_max + 1;
Z = z_min - 1 : 0.02 : z_max + 1;
% Make meshgrid
[x_grid, y_grid, z_grid] = meshgrid(X, Y, Z);


% [[ VARIABLES ]]
% sum of all potentials
V = zeros(size(x_grid));



% [[ CALCULATE POTENTIALS ]]
% get potential for every particle (10 rows = 10 parcticles)
% calculate_potential_3D returns potential of charge
for i = 1 : size(data, 1)
    V = V + calculate_potential_3D(x_grid, y_grid, z_grid, data(i,1), data(i,2), data(i,3), data(i,4));
end


% [[ PLOT ]]
figure

% 10% of max/min positive potential
max_10 = max(V(:)) * 0.1;
min_10 = min(V(:)) * 0.1; 

isosurface(x_grid, y_grid, z_grid, V, max_10); 
colormap jet;

% Plot positive potential isosurfaces
patch_1 = patch(isosurface(x_grid, y_grid, z_grid, V, max_10));
set(patch_1, 'FaceColor', 'red', 'EdgeColor', 'none', 'FaceAlpha', 0.7);

% Plot negative potential isosurfaces
patch_2 = patch(isosurface(x_grid, y_grid, z_grid, V, min_10));
set(patch_2, 'FaceColor', 'blue', 'EdgeColor', 'none', 'FaceAlpha', 0.7);

% Plot zero-level surface (green background)
patch_3 = patch(isosurface(x_grid, y_grid, z_grid, V, 0));
set(patch_3, 'FaceColor', 'green', 'EdgeColor', 'none', 'FaceAlpha', 0.3);

ax=gca;
axis(ax,'equal')