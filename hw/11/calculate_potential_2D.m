function [V_particle] = calculate_potential_2D(x_grid, y_grid, x_p, y_p, q, K, r)
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