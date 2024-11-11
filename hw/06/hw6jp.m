%% ----- TASK 1 -----
% read points from graph
x=[-10; 0; 10; 20; 30; 40; 45];  % temperature
y=[1; 7; 9; 15; 31; 42; 70]; % saturated vapour density
figure
scatter(x,y,50,'red','filled'); % size, color, filled

% fit function through data points
[f fo]=fit(x,y,'poly3'); % 3rd order > cubic function

% get function
formula(f);
coeffnames(f);
cv = coeffvalues(f);
a = cv(1);
b = cv(2);
c = cv(3);
d = cv(4);

syms X
myfun = @(X) a.*X.^3 + b.*X.^2 + c.*X + d;

% plot fitted curve
hold on
fplot(myfun, 'LineWidth', 2, 'Color', 'blue');

%% ----- TASK 2 -----
% functions to calculate values based on user input
function r = relative_humidity(myfun)
    T = input("enter temperature [C]: ");
    AVD = input("enter absolute vapour density [gm^-3]: ");
    % transform T to AVD with myfun
    T_avd = myfun(T);
    % calc result
    r = (AVD / T_avd) * 100;
end

function r = abs_vapour_density(myfun)
    T = input("enter temperature [C]: ");
    RH = input("enter relative humidity: ");
    % transform T to AVD with myfun
    T_avd = myfun(T);
    % calc result
    r = T_avd * RH;
end

function r = temperature(myfun)
    AVD = input("enter absolute vapour density [gm^-3]: ");
    RH = input("enter relative humidity: ");
    % calc result
    r = AVD / RH;%!!!
end

% [[ main ]]
disp("what do you want to calculate?")
disp("- a) relative humidity")
disp("- b) absolute vapour density")
disp("- c) temperature")
usrIn = input("=> ", "s");

if usrIn == "a" 
    res = relative_humidity(myfun);
    fprintf("relative humidity: %d\n", res);
elseif usrIn == "b" 
    res = abs_vapour_density(myfun);
    fprintf("absolute vapour density: %d\n", res);
elseif usrIn == "c" 
    res = temperature(myfun);
    fprintf("temperature: %d\n", res);
else
    disp("please enter a b or c.")
end