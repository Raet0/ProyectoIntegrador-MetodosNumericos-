%% Trazadores Cúbicos (Cubic Splines)
function yi = trazadoresCubicos(x, y, xi)
    % Entrada:
    %   x: vector de puntos conocidos (debe estar ordenado)
    %   y: vector de valores de la función
    %   xi: punto donde desea interpolar
    % Salida:
    %   yi: valor interpolado
    
    n = length(x);
    
    if n ~= length(y) || n < 2
        fprintf('Error: x e y deben tener la misma longitud y al menos 2 puntos.\n');
        yi = [];
        return;
    end
    
    % Ordenar datos
    [x, idx] = sort(x);
    y = y(idx);
    
    % Calcular diferencias
    h = diff(x);
    dy = diff(y);
    
    % Sistema tridiagonal para calcular los coeficientes
    % Condiciones de frontera: spline natural (segunda derivada = 0 en extremos)
    A = zeros(n, n);
    b = zeros(n, 1);
    
    % Primera ecuación (segunda derivada = 0 en x(1))
    A(1, 1) = 1;
    b(1) = 0;
    
    % Ecuaciones interiores
    for i = 2:n-1
        A(i, i-1) = h(i-1);
        A(i, i) = 2*(h(i-1) + h(i));
        A(i, i+1) = h(i);
        b(i) = 6*((dy(i) - dy(i-1)));
    end
    
    % Última ecuación (segunda derivada = 0 en x(n))
    A(n, n) = 1;
    b(n) = 0;
    
    % Resolver el sistema
    M = A \ b;
    
    % Encontrar el intervalo donde está xi
    idx_interval = find(x <= xi, 1, 'last');
    
    if isempty(idx_interval) || idx_interval >= n
        if xi < x(1)
            idx_interval = 1;
        else
            idx_interval = n - 1;
        end
    end
    
    % Calcular el valor interpolado usando el polinomio cúbico
    x0 = x(idx_interval);
    x1 = x(idx_interval + 1);
    y0 = y(idx_interval);
    y1 = y(idx_interval + 1);
    M0 = M(idx_interval);
    M1 = M(idx_interval + 1);
    h_int = x1 - x0;
    
    % Polinomio cúbico de Hermite
    A_spline = (x1 - xi) / h_int;
    B_spline = (xi - x0) / h_int;
    
    yi = A_spline*y0 + B_spline*y1 + ...
         (A_spline^3 - A_spline)*M0*(h_int^2)/6 + ...
         (B_spline^3 - B_spline)*M1*(h_int^2)/6;
    
    fprintf('========== TRAZADORES CÚBICOS ==========\n');
    fprintf('Número de puntos: %d\n', n);
    fprintf('Punto a interpolar: xi = %.6f\n', xi);
    fprintf('\nPuntos conocidos:\n');
    fprintf('%12s %15s\n', 'x', 'y');
    fprintf('%12s %15s\n', '─────────────', '─────────────');
    for i = 1:n
        fprintf('%12.6f %15.8f\n', x(i), y(i));
    end
    fprintf('\nResultado:\n');
    fprintf('  y(%.6f) ≈ %.10f\n', xi, yi);
    fprintf('========================================\n');
end
