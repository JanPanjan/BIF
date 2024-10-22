%% BISETCTION
% f is function, and initial interval [a,b]
function p = BISECTION(f,a,b)

n=1;
if f(a)*f(b)>0 
    disp('Wrong intial interval. No roots in defined interval.')
else
    p = (a + b)/2; % middle point between a in b
    %fprintf('%6i%15.5f\n',n,p)
    err = abs(f(p));
    while err > 1e-4 % error critearia
       n=n+1;
       if f(a)*f(p)<0 
           b = p;
       else
           a = p;          
       end
       p = (a + b)/2; 
       err = abs(f(p));
       y = f(p);
       fprintf('%6i %15.5f %15.5f \n',n,p,y)
       if n>10000
           fprintf('Bisection did not converge in 10000 iterations.\n')
           return
       end    
    end
end