%% Método del Trapecio para integración numérica
function [integral, error] = trapecio(funcionStr, a, b, n)
    % Entrada:
    %   funcionStr: string de la función (ej: 'x^2 + sin(x)')
    %   a: límite inferior
    %   b: límite superior
    %   n: número de subintervalos
    % Salida:
    %   integral: valor aproximado de la integral
    %   error: estimación del error
    
    % Crear función anónima
    f = str2func(['@(x) ', funcionStr]);
    
    % Validar entrada
    if n <= 0
        fprintf('\n❌ Error: n (%d) debe ser positivo.\n', n);
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
    
    % Fórmula del trapecio compuesta
    % ∫ ≈ h * [f(x0)/2 + f(x1) + f(x2) + ... + f(xn-1) + f(xn)/2]
    integral = h * (y(1)/2 + sum(y(2:end-1)) + y(end)/2);
    
    % Estimación del error: O(h²)
    % Error ≈ -h^2 * (b-a) / 12 * f''(ξ)
    error = abs(h^2 * (b - a) / 12);
    
    % Presentar información
    fprintf('\n✓ ━━━━═ MÉTODO DEL TRAPECIO ═━━━━\n');
    fprintf('│ Función: f(x) = %s\n', funcionStr);
    fprintf('│ Intervalo: [%.4f, %.4f]\n', a, b);
    fprintf('│ Subintervalos: %d\n', n);
    fprintf('│ Paso h: %.6f\n', h);
    fprintf('│\n');
    fprintf('│ 📊 RESULTADO:\n');
    fprintf('│   ∫ƒ(x)dx ≈ %.10f\n', integral);
    fprintf('│   Error estimado: ~%.2e\n', error);
    fprintf('│   Orden de error: O(h²) = O(%.2e)\n', h^2);
    fprintf('│   💡 Tip: Usa Simpson 1/3 para mejor precisión\n');
    fprintf('└──────────────────────────────\n\n');
end
