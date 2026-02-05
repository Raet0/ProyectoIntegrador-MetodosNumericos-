%% Método de Simpson 1/3 para integración numérica
function [integral, error] = simpson13(funcionStr, a, b, n)
    % Entrada:
    %   funcionStr: string de la función
    %   a: límite inferior
    %   b: límite superior
    %   n: número de subintervalos (DEBE SER PAR)
    % Salida:
    %   integral: valor aproximado
    %   error: estimación del error
    
    f = str2func(['@(x) ', funcionStr]);
    
    % Validar entrada
    if n <= 0
        fprintf('\n❌ Error: n (%d) debe ser positivo.\n', n);
        integral = [];
        error = [];
        return;
    end
    
    if mod(n, 2) ~= 0
        fprintf('\n❌ Error: n (%d) DEBE SER PAR para Simpson 1/3.\n', n);
        fprintf('   Usa n = %d ó n = %d en su lugar.\n', n-1, n+1);
        integral = [];
        error = [];
        return;
    end
    
    if a >= b
        fprintf('\n❌ Error: El límite inferior (%.4f) debe ser < límite superior (%.4f).\n', a, b);
        integral = [];
        error = [];
        return;
    end
    
    % Ancho del intervalo
    h = (b - a) / n;
    
    % Generar puntos
    x = a:h:b;
    y = arrayfun(f, x);
    
    % Fórmula de Simpson 1/3 compuesta
    % Integral = h/3 * [f(x0) + 4*sum(f_impar) + 2*sum(f_par) + f(xn)]
    suma_impar = sum(y(2:2:end-1));  % índices impares (2,4,6,...)
    suma_par = sum(y(3:2:end-2));     % índices pares (3,5,7,...)
    
    integral = (h/3) * (y(1) + 4*suma_impar + 2*suma_par + y(end));
    
    % Error estimado: O(h^4)
    % Para Simpson simple: error ≈ (b-a)^5 * f''''(ξ) / (2880 * n^4)
    % Estimación conservadora:
    error = abs(h^4 * (b - a) / 180);
    
    fprintf('\n✓ ━━━━═ SIMPSON 1/3 ═━━━━\n');
    fprintf('│ Función: f(x) = %s\n', funcionStr);
    fprintf('│ Intervalo: [%.4f, %.4f]\n', a, b);
    fprintf('│ Subintervalos: %d (PAR ✓)\n', n);
    fprintf('│ Paso h: %.6f\n', h);
    fprintf('│\n');
    fprintf('│ 📊 RESULTADO:\n');
    fprintf('│   ∫ƒ(x)dx ≈ %.10f\n', integral);
    fprintf('│   Error estimado: ~%.2e\n', error);
    fprintf('│   Orden de error: O(h⁴) = O(%.2e)\n', h^4);
    fprintf('└─────────────────────────\n\n');
end
