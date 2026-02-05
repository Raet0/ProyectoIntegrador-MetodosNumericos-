%% Función de Gauss Simple con Pivote
function [x, condicion] = gaussSimpleR(A, B)
    % Copia de trabajo
    A = A;
    B = B;
    n = length(B);
    condicion = true;
    
    % Eliminación hacia adelante con pivote
    for k = 1:n - 1
        % Encontrar pivote máximo
        [~, maxIdx] = max(abs(A(k:n, k)));
        maxIdx = maxIdx + k - 1;
        
        % Intercambiar filas si es necesario
        if maxIdx ~= k
            A([k, maxIdx], :) = A([maxIdx, k], :);
            B([k, maxIdx]) = B([maxIdx, k]);
        end
        
        % Verificar pivote nulo
        if abs(A(k,k)) < eps
            fprintf('ERROR: Pivote nulo.\n');
            condicion = false;
            x = [];
            return;
        end
        
        % Eliminación
        for i = k + 1:n
            if abs(A(i,k)) > eps
                factor = A(i,k) / A(k,k);
                A(i,:) = A(i,:) - factor * A(k,:);
                B(i) = B(i) - factor * B(k);
            end
        end
    end
    
    % Sustitución hacia atrás
    x = zeros(n, 1);
    x(n) = B(n) / A(n,n);
    for i = n - 1:-1:1
        sumVal = B(i);
        for j = i + 1:n
            sumVal = sumVal - A(i,j) * x(j);
        end
        x(i) = sumVal / A(i,i);
    end
end
