%% Derivadas de Datos Irregularmente Espaciados
function [derivadas] = derivadasDatosIrregulares(x, y, tipo)
    % Entrada:
    %   x: vector de puntos (pueden estar irregularmente espaciados)
    %   y: vector de valores de la función
    %   tipo: 'central', 'adelante', 'atras' (por defecto 'central')
    % Salida:
    %   derivadas: vector de derivadas aproximadas
    
    if nargin < 3
        tipo = 'central';
    end
    
    n = length(x);
    
    if n ~= length(y) || n < 2
        fprintf('Error: x e y deben tener la misma longitud y al menos 2 puntos.\n');
        derivadas = [];
        return;
    end
    
    % Ordenar por x (en caso de que no esté ordenado)
    [x, idx] = sort(x);
    y = y(idx);
    
    derivadas = zeros(size(y));
    
    switch tipo
        case 'adelante'
            % Solo en los primeros puntos
            for i = 1:n-1
                h = x(i+1) - x(i);
                derivadas(i) = (y(i+1) - y(i)) / h;
            end
            derivadas(n) = derivadas(n-1);
            
        case 'atras'
            % Solo en los últimos puntos
            for i = 2:n
                h = x(i) - x(i-1);
                derivadas(i) = (y(i) - y(i-1)) / h;
            end
            derivadas(1) = derivadas(2);
            
        case 'central'
            % Interpolación de Lagrange de segundo orden
            for i = 1:n
                if i == 1
                    % Usar adelante
                    h1 = x(2) - x(1);
                    h2 = x(3) - x(1);
                    derivadas(i) = (-3*y(1) + 4*y(2) - y(3)) / (2*h1);
                elseif i == n
                    % Usar atrás
                    h1 = x(n) - x(n-1);
                    h2 = x(n) - x(n-2);
                    derivadas(i) = (y(n-2) - 4*y(n-1) + 3*y(n)) / (2*h1);
                else
                    % Usar central
                    h1 = x(i+1) - x(i);
                    h2 = x(i) - x(i-1);
                    h = h1 + h2;
                    derivadas(i) = (h1*y(i-1) - h*y(i) + h2*y(i+1)) / (h1*h2*h/2);
                end
            end
    end
    
    fprintf('========== DERIVADAS - DATOS IRREGULARES ==========\n');
    fprintf('Número de puntos: %d\n', n);
    fprintf('Método: %s\n', tipo);
    fprintf('\nTabla:\n');
    fprintf('%12s %15s %15s\n', 'x', 'y', 'y''');
    fprintf('%12s %15s %15s\n', '─────────────', '─────────────', '─────────────');
    for i = 1:n
        fprintf('%12.6f %15.8f %15.8f\n', x(i), y(i), derivadas(i));
    end
    fprintf('====================================================\n');
end
