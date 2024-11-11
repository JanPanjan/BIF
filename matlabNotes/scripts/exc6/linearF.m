
clear all;
clc;
close all;

%% y = kx + n;
disp('Linear function')
disp('Calculates a slope (k) and distance (n) given two points.')
%
x1=input('Coordinates of x1: ');
y1=input('Coordinates of y1: ');
x2=input('Coordinates of x2: ');
y2=input('Coordinates of y2: ');

%% calculate slope and displacement
k=(y2-y1)/(x2-x1);
n=y1-k*x1;
%y2-k*x2=n

%% print results
fprintf('k= %4.2f   n=%4.2f\n',k,n);
fprintf(' y=%4.2fx+(%4.2f) \n',k,n);

%% define function
syms X
f=@(X) k*X + n;

%% plot points and function
x12=[x1 x2];
y12=[y1 y2];
scatter(x12,y12,50,'red','filled')
hold on

fplot(f,'blue',LineWidth=2);
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
ylabel('Y','FontSize',18)
xlabel('X','FontSize',18)
xline(0);
yline(0);
mytitle=sprintf(' y=%4.2fx+(%4.2f) \n',k,n);
title(mytitle,'FontSize',18)

saveas(gcf,'LinerF_input.png');