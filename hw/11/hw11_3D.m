% [[ GET DATA ]]
% read the data
data = readtable("benzene.dat");
% transform to matrix
% skip first line (string)
data = table2array(data(:, 2:5));


% [[ CREATE A 2D MESHGRID FOR PLOTTING ]]
% Find min and max coordinates for grid bounds
minC = min([min(data(:,1)), min(data(:,2)), min(data(:,3))]);
maxC = max([max(data(:,1)), max(data(:,2)), max(data(:,3))]);
distMinMax = maxC - minC;
step = distMinMax / 250;

% Make meshgrid
[x_grid, y_grid, z_grid] = meshgrid(minC*1.3 : step : maxC*1.3);


% [[ VARIABLES ]]
% sum of all potentials
V = zeros(size(x_grid));


% [[ CALCULATE POTENTIALS ]]
% get potential for every particle (10 rows = 10 parcticles)
% calculate_potential_3D returns potential of charge
for i = 1 : size(data, 1)
    %                                                                                      % dodal minus
    V = V + calculate_potential_3D(x_grid, y_grid, z_grid, data(i,1), data(i,2), data(i,3), -data(i,4));
end


% [[ PLOT ]]
figure

% draw all 3 layers/components
isosurface(x_grid, y_grid, z_grid, V, 0)
colormap(jet)
hold on 
isosurface(x_grid, y_grid, z_grid, V, 1.0e-10)
isosurface(x_grid, y_grid, z_grid, V, -1.0e-10)
ax=gca;
axis(ax,'equal')