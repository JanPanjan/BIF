clear all
%%
temp = readtable('data.csv') % This is table
data = table2array(temp) % convert table to array
%data=[t,y] %first column is time, second column is y displacement in meters
t=data(:,1) % time
y=data(:,2) % displacement
dt=t(2)-t(1)

% Numerični odvod
% doc diff
% Y = [X(2)-X(1) X(3)-X(2) ... X(m)-X(m-1)]
vy=diff(y)/dt % velocity
ay=diff(vy)/dt % acceleration

%% no smoothing
close all
figure
plot(t,y,'k',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Displacement in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'displacement_NOsmooth.png')

figure
plot(t(1:end-1),vy,'b',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Velocity in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'velocity_NOsmooth.png')

figure
plot(t(1:end-2),ay,'r',LineWidth=2)
clear ax
ax=gca
ytickformat('%.0f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Acceleration in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'acceleration_NOsmooth.png')

%% SMOOTH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ys=smooth(y,30,'sgolay') % smooth displacement
% vys=diff(ys)/dt % calculate velocity from smoothed data
% vys=smooth(vys,30,'sgolay') % smooth it again or not ??????
% ays=diff(vys)/dt

%%% more user friendly
mywindow=30 % 5 15 30
setmethod='moving' % 'moving' 'lowess' 'loess' 'sgolay' 'rlowess' 'rloess'
ys=smooth(y,mywindow,setmethod) % smooth displacement
vys=diff(ys)/dt % calculate velocity from smoothed data
vys=smooth(vys,mywindow,setmethod) % smooth it again or not ??????
ays=diff(vys)/dt % acceleration
%%%%

close all
figure
plot(t,ys,'k',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Displacement in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'displacement_smooth.png')

figure
plot(t(1:end-1),vys,'b',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Velocity in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'velocity_smooth.png')

figure
plot(t(1:end-2),ays,'r',LineWidth=2)
clear ax
ax=gca
ytickformat('%.0f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Acceleration in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'acceleration_smooth.png')

%% weighted smooth user defined function
% 1 2 5 2 1 MYsmoothFUN

ys=MYsmoothFIBO(y) % smoothing
vys=diff(ys)/dt % calculate velocity from smoothed data
vys=MYsmoothFIBO(vys) % smooth it again or not ??????
ays=diff(vys)/dt % acceleration

close all
figure
plot(t,ys,'k',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Displacement in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'displacement_smooth_USERfunc.png')

figure
plot(t(1:end-1),vys,'b',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Velocity in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'velocity_smooth_USERfunc.png')

figure
plot(t(1:end-2),ays,'r',LineWidth=2)
clear ax
ax=gca
ytickformat('%.0f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Acceleration in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'acceleration_smooth_USERfunc.png')

% For HW - demonstrate
% Fibonacci
% Matlab functions: fibonacci, flip, flipud, fliplr
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% NOT for students %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% weighted smooth user defined function (LOG) FIBONACCI
win=31
ys=MYsmoothFIBO(y,win) % window size is the input !!!!!
vys=diff(ys)/dt % calculate velocity from smoothed data
vys=MYsmoothFIBO(vys,win) % smooth it again or not ??????
ays=diff(vys)/dt

close all
figur
e
plot(t,ys,'k',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Displacement in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'displacement_smooth_USERfuncFIBO.png')

figure
plot(t(1:end-1),vys,'b',LineWidth=2)
clear ax
ax=gca
ytickformat('%.2f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Velocity in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'velocity_smooth_USERfuncFIBO.png')

figure
plot(t(1:end-2),ays,'r',LineWidth=2)
clear ax
ax=gca
ytickformat('%.0f')
xtickformat('%.2f')
ax.XAxis.FontSize = 16
ax.YAxis.FontSize = 16
xlim([0 2.2])
ylabel('Acceleration in Y ','FontSize',18)
xlabel('Time in seconds','FontSize',18)
saveas(gcf,'acceleration_smooth_USERfuncFIBO.png')

