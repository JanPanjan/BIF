clear; close

% [[ CALCULATE ELECTROSTATIC POTENTIAL AROUND CHARGE ]]
K   = 1 / (4 * pi * 8.85e-12);  % electrostatic constant
e   = 1.6e-19;                  % charge of an electron
q_O = -2 * e;                   % oxygen charge
q_H =  1 * e;                   % hydrogen charge
r   = 0.1;                      % particle radius

% Create a 2D meshgrid for plotting
grid = -1 : 0.01 : 1;
[x_grid, y_grid] = meshgrid(grid);

% [ GET POSITION OF FIRST WATER MOLECULE (LEFT) ]
% Oxygen
O1_x = -0.3;          O1_y = -0.3;
% Two hydrogens
H1_x_L = O1_x - 0.2;  H1_y_L = O1_y - 0.2;
H1_x_R = O1_x + 0.2;  H1_y_R = O1_y - 0.2;

% [ GET POSITION OF SECOND WATER MOLECULE (RIGHT) ]
% Oxygen
O2_x = 0.3;          O2_y = 0.3;
% Two hydrogens
H2_x_L = O2_x - 0.2;  H2_y_L = O2_y - 0.2;
H2_x_R = O2_x + 0.2;  H2_y_R = O2_y - 0.2;

% [ CALCULATE ELECTROSTATIC POTENTIAL FOR EACH PARTICLE ]
% Electrostatic potential for every particle will be calculated with calculate_potential function
% Params:
%     x_grid, y_grid: mesh grid coordinates
%     x_p, y_p: particle x and y coordinates
%     q: charge of a particle (negative for O, positive for H)
%     K: Coulomb's constant (beginning of script)
%     r: radius of particle, where potential is constant
% Returns: 
%     array, where V_particle is particle potential
function [V_particle] = calculate_potential(x_grid, y_grid, x_p, y_p, q, K, r)
    % Calculates displacement - distance between 
    % each grid point and particle position for R
    x_dis = x_p - x_grid;
    y_dis = y_p - y_grid;

    % Calculates distance between each grid point and the particle with Pythagoream's theorem
    R = sqrt( x_dis.^2 + y_dis.^2 );

    % Calculates particle potential using formula V = qk/r (check params), where r is R
    % This is how much the particle contributes to system of obervation's(?) electrostatic potential
    V_particle = (q * K) ./ R;

    % Gets points inside (or near) of the particle, where potential is constant
    id = (R < r);
    % Calculates maximum potential found in this area
    V_max = (q * K) / r;
    % Sets values of potentials inside of the particle to this value
    V_particle(id) = V_max;
end

% [ CALCULATE ELECTROSTATIC POTENTIAL FOR FIRST WATER MOLECULE (LEFT) ]
[V_O1]    = calculate_potential(x_grid, y_grid, O1_x,   O1_y,   q_O, K, r);
[V_H1_L]  = calculate_potential(x_grid, y_grid, H1_x_L, H1_y_L, q_H, K, r);
[V_H1_R]  = calculate_potential(x_grid, y_grid, H1_x_R, H1_y_R, q_H, K, r);

V_H20_1 = V_O1 + V_H1_L + V_H1_R;

% [ CALCULATE ELECTROSTATIC POTENTIAL FOR SECOND WATER MOLECULE (RIGHT) ]
[V_O2]   = calculate_potential(x_grid, y_grid, O2_x,   O2_y,   q_O, K, r);
[V_H2_L] = calculate_potential(x_grid, y_grid, H2_x_L, H2_y_L, q_H, K, r);
[V_H2_R] = calculate_potential(x_grid, y_grid, H2_x_R, H2_y_R, q_H, K, r);

V_H20_2 = V_O2 + V_H2_L + V_H2_R;

% [ CALCULATE SYSTEM OF OBSERVATION ELECTROSTATIC POTENTIAL ]
% Sum of all electrostatic potentials
V = V_H20_1 + V_H20_2;

% e.g. why this is needed
% V = V_H20_1;
% V = V_H20_2;
% V = zeros(size(x_grid));


% [[ PLOT ]]
figure
contourf(x_grid, y_grid, V, 100, ':', 'LineWidth', 1)
ax=gca;
axis(ax,'equal')

figure
contourf(x_grid, y_grid, V, 100, 'LineStyle', 'none')
hold on
% plots dashed line that represents a hydrogen bond
plot([O1_x + r, H2_x_L - r], [O1_y + r, H2_y_L - r], 'Color', 'black', 'LineStyle', '--', 'LineWidth', 2)
ax=gca;
axis(ax,'equal')