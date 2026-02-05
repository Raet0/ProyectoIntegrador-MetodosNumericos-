function [raiz, iteraciones, fx, historial] = biseccion(funcionStr, a, b, tol, maxIter)
    % Bisección - Función pública
    % Encuentra la raíz de una función en un intervalo [a, b]
    
    try
        f = str2func(['@(x) ', funcionStr]);
        
        % Verificar que hay cambio de signo
        if f(a) * f(b) > 0
            raiz = NaN;
            iteraciones = 0;
            fx = NaN;
            historial = [];
            fprintf('ERROR: No hay cambio de signo en [%f, %f]\n', a, b);
            return;
        end
        
        historial = [];
        
        for iter = 1:maxIter
            c = (a + b) / 2;
            fc = f(c);
            
            historial = [historial; c, fc];
            
            fprintf('Iteración %d: a=%.6f, b=%.6f, c=%.6f, f(c)=%.6e\n', iter, a, b, c, fc);
            
            if abs(fc) < tol || abs(b - a) < tol
                raiz = c;
                fx = fc;
                iteraciones = iter;
                return;
            end
            
            if f(a) * fc < 0
                b = c;
            else
                a = c;
            end
        end
        
        raiz = (a + b) / 2;
        fx = f(raiz);
        iteraciones = maxIter;
        
    catch
        raiz = NaN;
        iteraciones = 0;
        fx = NaN;
        historial = [];
        fprintf('ERROR: Función inválida.\n');
    end
end
