function [raiz, iteraciones, fx, historial] = secante(funcionStr, x0, x1, tol, maxIter)
    % Secante - Función pública
    % Encuentra la raíz de una función usando el método de la secante
    
    try
        f = str2func(['@(x) ', funcionStr]);
        
        fx0 = f(x0);
        fx1 = f(x1);
        
        historial = [];
        
        for iter = 1:maxIter
            % Verificar que el denominador no sea cero
            denom = fx1 - fx0;
            if abs(denom) < eps
                fprintf('ERROR: Denominador muy pequeño.\n');
                raiz = NaN;
                iteraciones = iter;
                fx = NaN;
                return;
            end
            
            % Fórmula de secante
            x2 = x1 - fx1 * (x1 - x0) / denom;
            fx2 = f(x2);
            
            historial = [historial; x2, fx2];
            
            fprintf('Iteración %d: x0=%.6f, x1=%.6f, x2=%.6f, f(x2)=%.6e\n', iter, x0, x1, x2, fx2);
            
            if abs(fx2) < tol || abs(x2 - x1) < tol
                raiz = x2;
                fx = fx2;
                iteraciones = iter;
                return;
            end
            
            % Actualizar valores
            x0 = x1;
            fx0 = fx1;
            x1 = x2;
            fx1 = fx2;
        end
        
        raiz = x1;
        fx = fx1;
        iteraciones = maxIter;
        
    catch
        raiz = NaN;
        iteraciones = 0;
        fx = NaN;
        historial = [];
        fprintf('ERROR: Función inválida.\n');
    end
end
