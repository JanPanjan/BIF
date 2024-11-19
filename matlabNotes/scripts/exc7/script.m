x = 1:1:100
y = x.^2

% scatter(x,y)
figure
plot(x, y);

% generate random numbers between 0 and 1
rand
rnums = NaN(100, 1);

for i = 1 : 100
    rnums(i) = rand;
    fprintf("%d ", rnums(i));
end

% how to count points under/over the curve of
% the function?
% idk.. čakam da faking pove %

% - - -

clear
clc

%% define quadratic function and plot it
f = @(x) x.^2;
figure
fplot(f,[0,1],'b',LineWidth=2)
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
ylabel('Y','FontSize',18)
xlabel('X','FontSize',18)
title('Function y=x^{2}','FontSize',18)
saveas(gcf,'x2fun.png')

%% plot quadratic function using "points" (or array) and scatter plot
X=1:1:100; % x array
Y=X.^2;
%now plot scatter
figure
scatter(X,Y,10,'r','filled') % x,y,size, color
ax=gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
ylabel('Y','FontSize',18)
xlabel('X','FontSize',18)
title('Scatter y=x^{2}','FontSize',18)
saveas(gcf,'x2Sactter.png')

%% generate random numbers >> vector and matrix
rand
rand(10,1)
rand(10,2)
rand(3,7)

%% generate random numbers - default interval is [0,1]
disp('Random numbers between 0 and 1');
rn1=NaN(10,1);

for i=1:10
    rn1(i)=rand; % write random number in array
    fprintf('%4i  %6.4f\n',i,rn1(i));
end

%% genearte random numbers in defined interval [a,b]
% for example in interval between 5 and 7, a=5 and b=7
% general solution is: rn=(b-a)*rand+a
a=5;
b=7;
fprintf('Interval [a,b]: a=%4.1f   b=%4.1f \n',a,b);
rn2=NaN(10,1);
for i=1:10
    rn2(i)=(b-a)*rand+a;
    fprintf('%4i  %6.4f\n',i,rn2(i));
end

%% area under curve x^2
clear
clc

clear; clc; close;

N = 0; % below the curve
niter = 10000; % number of iterations
XYin=NaN(niter,2); % below curve or "IN" 
XYout=NaN(niter,2); % above cureve or "OUT"
XYall=NaN(niter,2); % all points

S=NaN(niter,1); % estimated surface
RE=NaN(niter,1); % relative error

disp('     iter  surface      error(%)');

for n = 1:niter
    x = rand;
    y = rand;
    xyall(n,1)=x;
    xyall(n,2)=y;
      if  y <= (x^2)
          xyin(n,1)=x;
          xyin(n,2)=y;
          n = n + 1; % in counter
      else
          xyout(n,1)=x;
          xyout(n,2)=y;
      end
      s(n)=n/n; % ratio: in over all
      re(n)=(s(n)/(1/3)-1)*100;
      % write output every 10 steps %you can change this value
      if ( mod(n,10) == 0 )         
          fprintf('%8i %8.4f %12.4f\n',n,s(n),re(n) );
      end
  
 end


%% quadratic function with colored points
f = @(x) x.^2;
figure
fplot(f,[0,1],'k',linewidth=3)
ylabel('y','fontsize',18)
xlabel('x','fontsize',18)
title('function y=x^{2}','fontsize',18)
hold on 
% now plot all pints, in or below as red, out or above in blue
scatter(xyin(:,1),xyin(:,2),10,'r','filled') % in > below  curve
scatter(xyout(:,1),xyout(:,2),10,'b','filled') % out > above curve
saveas(gcf,'x2surafce.png')

%% absolute error
figure
plot(s,'linewidth',2) % s aboslute error
ytickformat('%.2f')
%xtickformat('%.2f')
%ylim([min(s)-0.1 max(s)+0.1]);
ylim([0.23 0.43]);
ylabel('estimated s ','fontsize',18);
xlabel('iterations','fontsize',18);
yline(1/3,'color','r','linewidth',2) %the solution 1/3 
title(s(end),'fontsize',18)
saveas(gcf,'x2abserror.png')

%% relative error
figure
plot(re,'linewidth',2) % relative error
ytickformat('%.2f')
%xtickformat('%.2f')
%ylim([min(re)-0.1 max(re)+0.1]);
ylim([-10 10])
ylabel('estimated relative error ','fontsize',18);
xlabel('iterations','fontsize',18);
yline(1/3,'color','r','linewidth',2) %the solution 1/3 
title(re(end),'fontsize',18)
saveas(gcf,'x2reerror.png')
