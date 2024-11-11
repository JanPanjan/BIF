%% READ DATA %%
temp = readtable('data.csv');
data = table2array(temp);
t = data(:, 1); % time
x = data(:, 2); % displacement
dt = t(2) - t(1); % neka razlika idk

%% ----- naša funkcija za smoothing -----
window_size = 57;
x_smooth_3 = poravnaj_ta_jajca2(x, window_size);

% iz novih x vrednosti nove funkcije
v___ = diff(x_smooth_3)/dt;
a___ = diff(v___)/dt;

% iz novih funkcij nove smooth vrednosti
v_smooth_3 = poravnaj_ta_jajca2(v___, window_size);
a_smooth_3 = poravnaj_ta_jajca2(a___, window_size);

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