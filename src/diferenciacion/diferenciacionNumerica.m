%% Diferenciación Numérica (Método de Diferencias Finitas)
function [derivada, error_aprox] = diferenciacionNumerica(funcionStr, x0, h, tipo)
    % Entrada:
    %   funcionStr: string de la función
    %   x0: punto donde calcular la derivada
    %   h: tamaño del paso
    %   tipo: 'adelante', 'atras', 'central' (por defecto)
    % Salida:
    %   derivada: valor de la derivada aproximada
    %   error_aprox: estimación del error
    
    if nargin < 4
        tipo = 'central';
    end
    
    f = str2func(['@(x) ', funcionStr]);
    
    if h <= 0 || isempty(x0)
        fprintf('Error: h debe ser positivo y x0 válido.\n');
        derivada = [];
        error_aprox = [];
        return;
    end
    
    switch tipo
        case 'adelante'
            % f'(x) ≈ [f(x+h) - f(x)] / h
            % Error: O(h)
            derivada = (f(x0 + h) - f(x0)) / h;
            error_aprox = abs(h);
            
        case 'atras'
            % f'(x) ≈ [f(x) - f(x-h)] / h
            % Error: O(h)
            derivada = (f(x0) - f(x0 - h)) / h;
            error_aprox = abs(h);
            
        case 'central'
            % f'(x) ≈ [f(x+h) - f(x-h)] / (2h)
            % Error: O(h^2)
            derivada = (f(x0 + h) - f(x0 - h)) / (2*h);
            error_aprox = abs(h^2);
            
        otherwise
            fprintf('Error: tipo debe ser "adelante", "atras" o "central".\n');
            derivada = [];
            error_aprox = [];
            return;
    end
    
    fprintf('========== DIFERENCIACIÓN NUMÉRICA ==========\n');
    fprintf('Función: f(x) = %s\n', funcionStr);
    fprintf('Punto: x0 = %.6f\n', x0);
    fprintf('Tamaño del paso: h = %.6e\n', h);
    fprintf('Método: Diferencias %s\n', tipo);
    fprintf('\nResultado:\n');
    fprintf('  f''(%.6f) ≈ %.10f\n', x0, derivada);
    fprintf('  Error estimado: %.2e\n', error_aprox);
    fprintf('============================================\n');
end
