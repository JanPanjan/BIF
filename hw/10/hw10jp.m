clear; close

% [[ CALCULATE ELECTROSTATIC POTENTIAL AROUND CHARGE ]]
K = 1 / (4 * pi * 8.85e-12);  % electrostatic constant
e = 1.6e-19;                  % charge of an electron
r = 0.1;                      % particle radius

% Create a 2D meshgrid for plotting
grid = -1 : 0.01 : 1;
[x_grid, y_grid] = meshgrid(grid);


% [ GET CHARGE OF THE FIRST PARTICLE (-) ]
% Charge can exist as an integral multiple of charge of and electron
% Charge of a negative particle is a positive value
q1 = -1 * e;

% Coordinates of charge
x_particle = 0.0; % sub both with 0.5 idk
y_particle = 0.0;
% Displacement between grid point and charge position
x_dis = x_grid - x_particle;
y_dis = y_grid - y_particle;

% Get the distance between two points to get diameter
R = sqrt( x_dis.^2 + y_dis.^2 );

% Potential around charge is calculated with formula V = qk/r
V_1 = (q1 * K) ./ R;

% Values inside of the particle radius
inside_1 = (R < r);

% Inside of a particle, electrostatic potential is constant (max value)
% Reuse the formula for V, but use r (particle radius) for r parameter
V_max_1 = (q1 * K) / r;


% [ GET CHARGE OF THE SECOND PARTICLE (+) ]
% Charge of a positive particle is a positive value
q2 = 1 * e;

% Coordinates of charge
x_particle = 0.3; % sub both with 0.5 idk
y_particle = 0.0;
% Displacement between grid point and charge position
x_dis = x_grid - x_particle;
y_dis = y_grid - y_particle;

% Get the distance between two points to get diameter
R = sqrt( x_dis.^2 + y_dis.^2 );

% Potential around particle
V_2 = (q2 * K) ./ R;

% Values inside of the particle radius
inside_2 = R < r;

% Potential inside of the particle
V_max_2 = (K * q2) / r;


% [ FIND WHERE CHARGE IS CONSTANT FOR BOTH PARTICLES ]
% To plot both charges, we take the sum of their electrostatic potential.
% Sum of both electrostatic potentials is electrostatic potential of the 
% system of observation(?)
V = V_1 + V_2;

% Set values where particles' charge is constant (inside of particle) to max 
% electrostatic potential
V(inside_1) = V_max_1;
V(inside_2) = V_max_2;


% [[ PLOT ]]
% Plots filled contous plot containing the isolines of matrix V
figure
contourf(x_grid, y_grid, V, 100, ':', 'LineWidth', 1)
% colormap(jet)

% plot middle point
% text(0,0,'-','FontSize',20,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle')
% text(0.3,0,'+','FontSize',20,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle')

% make x and y axis uniform
ax=gca;
axis(ax,'equal')