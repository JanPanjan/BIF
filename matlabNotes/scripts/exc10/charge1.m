
clear; close

%%%%% calculating electrostatic potential around charge
K=8.99*10^9; % constant 1/(4*pi*Eps0), where Eps0= 8.85E-12 Farad per meter (F/m)
e0=1.6E-19;  % Charge of an electron

% create mesh
% start: -1
% end: 1
% step: 0.02
g=-1:0.02:1; % grid step is 0.02
% create 2D mesh grid
[xg,yg]=meshgrid(g);
%%
%%%%% charge 1
q1=1*e0; % Electric charge can exist only as an integral multiple of charge of an electron
% The Possible values of electric charge are q = ± 1e0; ± 2e0; ± 3e0...
% xp=0; % x coordinate of charge - the orgin is in 0.0
% yp=0; % y coordinate of charge - the orgin is in 0.0
xp=0.5; % x coordinate of charge - the orgin is in 0.5
yp=0.5; % y coordinate of charge - the orgin is in 0.5
xi=xg-xp; % displacement between grid point and charge, X component
yi=yg-yp; % displacement between grid point and charge, Y component

% razdalja med x in y je polmer
R=sqrt(xi.^2 + yi.^2); %
V=q1*K./R; % V=e/(4*pi*eps*r) >> potenital around charge

%%
% inside "circle" is constant (max) value, radius of chrage is d=0.1
d = 0.1; % this is "radious of charge"
Vmax = K*q1 / d;
V(R<d)=Vmax; % inside radius: set to Emax value (we can not calculate E. potential inside the charge)
% plot
figure
contourf(xg,yg,V)
colormap(jet)
text(0,0,'+','FontSize',20,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle')
ax=gca;
axis(ax,'equal')
saveas(gcf,'Figure_charge1.png')

% figure
% s=surf(xg,yg,V);
% colormap(jet)
% s.EdgeColor = 'none';
% saveas(gcf,'Figure_charge11.png')