%% Extrapolación de Richardson
function [derivada, error_aprox] = richardson(funcionStr, x0, h0, n)
    % Entrada:
    %   funcionStr: string de la función
    %   x0: punto donde calcular la derivada
    %   h0: tamaño del paso inicial
    %   n: número de iteraciones
    % Salida:
    %   derivada: valor mejorado de la derivada
    %   error_aprox: estimación del error
    
    f = str2func(['@(x) ', funcionStr]);
    
    if h0 <= 0 || n <= 0
        fprintf('Error: h0 debe ser positivo y n >= 1.\n');
        derivada = [];
        error_aprox = [];
        return;
    end
    
    % Tabla de Richardson
    D = zeros(n, n);
    
    % Primera columna: aproximaciones con diferencia central
    for i = 1:n
        h = h0 / 2^(i-1);
        D(i, 1) = (f(x0 + h) - f(x0 - h)) / (2*h);
    end
    
    % Llenar el resto de la tabla usando extrapolación
    for j = 2:n
        for i = j:n
            D(i, j) = D(i, j-1) + (D(i, j-1) - D(i-1, j-1)) / (4^(j-1) - 1);
        end
    end
    
    % El mejor valor de la derivada
    derivada = D(n, n);
    
    % Error estimado
    if n > 1
        error_aprox = abs(D(n, n) - D(n-1, n-1));
    else
        error_aprox = abs(h0);
    end
    
    fprintf('========== EXTRAPOLACIÓN DE RICHARDSON ==========\n');
    fprintf('Función: f(x) = %s\n', funcionStr);
    fprintf('Punto: x0 = %.6f\n', x0);
    fprintf('Tamaño del paso inicial: h0 = %.6e\n', h0);
    fprintf('Número de iteraciones: %d\n', n);
    fprintf('\nTabla de Richardson:\n');
    fprintf('%12s', '');
    for j = 1:n
        fprintf(' %15s', sprintf('D(%d,%d)', j, j));
    end
    fprintf('\n');
    for i = 1:n
        fprintf('h = h0/2^%-2d:', i-1);
        for j = 1:i
            fprintf(' %15.10f', D(i,j));
        end
        fprintf('\n');
    end
    fprintf('\nResultado:\n');
    fprintf('  f''(%.6f) ≈ %.10f\n', x0, derivada);
    fprintf('  Error estimado: %.2e\n', error_aprox);
    fprintf('==================================================\n');
end
