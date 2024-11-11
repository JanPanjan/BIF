function res = poravnaj_ta_jajca2(vec, window_size)
    vec_len = length(vec); % dolzina vektorja

    if window_size < 7 || mod(window_size, 2) == 0
        disp('Dolzina window_size mora biti liha in večja od 7.');
        return
    end

    res = NaN(vec_len, 1); % vektor za rezultate
    utezi = NaN(window_size, 1); % vektor za uteži
    middle = ceil(window_size / 2); % sredina weights (ali window)

    % izračunamo weights s pomočjo fibonacci funkcije
    % fib..(1) in fib..(2) vrneta 1, zato začnemo s fib..(2)
    for i = 1 : window_size
        utezi(i) = fibonacci(i + 1);
    end

    % poračunamo nove (smoothed) vrednosti, tako da gremo čez vse
    % vrednosti v vektorju. začnemo pri `sredinskem` elementu 
    % glede na middle in končamo vec_len - middle
    for i = middle : vec_len - middle + 1
        % loopamo čez vsak weight in poračunamo posamezno vrednost
        % za neke elemente v vektorju s pomočjo window in jo dodamo v tmp
        tmp = 0;
        for j = 1 : window_size
            tmp = tmp + vec(i + j - middle) * utezi(j);
        end

        % poračunamo povprečje
        res(i) = tmp / sum(utezi);
    end
end