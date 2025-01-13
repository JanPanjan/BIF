function smoothed_data = pogladkaj(A, ws)
    if ws < 7 || mod(ws, 2) == 0
        fprintf("RunTimeError: window size must be greater than 7 and divisible by 2!\n");
    end
    
    w = zeros(ws, 1);
    n = length(A);
    m = length(w);
    mid = ceil(m/2);
    A_new = zeros(n, 1);
    
    for i = 1:ws
        w(i) = fibonacci(i+1);
    end
    
    for i = mid:n-(mid+1)
        cur_A = A(i);
        new_A = 0;
    
        for j = 1:m
            if (j == mid)
                w = flip(w);
            end
            
            iter = i - (mid - j);
            cur_w = w(j);
            tmp_A = A(iter);

            new_A = new_A + (tmp_A * cur_w);
        end
        
        w = flip(w);
        A_new(i) = new_A/5;
    end
    
    smoothed_data = A_new;
end