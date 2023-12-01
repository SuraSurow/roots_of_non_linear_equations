function [x, n] = bisekcja(f, a, b, tol, ftol)
    if f(a) * f(b) >= 0
        error('Brak miejsca zerowego na zadanym przedziale.');
    end
    x0 =(a + b) / 2;
    n = 0;
    while abs(b - a) > tol && abs(f(x0)) > ftol
        x0 = (a + b) / 2;
        if f(a) * f(x0) < 0
            b = x0;
        else
            a = x0;
        end
        n = n + 1;
    end
    x = x0;
end
