%% Define function
syms x
f = @(x) x.^2-10*x-20; 
%plot function
fplot(f,[-5,15],'b','LineWidth',2)
ax=gca;
xlim([-5 15])
ylim([-50 50])
yticks(-45:10:45);
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
yline(0,'LineWidth',2); %horizontal line
ylabel('f(x)','FontSize',18);
ytickformat('%3i');
xlabel('X','FontSize',18);
xtickformat('%.2f');
title('Bisection','FontSize',18)
set(gca, 'Position', [0.15,0.15,0.75,0.75]);

%% BISECTION
% Inital interval a, b
a=0;
b=14;
xline([a,b]); %vertical lines for Inital interval a, b
hold on
scatter([a b],[f(a) f(b)],100,'b','filled'); % inital points
fprintf('----------BISECTION-----------------\n');
p = BISECTION(f,a,b); % we call a function BISECTION
%solution
Y=f(p);
X=p;
fprintf('X: %15.5f Y: %15.5f\n',X,Y);
hold on
scatter(X,Y,100,'r','filled'); % red dot, SOLUTION !!

%% function fzero / Root of nonlinear function
% The algorithm, created by T. Dekker, uses a combination of bisection, 
% secant, and inverse quadratic interpolation methods
fprintf('----------fzero-----------------\n');
% inetrval or just one initial point
x0=14; % inital point, wee need just one
%x0 = [0 14]; % initial interval
options = optimset('Display','iter');
[s,fval] = fzero(f,x0,options);
XX=s; % solution
YY=fval; % the value f(XX)
fprintf('X: %15.5f Y: %15.5f\n',XX,YY);

%% bisection
% Now you now how to find the zero for function f = @(x) x.^2-10*x-20
% How would you find the zero of function from "The river/boat steering" ?
% F = @(x) cos(x)./sin(x)+eta./sin(x);
% For which interval of eta is useful?
eta = 0.5;
F = @(x) cos(x)./sin(x)+eta./sin(x);
%interval [a,b]
a=0; % degrees
b=180; % degrees
a=deg2rad(a);
b=deg2rad(b);
p=BISECTION(F,a,b);
% sin and cos are using rad >> convert to deg
p=rad2deg(p);
fprintf("Optimal angle: %6.2f \n",p);

%% fzero
eta = 0.5;
F = @(x) cos(x)./sin(x)+eta./sin(x);
% inial point x0
x0=110; % degrees
x0=deg2rad(x0);
options = optimset('Display','iter');
[s,fval] = fzero(F,x0,options);
s=rad2deg(s);
fprintf("Optimal angle: %6.2f \n",s);
