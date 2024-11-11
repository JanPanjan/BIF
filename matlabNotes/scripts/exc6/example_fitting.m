
clear all
close all

%% five points
x=[-5;-2;1;2;3;4;5];
y=[-5;5;1.2;3.9;10;25;46];

%% plot scatter
figure
scatter(x,y,50,'red','filled') % size, color, filled
ax=gca;
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;
xlim([-7 7])
ylim([-20 60])
ylabel('Y','FontSize',20);
xlabel('X','FontSize',20);
saveas(gcf,'five_points.png');

%% do some fitin, first, second, third order
[f fo]=fit(x,y,'poly1') % first order > linear function
[f fo]=fit(x,y,'poly2') % second order > quadratic function
[f fo]=fit(x,y,'poly3') % 3rd order > cubic function

% check "fo"; goodness-of-fit statistics
% sse; Sum of squares due to error
% rsquare; R-squared (coefficient of determination)
% dfe; Degrees of freedom in the error
% adjrsquare; Degree-of-freedom adjusted coefficient of determination
% rmse; Root mean squared error (standard error)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Let's choose poly1
[f fo]=fit(x,y,'poly1');
formula(f) % print function/formula
coeffnames(f) % coefficent names p1 p2 ...
cv=coeffvalues(f); %extract coeff. values
cv
%% linear function y=kx+n
k=cv(1);
n=cv(2);

syms X
myfun= @(X) k*X+n;

%% plot fitted curve
figure
scatter(x,y,50,"red",'filled') % five points
ax=gca;
xlim([-7 7])
ylim([-20 60])
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;
ylabel('Y','FontSize',20);
xlabel('X','FontSize',20);

hold on
fplot(myfun,'LineWidth',2,'Color','blue') % fitted quadratic function
saveas(gcf,'fitted_five_points_poly1.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% poly2
[f fo]=fit(x,y,'poly2');
formula(f)
coeffnames(f)
cv=coeffvalues(f); %extract coeff. values
cv
%% quadratic function / coefficients
A=cv(1);
B=cv(2);
C=cv(3);
syms X
myfun= @(X) A.*X.^2+B.*X+C;

%% plot fitted curve
figure
scatter(x,y,50,"red",'filled') % five points
ax=gca;
xlim([-7 7])
ylim([-20 60])
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;
ylabel('Y','FontSize',20);
xlabel('X','FontSize',20);

hold on
fplot(myfun,'LineWidth',2,'Color','blue') % fitted quadratic function
saveas(gcf,'fitted_five_points_poly2.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% poly3
[f fo]=fit(x,y,'poly3');
formula(f)
coeffnames(f)
cv=coeffvalues(f); %extract coeff. values
cv
%% quadratic function / coefficients
A=cv(1);
B=cv(2);
C=cv(3);
D=cv(4);
syms X
myfun= @(X) A.*X.^3 + B.*X.^2  +C.*X +D;

%% plot fitted curve
figure
scatter(x,y,50,"red",'filled') % five points
ax=gca;
xlim([-7 7])
ylim([-20 60])
ax.XAxis.FontSize = 18;
ax.YAxis.FontSize = 18;
ylabel('Y','FontSize',20);
xlabel('X','FontSize',20);

hold on
fplot(myfun,'LineWidth',2,'Color','blue') % fitted quadratic function
saveas(gcf,'fitted_five_points_poly3.png');

