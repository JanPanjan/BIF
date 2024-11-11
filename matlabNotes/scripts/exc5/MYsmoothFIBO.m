% sprejme x, ki je input array al neki
function S=MYsmoothFIBO(x)
    N = length(x); % določi dolžino inputa
    S = NaN(N, 1); % nredi nov stolpec NaN vrednosti višine N za nove podatke
    w = [1 2 5 2 1]; % določi weights
    n = ceil(length(w) / 2); % shrani sredino vektorja w (3)

    % preveri ali je dolžina liha, drugače ne moremo nadaljevati
    % ne moremo začeti pri i=1 in končati pri i=N, če ni liho
    if mod(length(w), 2) == 1
        sw = sum(w); % shranimo vsoto weights za avg pozneje

        % loopamo od n (3) do N - n (x - 3), ker lahko 
        % gremo max 3 od roba zaradi weights
        for i = n : N - n 
            % izračunamo nove podatke in jih shranimo 
            % na pravo mesto v S (the NaN polje)
            % ker gremo z n-jem od 3 do n-3, je prvi element na mestu i-2

            % prvi * 1 + drugi * 2 + tretji * 5 + četrti * 2 + peti * 1
            %             1           2         3           4          5
            S(i) = x(i-2)*w(1)+x(i-1)*w(2)+x(i)*w(3)+x(i+1)*w(4)+x(i+2)*w(5);

            % dobimo povprečno vrednost, kar zaključuje 
            % računanje podatkov za prvo iteracijo
            S(i) = S(i) / sw;
        end
    else
       disp('Length of weight vector is not odd! Stop.');
       return
    end
end