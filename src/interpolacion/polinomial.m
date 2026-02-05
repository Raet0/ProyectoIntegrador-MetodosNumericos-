function [yi, coef] = polinomial(x, y, xi)
    % Interpolación Polinomial - Función pública
    % Interpola usando diferencias divididas de Newton
    
    n = length(x);
    
    % Crear la matriz de diferencias divididas (Newton's divided differences)
    dd = zeros(n, n);
    dd(:, 1) = y';
    
    for j = 2:n
        for i = 1:n-j+1
            dd(i, j) = (dd(i+1, j-1) - dd(i, j-1)) / (x(i+j-1) - x(i));
        end
    end
    
    % Evaluar el polinomio de Newton en xi
    yi = dd(1, 1);
    term = 1;
    
    for j = 2:n
        term = term * (xi - x(j-1));
        yi = yi + dd(1, j) * term;
    end
    
    % Los coeficientes del polinomio de Newton son la primera fila
    coef = dd(1, :);
end
