function [raiz, iteraciones, fx, historial] = falsaPosicion(funcionStr, a, b, tol, maxIter)
    % Falsa Posición - Función pública
    % Encuentra la raíz de una función en un intervalo [a, b]
    
    try
        f = str2func(['@(x) ', funcionStr]);
        
        % Verificar cambio de signo
        if f(a) * f(b) > 0
            raiz = NaN;
            iteraciones = 0;
            fx = NaN;
            historial = [];
            fprintf('ERROR: No hay cambio de signo en [%f, %f]\n', a, b);
            return;
        end
        
        historial = [];
        fa = f(a);
        fb = f(b);
        
        for iter = 1:maxIter
            % Fórmula de falsa posición
            c = a - fa * (b - a) / (fb - fa);
            fc = f(c);
            
            historial = [historial; c, fc];
            
            fprintf('Iteración %d: a=%.6f, b=%.6f, c=%.6f, f(c)=%.6e\n', iter, a, b, c, fc);
            
            if abs(fc) < tol || abs(b - a) < tol
                raiz = c;
                fx = fc;
                iteraciones = iter;
                return;
            end
            
            if fa * fc < 0
                b = c;
                fb = fc;
            else
                a = c;
                fa = fc;
            end
        end
        
        raiz = c;
        fx = fc;
        iteraciones = maxIter;
        
    catch
        raiz = NaN;
        iteraciones = 0;
        fx = NaN;
        historial = [];
        fprintf('ERROR: Función inválida.\n');
    end
end
