function x = gaussSimple(A, b)
    % A: matriz  de coeficientes
    % b: vector de terminos independientes
    n = length(b);
    % matriz aumentada
    Ab = [A b]; 
    % eliminación haciaa adelante
    for k = 1:n-1
        for i = k+1:n
            % factor de eliminación
            factor = Ab(i,k) / Ab(k,k);
            % actualizacion de la fila 1
            Ab(i, k:n+1) = Ab(i, k:n+1) - factor * Ab(k, k:n+1);
        end
    end
    % sustititución hacia atras
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        suma = Ab(i,i+1:n) * x(i+1:n);
        x(i) = (Ab(i, n+1) - suma) / Ab(i,i);
    end
end
