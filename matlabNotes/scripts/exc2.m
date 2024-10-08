for i = 1:10
    fprintf('%i\n', i)
end

f1 = @(x) cos(x);
f2 = @(x) sin(x);
f3 = @(x) -cos(x);

fplot(f1, [0, 2*pi], 'Color', 'b', 'LineWidth', 2)
hold on % use this to plot over the previous plot
fplot(f2, [0, 2*pi], 'Color', 'r', 'LineWidth', 2)
fplot(f3, [0, 2*pi], 'Color', 'k', 'LineWidth', 2)
hold off


ax = gca;
ylim([-1.2, 1.2])
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
yticformat('%.2f');
ylabel('Y', 'FontSize', 18);
xlabel('alpha', 'FontSize', 18);

saveas(gcf, 'sin_cos_example.png')