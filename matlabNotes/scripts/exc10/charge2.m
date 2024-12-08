clear; close

%%%%% calculating electrostatic potential around charge
K=8.99*10^9; % constant 1/(4*pi*Eps0), where Eps0= 8.85E-12 Farad per meter (F/m)
e0=1.6E-19;  % Charge of an electron
% create mesh
g=-1:0.01:1;
% create 2D mesh grid
[xg,yg]=meshgrid(g);
% inside charge set constant value
d = 0.1; % the "radius" of charge
%%
%%%%% charge 1
q1=-1*e0; % (-1) Electric charge can exist only as an integral multiple of charge of an electron
% The Possible values of electric charge are q = ± 1e0; ± 2e0; ± 3e0...
xp=0; % x coordinate of charge
yp=0; % y coordinate of charge
xi=xg-xp; % displacement between grid point and charge, X component
yi=yg-yp; % displacement between grid point and charge, Y component
R=sqrt(xi.^2 + yi.^2); %
V1=q1*K./R; % V=e/(4*pi*eps*r)
idx1=(R<d); % grids inside the radious
V1max = K*q1 / d;

%%%%% charge 2
q2=1*e0; % (+1) Electric charge can exist only as an integral multiple of charge on an electron
% The Possible values of electric charge are q = ± 1e0; ± 2e0; ± 3e0...
xp=0.3; % x coordinate of charge
yp=0.0; % y coordinate of charge
xi=xg-xp; % displacement between grid point and charge, X component
yi=yg-yp; % displacement between grid point and charge, Y component
R=sqrt(xi.^2 + yi.^2); %
V2=q2*K./R; % V=e/(4*pi*eps*r)
idx2=(R<d); % grids inside the radious
V2max = K*q2 / d;

%% sum (contribution of both chrages) and find max value 
V=V1+V2; % contribution of both chrages !!!!
V(idx1)=V1max; % set constant value inside the charge
V(idx2)=V2max; % set constant value inside the charge

%% plot
figure
%contourf(xg,yg,V)
contourf(xg,yg,V,100,':','LineWidth',1) % filled contour plot containing the isolines of matrix Z
colormap(jet)
text(0,0,'-','FontSize',20,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle')
text(0.3,0,'+','FontSize',20,'Color','w','HorizontalAlignment','center','VerticalAlignment','middle')
ax=gca;
axis(ax,'equal')
saveas(gcf,'Figure_charge2.png')

% figure
% s=surf(xg,yg,V); % surface
% s.EdgeColor = 'none';
% saveas(gcf,'Figure_charge21.png')