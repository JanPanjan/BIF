%%
clear all
close

% Learn how to improve Figures/plots

%% Plot, axes, labels, Font size
F1 = @(x) cos(x);
F2 = @(x) -sin(x);
F3 = @(x) -cos(x);

fplot(F1,[0 2*pi],'color','b','LineWidth',2); % b is for Blue
hold on % use this to plot over the previous plot
fplot(F2,[0 2*pi],'color','r','LineWidth',2); % r is for Red
fplot(F3,[0 2*pi],'color','k','LineWidth',2); % k is for blacK
hold off 

ax=gca; % Get handle to current axis.
ylim([-1.2 1.2]) % Y axis limit
ax.XAxis.FontSize = 16; % font size of X axis
ax.YAxis.FontSize = 16; % font size of Y axis
ytickformat('%.2f'); % two decimal placaes on  Y axis
ylabel('Y','FontSize',18); % label at Y axis
xlabel('alpha \alpha','FontSize',18); % abel at X axis, see \alpha !!!

saveas(gcf,'sin_cos_example1.png')

%% Miscelenius, Plot, axes, labels, Font size
close all

F1 = @(x) cos(x);
F2 = @(x) -sin(x);
F3 = @(x) -cos(x);

fplot(F1,[0 2*pi],'color','b','LineWidth',2); % b is for Blue
hold on % use this to plot over the previous plot
fplot(F2,[0 2*pi],'color','r','LineWidth',2); % r is for Red
%hold on
fplot(F3,[0 2*pi],'color','k','LineWidth',2); % k is for blacK
hold off

ax=gca; % Get handle to current axis.
%xlim([-0.1 3.2])
ylim([-1.2 1.2]) % Y axis limit
ax.XAxis.FontSize = 16; % font size of X axis
ax.YAxis.FontSize = 16; % font size of Y axis
ytickformat('%.2f'); % two decimal placaes for number as Y axis
ylabel('Y','FontSize',18); % label at Y axis
%xlabel('alpha \alpha','FontSize',18); % abel at X axis, see \alpha !!!
xt=0:(pi/4):(2*pi); % create array, coordinates where to place label
set(gca,'XTick',xt,'XTickLabel','') % remove labels at X axis >> it is empty ''
%xt=0:(pi/4):(2*pi); % create array, coordinates where to place label
text(xt,-1.25*ones(size(xt)),{'0','$\frac{\pi}{4}$','$\frac{\pi}{2}$','$\frac{3\pi}{4}$','$\pi$','$\frac{5\pi}{4}$','$\frac{3\pi}{2}$','$\frac{7\pi}{4}$','$2\pi$'}, ...
            'horizontal','center','vertical','top','FontSize',22,'Interpreter','latex')
xline(xt); %vertical lines
saveas(gcf,'sin_cos_example2.png')

%% FOR LOOP Example
disp('------------------- step 1');
for i=1:10 % step 1
    fprintf('%2i\n',i)
end  
disp('------------------- step 10');
for j=10:10:100 %step 10
    fprintf('%2i\n',j)
end 
disp('------------------- step -2');
for i=100:-2:80 % 
    fprintf('%2i\n',i)
end 
%% FIND functions extreme points - quadratic finction
% define function
syms x
f = x^2 - 4*x + 3; % Define the quadratic function

% Differentiate the function
df = diff(f, x); 

% Solve for the critical points (where df/dx = 0)
extrema = solve(df == 0, x); 

 % Evaluate the critical point(s)
extrema_value = eval(extrema);

% Evaluate the function at the critical point(s)
y_value = subs(f, extrema_value); 

% Display the result
fprintf('The critical point is at x = %.2f\n', extrema_value);
fprintf('The minimum value of the function is f(%.2f) = %.2f\n', extrema_value, y_value);

%% FIND functions extreme points - polinomial function
% define function
syms x
f = @(x) x.^3 - x.^2 - 2*x + 1;

% differentiation, x is variable
df=diff(f,x);

% Find roots >> df(x)=0
sf=solve(df==0)

% evaulate 
xs=eval(sf)

% y value of original function
ys=f(xs)

%% plot function and roots
% use xs and ys, scatter plot
close all
fplot(f,[-2 2.5],'LineWidth',2)
xlabel('X','FontSize',18); % label at Y axis
ylabel('Y','FontSize',18); % label at Y axis
hold on
%scatter(xs,ys,5,'color','r','filled');
scatter(xs,ys,45,'red','filled');
hold off
ax=gca;
%xlim([0.0 5.1])
%ylim([80 200])
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;

saveas(gcf,'function_roots.png')
