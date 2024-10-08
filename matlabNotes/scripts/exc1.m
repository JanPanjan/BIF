
% Exercise 1
% Learn how to:
%     • create variable
%     • create a vector
%     • multiply vector and variable or constant
%     • multiply two vectors
%     • create a matrix
%       
%     • sequence of numbers
%     • create sequence of number for x and y, then plot scatter(x,y)
%       
%     • create user-defined math functions, for example x^2+x-6 or 3*sin(x)
%     • evaluate function, for example f=cos(x), x=pi/3, How much is f(pi/3)?
%     • plot function (use “fplot”)
%       
%     • write short report and add comments in M-file to describe the code.
%       
%     • save your script (*.m)
%       
%     • upload script with included comments to eClass.


% ; semicolon
%%
a=6;
a=6+3/5;
a=5^3;

%% arrays
b1=[1,2,3,4,5,6]; %row 
b2=[1;2;3;4;5;6]; %column
% check difference between b1 and b2

%% multiplication
c=b1*a; % vector and variable
d=c.*b1; % two vectors, see "dot" before asterix!! - pairwise 

%% create matrix 
m=[1,2;3,4];
m=ones(5,5); % matrix 5x5, all values are = 1
m=zeros(8,6); % matrix 8x6, all values are = 0
m=NaN(8,6); % matrix 8x6, all values are = NAN

%% create a sequence
1:1:10
x=1:1:10;
y=(1:1:10).^2;

%% plot
figure
scatter(x,y)
figure
plot(x,y,'-*')

%% function
f = @(x) x.^2 + 2*x + 1;
f(2)
x=2:2:10;
y=f(x); % the values 
y
%% symbolic variables and functions
syms x % Create symbolic variables and functions
% Note, now you can not use x for an array!
f2 = @(x) sin(x);
fplot(f2) % !!! fplot
f2(pi/3)
X=0:(2*pi)/20:2*pi; % capital X !!! not x
f2(X)

%% read and write csv file
%create matrix
m=ones(15,5);
% write it to the file
writematrix(m,"myname.csv")
% read it from the file
R = readmatrix("myname.csv");


