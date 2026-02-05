function [yi, poly] = laGranje(x, y, xi)
    % Interpolación de Lagrange - Función pública
    % Interpola usando polinomios base de Lagrange
    
    n = length(x);
    yi = 0;
    
    for i = 1:n
        % Calcular el producto L_i(xi)
        L = 1;
        for j = 1:n
            if i ~= j
                L = L * (xi - x(j)) / (x(i) - x(j));
            end
        end
        yi = yi + y(i) * L;
    end
    
    % Retornar información del polinomio
    poly = yi;
end
