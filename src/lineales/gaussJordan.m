%% Función de Gauss Jordan
function [x, condicion] = gaussJordan(A, B)
    % Copia de trabajo
    A = A;
    B = B;
    n = length(B);
    condicion = true;
    
    % Crear matriz aumentada
    Ab = [A, B];
    
    % Eliminación de Gauss-Jordan
    for k = 1:n
        % Encontrar pivote máximo
        [~, maxIdx] = max(abs(Ab(k:n, k)));
        maxIdx = maxIdx + k - 1;
        
        % Intercambiar filas
        if maxIdx ~= k
            Ab([k, maxIdx], :) = Ab([maxIdx, k], :);
        end
        
        % Verificar pivote nulo
        if abs(Ab(k,k)) < eps
            fprintf('ERROR: Sistema singular.\n');
            condicion = false;
            x = [];
            return;
        end
        
        % Normalizar fila k
        Ab(k, :) = Ab(k, :) / Ab(k,k);
        
        % Eliminar columna k en otras filas
        for i = 1:n
            if i ~= k && abs(Ab(i,k)) > eps
                Ab(i, :) = Ab(i, :) - Ab(i,k) * Ab(k, :);
            end
        end
    end
    
    % Extraer solución
    x = Ab(:, n+1);
end
