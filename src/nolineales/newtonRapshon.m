function [raiz, iteraciones, fx, historial] = newtonRapshon(funcionStr, derivadaStr, x0, tol, maxIter)
    % Newton-Raphson - Función pública
    % Encuentra la raíz de una función usando el método de Newton-Raphson
    
    try
        f = str2func(['@(x) ', funcionStr]);
        fp = str2func(['@(x) ', derivadaStr]);
        
        historial = [];
        x = x0;
        
        for iter = 1:maxIter
            fx = f(x);
            fpx = fp(x);
            
            % Verificar derivada nula
            if abs(fpx) < eps
                fprintf('ERROR: Derivada nula en x = %.6f\n', x);
                raiz = NaN;
                iteraciones = iter;
                fx = NaN;
                return;
            end
            
            % Fórmula de Newton-Raphson
            x_new = x - fx / fpx;
            
            historial = [historial; x_new, f(x_new)];
            
            fprintf('Iteración %d: x=%.6f, f(x)=%.6e, f''(x)=%.6e\n', iter, x, fx, fpx);
            
            if abs(f(x_new)) < tol || abs(x_new - x) < tol
                raiz = x_new;
                fx = f(x_new);
                iteraciones = iter;
                return;
            end
            
            x = x_new;
        end
        
        raiz = x;
        fx = f(x);
        iteraciones = maxIter;
        
    catch
        raiz = NaN;
        iteraciones = 0;
        fx = NaN;
        historial = [];
        fprintf('ERROR: Función o derivada inválida.\n');
    end
end
