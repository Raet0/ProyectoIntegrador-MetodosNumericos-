%% Método de Simpson 3/8 para integración numérica
function [integral, error] = simpson38(funcionStr, a, b, n)
    % Entrada:
    %   funcionStr: string de la función
    %   a: límite inferior
    %   b: límite superior
    %   n: número de subintervalos (DEBE SER MÚLTIPLO DE 3)
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
    
    if mod(n, 3) ~= 0
        fprintf('\n❌ Error: n (%d) DEBE SER MÚLTIPLO DE 3 para Simpson 3/8.\n', n);
        fprintf('   Usa n = %d ó n = %d ó n = %d en su lugar.\n', ...
            floor(n/3)*3, ceil(n/3)*3, ceil(n/3)*3+3);
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
    
    % Fórmula de Simpson 3/8 compuesta
    % Integral = 3h/8 * [f(x0) + 3*sum(f_no_múltiples_3) + 2*sum(f_múltiples_3) + f(xn)]
    % Puntos con índice múltiplo de 3 (aparte del primero y último)
    indices_mult3 = 4:3:length(y)-1;
    suma_mult3 = sum(y(indices_mult3));
    
    % Puntos no múltiples de 3
    y_sin_mult3 = y;
    y_sin_mult3(indices_mult3) = [];
    y_sin_mult3(1) = [];      % Quitar primero
    y_sin_mult3(end) = [];    % Quitar último
    suma_no_mult3 = sum(y_sin_mult3);
    
    integral = (3*h/8) * (y(1) + 3*suma_no_mult3 + 2*suma_mult3 + y(end));
    
    % Error estimado: O(h^4)
    error = abs(3 * h^4 * (b - a) / 80);
    
    fprintf('\n✓ ━━━━═ SIMPSON 3/8 ═━━━━\n');
    fprintf('│ Función: f(x) = %s\n', funcionStr);
    fprintf('│ Intervalo: [%.4f, %.4f]\n', a, b);
    fprintf('│ Subintervalos: %d (MÚLTIPLO DE 3 ✓)\n', n);
    fprintf('│ Paso h: %.6f\n', h);
    fprintf('│\n');
    fprintf('│ 📊 RESULTADO:\n');
    fprintf('│   ∫ƒ(x)dx ≈ %.10f\n', integral);
    fprintf('│   Error estimado: ~%.2e\n', error);
    fprintf('│   Orden de error: O(h⁴) = O(%.2e)\n', h^4);
    fprintf('└─────────────────────────\n\n');
end
