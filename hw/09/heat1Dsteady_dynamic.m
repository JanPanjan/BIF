close all
%% drawnow dynamic graph
%% 1D heat flow, steady conditions, 

n=100; % we divide rode on several parts >> 1mm

T=zeros(n,1);
Tl=300; % 300 Kelvins (left hand site)

dd=Tl/(n-1);
Tfinal=(300:-dd:0)';

%% plot T after 100 1000 10000 100000 and 1000000 iterartion

%draw line - redline, steady flow
x = [1 100];
y = [300 0];

T=zeros(n,1);
T(1,1)=Tl; % 300 Kelvins
for iter=1:5000    % num. of iterations
    for i=2:(n-1)
        T(i,1)=(T(i-1,1)+T(i+1,1))/2;
    end
    % difference
    df=sqrt(sum((T-Tfinal).^2)/(n-1));
    %
    plot(T,'LineWidth',2)
    line(x,y,'Color','red')
    ax=gca; % Get handle to current axis.
    %xlim([-0.1 3.2])
    %ylim([-1.2 1.2]) % Y axis limit
    ax.XAxis.FontSize = 16; % font size of X axis
    ax.YAxis.FontSize = 16; % font size of Y axis
    %ytickformat('%.2f'); % two decimal placaes for number as Y axis
    ylabel('Temperature','FontSize',18); % label at Y axis
    xlabel('Rode length','FontSize',18);
    mytitle=sprintf('Steps: %8i  dT diff: %8.2f',iter,df);
    title(mytitle,'FontSize',20)
    drawnow
end

