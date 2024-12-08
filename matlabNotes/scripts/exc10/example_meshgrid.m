clear

%% example 1 >  sinus and quadratic f.
x = -2*pi:0.1:2*pi; % grids
y = -3:0.1:3; % grids
[X,Y] = meshgrid(x,y); % create mesh grid

Z = sin(5*X) + Y.^2;

close all
figure
contourf(X,Y,Z,10) % 

figure
surf(X,Y,Z); % surface


%% example 1 >  qubic and quadratic
x = -3:0.1:3; % grids
y = -3:0.1:3; % grids
[X,Y] = meshgrid(x,y); % create mesh grid

Z = -X.^3 + 3*Y.^2;

close all
figure
contourf(X,Y,Z,10) % 

figure
surf(X,Y,Z); % surface