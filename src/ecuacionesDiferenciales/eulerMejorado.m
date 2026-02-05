%% Método de Euler Mejorado (Heun) para ecuaciones diferenciales ordinarias
function [t, y, error] = eulerMejorado(funcionStr, t0, y0, tf, h)
    % Entrada:
    %   funcionStr: string dy/dt = f(t,y)
    %   t0: valor inicial de t
    %   y0: valor inicial de y
    %   tf: valor final de t
    %   h: tamaño del paso
    % Salida:
    %   t: vector de tiempos
    %   y: vector de soluciones
    %   error: estimación del error
    
    f = str2func(['@(t,y) ', funcionStr]);
    
    if tf <= t0 || h <= 0
        fprintf('Error: tf debe ser > t0 y h debe ser positivo.\n');
        t = [];
        y = [];
        error = [];
        return;
    end
    
    % Número de pasos
    n = ceil((tf - t0) / h);
    h = (tf - t0) / n;  % Ajustar h para llegar exactamente a tf
    
    % Inicializar vectores
    t = zeros(n+1, 1);
    y = zeros(n+1, 1);
    t(1) = t0;
    y(1) = y0;
    
    % Método de Euler Mejorado (Heun):
    % k1 = h*f(t_n, y_n)
    % k2 = h*f(t_n + h, y_n + k1)
    % y_{n+1} = y_n + (k1 + k2)/2
    for i = 1:n
        k1 = h * f(t(i), y(i));
        k2 = h * f(t(i) + h, y(i) + k1);
        y(i+1) = y(i) + (k1 + k2) / 2;
        t(i+1) = t(i) + h;
    end
    
    % Error estimado (local truncation error)
    error = abs(h^3);
    
    fprintf('========== MÉTODO DE EULER MEJORADO ==========\n');
    fprintf('EDO: dy/dt = %s\n', funcionStr);
    fprintf('Condición inicial: y(%.4f) = %.6f\n', t0, y0);
    fprintf('Intervalo: [%.4f, %.4f]\n', t0, tf);
    fprintf('Tamaño del paso: h = %.6f\n', h);
    fprintf('Número de pasos: %d\n', n);
    fprintf('\nPrimeros y últimos 5 resultados:\n');
    fprintf('%12s %15s\n', 't', 'y(t)');
    fprintf('%12s %15s\n', '─────────────', '─────────────');
    
    num_mostrar = min(5, n+1);
    for i = 1:num_mostrar
        fprintf('%12.6f %15.8f\n', t(i), y(i));
    end
    
    if n+1 > 10
        fprintf('         ...\n');
        for i = max(num_mostrar+1, n-3):n+1
            fprintf('%12.6f %15.8f\n', t(i), y(i));
        end
    end
    
    fprintf('\nError estimado: %.2e\n', error);
    fprintf('==============================================\n');
end
