clc;
close all;
clear all;

wybor = 1;

switch wybor
    case 1
        f = @(x) cos(x);
        a = 0;
        b = 2;
    case 2
        f = @(x) power(2, -x) + exp(x) + 2*cos(x) - 6;
        a = 1;
        b = 3;
    otherwise
        f = @(x) power(x + 2, 5);
        a = -3;
        b = 0;
end

tol = 1e-5;
ftol = 1e-4;

tic;
[xb, nb] = bisekcja(f, a, b, tol, ftol);
bisekcjaCzas = toc;

fprintf('Bisekcja czas = %.6f seconds\n', bisekcjaCzas);

tic;
[xf, nf] = falsi(f, a, b, tol, ftol);
falsiCzas = toc;

fprintf('Regula falsi czas = %.6f seconds\n', falsiCzas);

t = linspace(a, b, 100);
plot(t, f(t));
hold on;
plot(xb, f(xb), 'ro');
plot(xf, f(xf), 'rx');

line([0 0], ylim, 'Color', 'k', 'LineStyle', '--');
line(xlim, [0 0], 'Color', 'k', 'LineStyle', '--');

grid on;

title('Wykres funkcji');
xlabel('x');
ylabel('y');
