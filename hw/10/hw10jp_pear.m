clear; close all;

% Constants
K = 8.99e9;    % Coulomb constant 1/(4*pi*ε0)
e0 = 1.6e-19;  % Elementary charge
q_o = -2*e0;   % Oxygen charge (negative)
q_h = 1*e0;    % Hydrogen charge (positive)

% Create mesh grid
g = -1:0.01:1;
[xg, yg] = meshgrid(g);
d = 0.05;  % Radius of charge visualization

% First water molecule positions
x_o1 = -0.3; y_o1 = 0;        % Oxygen 1
x_h1a = -0.3-0.2; y_h1a = 0.1; % Hydrogen 1a
x_h1b = -0.3-0.2; y_h1b = -0.1; % Hydrogen 1b

% Second water molecule positions
x_o2 = 0.3; y_o2 = 0;        % Oxygen 2
x_h2a = 0.3+0.2; y_h2a = 0.1; % Hydrogen 2a
x_h2b = 0.3+0.2; y_h2b = -0.1; % Hydrogen 2b

% Calculate potential for each charge
V = zeros(size(xg));

% Function to calculate potential
function [V_part, idx] = calc_potential(xg, yg, q, xp, yp, K, d)
    xi = xg - xp;
    yi = yg - yp;
    R = sqrt(xi.^2 + yi.^2);
    V_part = q*K./R;
    idx = (R < d);
    V_max = K*q/d;
    V_part(idx) = V_max;
end

% Calculate for first water molecule
[V1, idx1] = calc_potential(xg, yg, q_o, x_o1, y_o1, K, d);
[V2, idx2] = calc_potential(xg, yg, q_h, x_h1a, y_h1a, K, d);
[V3, idx3] = calc_potential(xg, yg, q_h, x_h1b, y_h1b, K, d);

% Calculate for second water molecule
[V4, idx4] = calc_potential(xg, yg, q_o, x_o2, y_o2, K, d);
[V5, idx5] = calc_potential(xg, yg, q_h, x_h2a, y_h2a, K, d);
[V6, idx6] = calc_potential(xg, yg, q_h, x_h2b, y_h2b, K, d);

% Sum all potentials
V = V1 + V2 + V3 + V4 + V5 + V6;

% Plot
figure
contourf(xg, yg, V, 50, 'LineStyle', 'none')
% colormap(jet)
hold on

% Plot charges
% plot(x_o1, y_o1, 'wo', 'MarkerFaceColor', 'r', 'MarkerSize', 10) % Oxygen
% plot(x_h1a, y_h1a, 'wo', 'MarkerFaceColor', 'b', 'MarkerSize', 8) % Hydrogen
% plot(x_h1b, y_h1b, 'wo', 'MarkerFaceColor', 'b', 'MarkerSize', 8) % Hydrogen

% plot(x_o2, y_o2, 'wo', 'MarkerFaceColor', 'r', 'MarkerSize', 10) % Oxygen
% plot(x_h2a, y_h2a, 'wo', 'MarkerFaceColor', 'b', 'MarkerSize', 8) % Hydrogen
% plot(x_h2b, y_h2b, 'wo', 'MarkerFaceColor', 'b', 'MarkerSize', 8) % Hydrogen

% Draw hydrogen bonds
plot([x_h1b, x_o2], [y_h1b, y_o2], 'k--')

colorbar
axis equal
title('Electrostatic Potential Around Water Molecules')
xlabel('x')
ylabel('y')

% Save figure
saveas(gcf, 'water_molecules_potential.png')
