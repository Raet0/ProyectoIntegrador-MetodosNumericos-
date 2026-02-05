%% Función de Gauss Simple (sin UI)
function [x, condicion] = gaussSimple(A, B)
    % Copia de trabajo de las matrices
    A = A;
    B = B;
    n = length(B);
    condicion = true;
    
    % Eliminación hacia adelante
    for k = 1:n - 1
        % Detección de pivote nulo
        if abs(A(k,k)) < eps
            fprintf('ERROR: Pivote nulo en posición (%d,%d).\n', k, k);
            condicion = false;
            x = [];
            return;
        end
        
        for i = k + 1:n
            if abs(A(i,k)) > eps
                factor = A(i,k)/A(k,k);
                A(i,:) = A(i,:) - factor*A(k,:);
                B(i) = B(i) - factor*B(k);
            end
        end
    end
    
    % Verificación del último pivote
    if abs(A(n,n)) < eps
        fprintf('ERROR: Sistema singular.\n');
        condicion = false;
        x = [];
        return;
    end
    
    % Sustitución hacia atrás
    x = zeros(n, 1);
    x(n) = B(n)/A(n,n);
    for i = n - 1:-1:1
        sumVal = B(i);
        for j = i + 1:n
            sumVal = sumVal - A(i,j)*x(j);
        end
        x(i) = sumVal/A(i,i);
    end
end