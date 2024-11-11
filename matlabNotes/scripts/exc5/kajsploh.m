%% READ DATA %%
temp = readtable('data.csv');
data = table2array(temp);
t = data(:, 1); % time
x = data(:, 2); % displacement
dt = t(2)-t(1); % neka razlika idk

% dobimo hitrost in pospešek
v = diff(x)/dt;
a = diff(v)/dt;

% brez smoothing
figure
plot(t, x, 'k', 'LineWidth', 2) % premik ~ čas
ylabel('Premik [enota]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('Premik v odvisnosti od časa')

figure
plot(t(1:end - 1), v, 'b', 'LineWidth', 2) % hitrost ~ čas
ylabel('Hitrost [m/s]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('Hitrost v odvisnosti od časa')

figure
plot(t(1:end - 2), a, 'r', 'LineWidth', 2) % pospešek ~ čas
ylabel('Pospešek [m/s^2]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('Pospešek v odvisnosti od časa')

% ker izgleda grozno, moramo `smoothat` podatke
% določimo sliding window size
window = 30; % ena izmed 5, 15, 30
method = 'moving'; % ena izmed 'moving', 'lowess' 'loess' 'sgolay' 'rlowess' 'rloess'
x_smooth = smooth(x, window, method);

% izrišemo nove podatke
figure
plot(t, x_smooth, 'k', 'LineWidth', 2)
ylabel('Premik [enota]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('(Smoothed) Premik v odvisnosti od časa')
% izgleda isto, ampak kaj pa hitrost in pospešek

% spet poračunamo nove vrednosti
v_ = diff(x_smooth)/dt;
a_ = diff(v_)/dt;

% smoothamo podatke
v_smooth = smooth(v_, window, method);
a_smooth = smooth(a_, window, method);

% izrišemo
figure
plot(t(1:end - 1), v_smooth, 'b', 'LineWidth', 2) % hitrost ~ čas
ylabel('Hitrost [m/s]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('(Smoothed) Hitrost v odvisnosti od časa')

figure
plot(t(1:end - 2), a_smooth, 'r', 'LineWidth', 2) % pospešek ~ čas
ylabel('Pospešek [m/s^2]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('(Smoothed) Pospešek v odvisnosti od časa')

% mmm, super izgledajo
% zdaj pa moram definirat svojo funkcijo za smoothing
% tu je ta od asistentke

% spet nove x vrednosti
x_smooth_2 = MYsmoothFIBO(x);

% iz novih x vrednosti nove funkcije
v__ = diff(x_smooth_2)/dt;
a__ = diff(v__)/dt;

% iz novih funkcij nove smooth vrednosti
v_smooth_2 = MYsmoothFIBO(v__);
a_smooth_2 = MYsmoothFIBO(a__);

% izrišemo
figure
plot(t, x_smooth_2, 'k', 'LineWidth', 2) % premik ~ čas
ylabel('Premik [enota]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('Premik v odvisnosti od časa')

figure
plot(t(1:end - 1), v_smooth_2, 'b', 'LineWidth', 2) % hitrost ~ čas
ylabel('Hitrost [m/s]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('Hitrost v odvisnosti od časa')

figure
plot(t(1:end - 2), a_smooth_2, 'r', 'LineWidth', 2) % pospešek ~ čas
ylabel('Pospešek [m/s^2]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('Pospešek v odvisnosti od časa')
% pospešek je ugly, amapak nemreš nič

%% ----- naša funkcija za smoothing -----
window_size = 7;
x_smooth_3 = poravnaj_ta_jajca(x, window_size);

% iz novih x vrednosti nove funkcije
v___ = diff(x_smooth_3)/dt;
a___ = diff(v___)/dt;

% iz novih funkcij nove smooth vrednosti
v_smooth_3 = poravnaj_ta_jajca(v___, window_size);
a_smooth_3 = poravnaj_ta_jajca(a___, window_size);

% izrišemo
figure
plot(t, x_smooth_3, 'k', 'LineWidth', 2) % premik ~ čas
ylabel('Premik [enota]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('(smoothed s funkcijo) Premik v odvisnosti od časa')

figure
plot(t(1:end - 1), v_smooth_3, 'b', 'LineWidth', 2) % hitrost ~ čas
ylabel('Hitrost [m/s]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('(smoothed s funkcijo) Hitrost v odvisnosti od časa')

figure
plot(t(1:end - 2), a_smooth_3, 'r', 'LineWidth', 2) % pospešek ~ čas
ylabel('Pospešek [m/s^2]','FontSize',12)
xlabel('Čas [s]','FontSize',12)
title('(smoothed s funkcijo) Pospešek v odvisnosti od časa')