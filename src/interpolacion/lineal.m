function [yi, indices] = lineal(x, y, xi)
    % Interpolación Lineal - Función pública
    % Interpola valor en xi usando dos puntos vecinos
    
    n = length(x);
    
    % Ordenar si es necesario
    [x_sorted, idx_sort] = sort(x);
    y_sorted = y(idx_sort);
    
    % Encontrar el intervalo
    if xi < x_sorted(1) || xi > x_sorted(n)
        fprintf('ADVERTENCIA: xi fuera del intervalo.\n');
    end
    
    % Búsqueda binaria para encontrar el intervalo
    idx1 = 1;
    for i = 1:n-1
        if x_sorted(i) <= xi && xi <= x_sorted(i+1)
            idx1 = i;
            idx2 = i + 1;
            break;
        end
    end
    
    if xi > x_sorted(n-1)
        idx1 = n - 1;
        idx2 = n;
    end
    
    % Interpolación lineal: yi = y1 + (y2-y1)/(x2-x1) * (xi-x1)
    x1 = x_sorted(idx1);
    x2 = x_sorted(idx2);
    y1 = y_sorted(idx1);
    y2 = y_sorted(idx2);
    
    yi = y1 + (y2 - y1) / (x2 - x1) * (xi - x1);
    
    % Retornar índices originales
    indices = [idx_sort(idx1), idx_sort(idx2)];
end
