%% Función de Gauss Jordan con Escalamiento
function [x, condicion] = gaussJordanE(A, B)
    % Copia de trabajo
    A = A;
    B = B;
    n = length(B);
    condicion = true;
    
    % Crear matriz aumentada
    Ab = [A, B];
    
    % Escalamiento de filas (factor de escala para cada fila)
    s = max(abs(A), [], 2);
    
    % Verificar que no haya filas nulas
    if any(s == 0)
        fprintf('ERROR: Matriz no invertible.\n');
        condicion = false;
        x = [];
        return;
    end
    
    % Gauss-Jordan con escalamiento
    for k = 1:n
        % Encontrar pivote máximo relativo
        [~, maxIdx] = max(abs(Ab(k:n, k)) ./ s(k:n));
        maxIdx = maxIdx + k - 1;
        
        % Intercambiar filas
        if maxIdx ~= k
            Ab([k, maxIdx], :) = Ab([maxIdx, k], :);
            s([k, maxIdx]) = s([maxIdx, k]);
        end
        
        % Verificar pivote
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
