T =   [-10; 0; 10; 20; 30; 40; 45];  % temperature
SVD = [ 1;  7; 9;  15; 31; 42; 70];  % saturated (absolute) vapour density
fu = fit(T, SVD, 'poly3');
minT = min(T);
maxT = max(T);

coefv = coeffvalues(fu);
p1 = coefv(1);
p2 = coefv(2);
p3 = coefv(3);
p4 = coefv(4);
f = @(x) p1.*x.^3 + p2.*x.^2 + p3.*x + p4;

fprintf("what do you want to calculate?\n");
fprintf("- a) relative humidity\n- b) absolute vapour density\n- c) temperature\n");
usrIn = input("=> ", "s");

if usrIn == "a" 
    T = input("enter temperature [C]: ");
    AVD = input("enter absolute vapour density [gm^-3]: ");
    T_avd = f(T);         % transform T to AVD with myfun
    r = (AVD / T_avd) * 100; % calc result
    fprintf("relative humidity: %d\n", r);
elseif usrIn == "b"
    T = input("enter temperature [C]: ");
    RH = input("enter relative humidity: ");
    T_avd = f(T); % transform T to AVD with myfun
    r = T_avd * RH;   % calc result
    fprintf("absolute vapour density: %d\n", r);
elseif usrIn == "c" 
    AVD = input("enter absolute vapour density [gm^-3]: ");
    % solve for T with roots
    coeffs = [p1, p2, p3, p4 - AVD];
    roots_T = roots(coeffs);
    r = roots_T(imag(roots_T) == 0 & roots_T >= minT & roots_T <= maxT); % somethings wrong
    if isempty(r)
        fprintf("No valid T found for given AVD (%d)\n", AVD);
    else
        fprintf("temperature: %d\n", r);
    end
else
    disp("please enter a b or c.")
end