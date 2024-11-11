function res = poravnaj_ta_jajca(vec, window_size)
    vec_len = length(vec);
    
    if window_size < 7 || mod(window_size, 2) == 0
        disp('Dolzina window_size mora biti liha in večja od 7.');
        return
    end

    res = NaN(vec_len, 1); % Result vector
    utezi = zeros(window_size, 1); % Fibonacci weights
    middle = ceil(window_size / 2); % Middle index

    % Generate Fibonacci weights
    for i = 1:window_size
        utezi(i) = fibonacci(i);
    end
    utezi = utezi / sum(utezi); % Normalize weights

    % Apply smoothing
    for i = middle:vec_len - middle + 1
        tmp = 0;
        for j = 1:window_size
            tmp = tmp + vec(i + j - middle) * utezi(j);
        end
        res(i) = tmp;
    end
end
