clear ; close;

% Instead of 1D array, I'll be using a 
% 2D matrix for data

% Define grid size (100x100)
n = 100; 
% Matrix to store values
T = zeros(n,n);
% Number of iterations
iterations = 5000;

% SECOND CASE: left and bottom boundary 300K
T(:,1) = 300;    % left boundary
T(end,:) = 300;  % bottom boundary

% Create meshgrid for plotting
[X,Y] = meshgrid(1:n, 1:n);

% Every iteration calculate average of 4 points - top, bottom, left, right,
% instead of left and right (in 1D)
for iter = 1:iterations
    % Saves old matrix for difference 
    % calculation bellow
    T_old = T;
    for i = 2:(n-1)
        for j = 2:(n-1)
            up     = T(i,j-1);
            down   = T(i,j+1);
            left   = T(i-1,j);
            right  = T(i+1,j);
            % takes the average of these values
            T(i,j) = (up + down + left + right) / 4;
        end
    end
    
    % Calculates the difference
    % Takes a double sum, since first 
    % calculation returns array
    tmp = sum((T-T_old).^2)/(n*n);
    df = sqrt(sum(tmp));
    
    % plot each pixel based on each 
    % matrix value every iteration
    imagesc(T)

    % add a color scale to plot (in other 
    % words, a legend)
    c = colorbar;
    c.Label.String = "Temperature [K]";
    colormap(jet)

    mytitle = sprintf('Steps: %8i  dT diff: %.6f', iter, df);
    title(mytitle,'FontSize',20);
    drawnow
end