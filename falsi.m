function [x, n] = falsi(f, a, b, tol, ftol)
    if f(a) * f(b) >= 0
        error('Brak miejsca zerowego na zadanym przedziale.');
    end
    if f(a) * f(b) > 0
        error('Znaki funkcji na krańcach przedziału są takie same.');
    end
    xs = a;
    x0 = b;
    n = 0;
    while abs(x0 - xs) > tol && abs(f(x0)) > ftol
        x0 = xs - (f(xs) * (x0 - xs)) / (f(x0) - f(xs));
        if f(x0) * f(xs) > 0
            xs = x0;
        end
        n = n + 1;
    end
    x = x0;
end

