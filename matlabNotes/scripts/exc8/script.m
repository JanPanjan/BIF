clear 
close
% define number of steps and number of particles
Nstep = 100; % number of steps
Np = 1; % number of particles
%
cMax = 0; % save abs max coordinate for x and y limits / plot
lastPxy = zeros(Np, 2); % save last coordinates to plot final position
Z = NaN(Nstep * Np, 1); % all step lengths >> to calculate average step length "l", for r = sqrt(N)l
%
figure
hold on
%
for p = 1 : Np % loop particles
    x = 0;
    y = 0;   
    Pxy = zeros(Nstep, 2);
    for i = 1 : Nstep % loop N steps %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        dx = 2 * rand - 1;  % random step [-1,1]
        dy = 2 * rand - 1;% random step [-1,1]
        x = x + dx; % add step to previous position
        y = y + dy; % radd step to previous position
        Pxy(i, 1) = x; % write coordinates in to array, need for plotting
        Pxy(i, 2) = y; % write coordinates in to array, need for plotting
        Z((i + (p - 1) * Nstep), 1) = sqrt(dx^2 + dy^2); % all step lengths in single array
    end % the end  of N steps loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      % save abs max coordinate for x and y limits / plot section
        temp = max(abs(Pxy), [], 'all');
        if temp > cMax 
            cMax = temp;
        end
      % plot path of pth particle
        plot(Pxy(:, 1), Pxy(:, 2), 'Color', [0.5 0.5 0.5]) % gray color
        drawnow
      % write last coordinates in to array
        lastPxy(p, :) = Pxy(Nstep, :);        
end
%%
scatter(0, 0, 'r', 'filled') % inital coordinates  0,0
scatter(lastPxy(:, 1), lastPxy(:, 2), 'b', 'filled') % last coordinates
xlim([-cMax * 1.1, cMax * 1.1]) % x axis limits
ylim([-cMax * 1.1, cMax * 1.1]) % y axis limits, same as x axis limits
saveas(gcf, 'random_walk.png')

%%% Check r = sqrt(N)l
% average l is mean(Z) % average step length
% average r is mean(sqrt(sum(lastPxy.^2,2))) % average distance from start to finish
l = mean(Z);
fprintf('sqrt(N)*l is : %8.3f\n', sqrt(Nstep)*l);
r = mean(sqrt(sum(lastPxy.^2,2)));
fprintf('r is : %8.4f\n',r);