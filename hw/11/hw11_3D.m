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
V2D = V(:,:,50);
V2 = squeeze(V2D);
% electrostatic constant
K = 1 / (4 * pi * 8.85e-12);
r = 0.1;


% [[ CALCULATE POTENTIALS ]]
% get potential for every particle (10 rows = 10 parcticles)
% calculate_potential_3D returns potential of charge
for i = 1 : size(data)
    V = V + calculate_potential_3D(x_grid, y_grid, z_grid, data(i,1), data(i,2), data(i,3), data(i,4), K, r);
end


% [[ PLOT ]]
figure
% isosurface(x_grid, y_grid, z_grid, V, 1.0e-10, 'r')
% hold on
% isosurface(x_grid, y_grid, z_grid, V, 1.0e-9, 'g')
% isosurface(V2, 1.0e-9, 'g')
isosurface(V2D, 1.0e-10, 'g')
% hold on
% isosurface(x_grid, y_grid, z_grid, V, -1.0e-10, 'b')

ax=gca;
axis(ax,'equal')