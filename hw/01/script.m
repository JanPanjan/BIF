% variable
a = 2;

% vector
b = [1 2 3];

% vector times variable
b * a;

% vector times vector
c = [1 2 3];
b .* c;

% matrix
m = [1 0; 0 1];

% sequence of numbers
x = 0:0.1:10;        % 0 to 10 by 0.1
y = sin(x);

% scatter plot
scatter(x, y)

% user defined function (to ni symbolic function btw)
function res = dummy(x)
    res = 3 * x;
end

% call sym
out = dummy(32)

% plot sym
fplot(@dummy, [-5,5]);
