% variable
a = 2;
% vector
b = [1, 2, 3];
% vector times variable
b * a;
% vector times vector
c = [1, 2, 3];
b .* c;
% matrix
m = [1, 0; 0, 1];

% sequence of numbers
x = 0: 0.1: 10;
y = 0: 0.1: 10;
% scatter plot
scatter(x, y)

% symbolic function
syms f(x);
f(x) = x^2 + x - 6;
f(x) = 3*sin(x);
% evaluate function
f(x) = cos(x);
fprintf("f(pi/3) is %d\n", f(pi/3));
% plot the function
fplot(f, [-5, 5])