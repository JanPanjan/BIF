clear; close all;

%%%%% Constants
K = 8.99e9;    % Coulomb constant 1/(4*pi*ε0)
e0 = 1.6e-19;  % Elementary charge

% Create mesh
g = -1:0.01:1;
[xg, yg] = meshgrid(g);
d = 0.05;  % Radius of charge

%%%%% Charge 1 (negative)
q1 = -1*e0;
xp1 = -0.2;  % x coordinate of charge
yp1 = 0;    % y coordinate of charge
xi1 = xg - xp1;
yi1 = yg - yp1;
R1 = sqrt(xi1.^2 + yi1.^2);
V1 = q1*K./R1;
idx1 = (R1 < d);
V1max = K*q1/d;

%%%%% Charge 2 (positive)
q2 = 1*e0;
xp2 = 0.2;   % x coordinate of charge
yp2 = 0;     % y coordinate of charge
xi2 = xg - xp2;
yi2 = yg - yp2;
R2 = sqrt(xi2.^2 + yi2.^2);
V2 = q2*K./R2;
idx2 = (R2 < d);
V2max = K*q2/d;

%%%%% Sum potentials
V = V1 + V2;
V(idx1) = V1max;
V(idx2) = V2max;

%%%%% Plot
figure
contour(xg, yg, V, 100, ':k', 'LineWidth', 0.5)  % Plot contour lines in black
hold on
contourf(xg, yg, V, 100, 'LineStyle', 'none')    % Plot filled contours
colormap(jet)

% Add charge symbols with white background
plot(xp1, yp1, 'wo', 'MarkerFaceColor', 'b', 'MarkerSize', 10)  % Negative charge
plot(xp2, yp2, 'wo', 'MarkerFaceColor', 'r', 'MarkerSize', 10)  % Positive charge
text(xp1, yp1, '-', 'Color', 'w', 'FontSize', 14, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')
text(xp2, yp2, '+', 'Color', 'w', 'FontSize', 14, ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle')

axis equal
axis([-1 1 -1 1])
colorbar
title('Electrostatic Potential of Two Opposite Charges')
xlabel('x')
ylabel('y')

% Save figure
saveas(gcf, 'two_charges_potential.png')
