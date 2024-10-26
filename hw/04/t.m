clear all
%% Differential Equation
% Fg - Fdrag = ma
% mg - kv = m dv/dt
% rearrange 
% dv/dt = g - (k/m)*v    % Differential Equation

syms v(t) g m k 

% Differential Equation
%      dv/dt   =  g - (k/m)*v
DE = diff(v,t) == g - (k/m)*v;

cond = v(0) == 0; % initial conditions !!! at t=0, velocity is zero 
SOL(t) = dsolve(DE,cond); 
VELOCITY=matlabFunction(SOL);
VELOCITY

% constants
 g0=10; % gravity
 k0=1; % shape, cross section, ....
 
 %% Figure 1
 figure
 m1=1; % the mass
 %terminal velocity print
 VT=(m1*g0/k0);
 fprintf('VT(m1=1)= %6.2f\n',VT);
 fplot(VELOCITY(t,g0,k0,m1),[0, 30],'LineWidth',2,'Color','b') % from 0 to 30 seconds
 hold on 
 m2=2;
 %terminal velocity print
 VT=(m2*g0/k0);
 fprintf('VT(m2=2)= %6.2f\n',VT);
 fplot(VELOCITY(t,g0,k0,m2),[0, 30],'LineWidth',2,'Color','r') % m2
 m5=5;
 %terminal velocity print
 VT=(m5*g0/k0);
 fprintf('VT(m5=5)= %6.2f\n',VT);
 fplot(VELOCITY(t,g0,k0,m5),[0, 30],'LineWidth',2,'Color','g') % m5
 m10=10;
 %terminal velocity print
 VT=(m10*g0/k0);
 fprintf('VT(m10=10)= %6.2f\n',VT);
 fplot(VELOCITY(t,g0,k0,m10),[0, 30],'LineWidth',2,'Color','k') % m10
 %
 legend('m1=1','m2=2','m5=5','m10=10','FontSize',16,'Location','northwest')
 ax=gca;
 ax.XAxis.FontSize = 16;
 ax.YAxis.FontSize = 16;
 ylabel('Velocity','FontSize',18);
 xlabel('Time','FontSize',18);
 saveas(gcf,'Velocity_Linear.png')

 %% ACCELERATION
 % derivative of velocity is acceleration "SOL"
 SOL2= diff(SOL,t); % SOL(t) is the solution, it is function of v(t), velocity vs time
 acc=matlabFunction(SOL2);
 acc
 
 %% Figure 2
 figure
 m1=1;
 fplot(acc(t,g0,k0,m1),[0, 30],'LineWidth',2,'Color','b');% m1
 hold on 
 m2=2;
 fplot(acc(t,g0,k0,m2),[0, 30],'LineWidth',2,'Color','r')% m2
 m5=5;
 fplot(acc(t,g0,k0,m5),[0, 30],'LineWidth',2,'Color','g')% m5
 m10=10;
 fplot(acc(t,g0,k0,m10),[0, 30],'LineWidth',2,'Color','k') % m10

 legend('m1=1','m2=2','m5=5','m10=10','FontSize',16)
 ax=gca;
 ax.XAxis.FontSize = 16;
 ax.YAxis.FontSize = 16;
 ylabel('Acceleration','FontSize',18);
 xlabel('Time','FontSize',18);
 saveas(gcf,'Acceleration_Linear.png')

 %% displacement > integrate
 m5=5;
 %integrate
 dispY=int(VELOCITY,t); % t time variable, integrating !!!
 dispYfun=matlabFunction(dispY);  %Convert symbolic expression to function handle
 dispYfun
 % condition at time t=0, is Y=0
 C=dispYfun(g0,k0,m5,0); %t is 0
 %final function is dispY + C
 Y = dispYfun(g0,k0,m5,t)-C; % substract C, define constatnts
 YnoC = dispYfun(g0,k0,m5,t); % whiteout C, start is not at zero
 figure
 fplot(Y,[0, 30],'LineWidth',2,'Color','b') % from 0 to 30 seconds
 hold on
 fplot(YnoC,[0, 30],'LineWidth',2,'Color','r') % from 0 to 30 seconds
 ax=gca;
 ax.XAxis.FontSize = 16;
 ax.YAxis.FontSize = 16;
 ax.YLim=[0 1500];
 ylabel('Displacement','FontSize',18);
 xlabel('Time','FontSize',18);
 saveas(gcf,'displacement_linear_drag.png')

 %% four different masses
 %m1
 m1=1;
 C1=dispYfun(g0,k0,m1,0); % t=0, m1
 Y1 = dispYfun(g0,k0,m1,t)-C1;
 %m2
 m2=2;
 C2=dispYfun(g0,k0,m2,0); % t=0, m2
 Y2 = dispYfun(g0,k0,m2,t)-C2;
 %m5
 m5=5;
 C5=dispYfun(g0,k0,m5,0); % t=0, m5
 Y5 = dispYfun(g0,k0,m5,t)-C5;
 %m10
 m10=10;
 C10=dispYfun(g0,k0,m10,0); % t=0
 Y10 = dispYfun(g0,k0,m10,t)-C10;

 figure
 fplot(Y1,[0, 5],'LineWidth',2,'Color','b') % from 0 to 5 seconds
 ax=gca;
 hold on
 fplot(Y2,[0, 5],'LineWidth',2,'Color','r') % from 0 to 5 seconds
 fplot(Y5,[0, 5],'LineWidth',2,'Color','g') % from 0 to 5 seconds
 fplot(Y10,[0, 5],'LineWidth',2,'Color','k') % from 0 to 5 seconds

 ax.XAxis.FontSize = 16;
 ax.YAxis.FontSize = 16;
 ylabel('Displacement','FontSize',18);
 xlabel('Time','FontSize',18);
 legend('m1=1','m2=2','m5=5','m10=10','FontSize',16,'Location','northwest')
 title('Bigger mass - travels faster','FontSize',16)
 saveas(gcf,'displacement_linear_drag_four_masses.png')

%% example (related to home work)
syms x
f=@(x) x.^2-10;
solve(f,x)

f=@(x) x.^2-10==0;
solve(f,x)

f=@(x) x.^2==10;
solve(f,x)

% Find time when velocity is vmax/2
% find vmax, and setup condition
