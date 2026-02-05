%% Función para obtener parámetros de sistemas lineales
function [A, B, n] = obtenerSistemaLineal()
    fprintf('Ingrese el número de incógnitas (n): ')
    n = input('');
    
    if isempty(n) || n <= 0
        fprintf('\nError: El número debe ser un entero positivo.\n')
        A = [];
        B = [];
        return;
    end
    
    A = zeros(n, n);
    B = zeros(n, 1);
    
    fprintf('\n--- Ingreso de la Matriz de Coeficientes (A) ---\n')
    for i = 1:n
        for j = 1:n
            fprintf('A(%d,%d) = ', i, j)
            A(i,j) = input('');
        end
    end
    
    fprintf('\n--- Ingreso del Vector de Términos Independientes (B) ---\n')
    for i = 1:n
        fprintf('B(%d) = ', i)
        B(i) = input('');
    end
end

%% Función para obtener parámetros de métodos no lineales
function [a, b, tol, maxIter] = obtenerParametrosNoLineales()
    fprintf('Ingrese el intervalo [a, b]:\n')
    a = input('a = ');
    b = input('b = ');
    
    if isempty(a) || isempty(b) || a >= b
        fprintf('\nError: Intervalo inválido.\n')
        a = [];
        return;
    end
    
    tol = input('Tolerancia (ej: 1e-6): ');
    maxIter = input('Máximo de iteraciones (ej: 100): ');
    
    if isempty(tol) || isempty(maxIter) || tol <= 0 || maxIter <= 0
        fprintf('\nError: Parámetros inválidos.\n')
        a = [];
        return;
    end
end

%% Función para mostrar resultados de sistemas lineales
function mostrarResultadosSistemaLineal(x)
    n = length(x);
    fprintf('\n========== RESULTADOS ==========\n')
    for i = 1:n
        fprintf('x%d = %12.8f\n', i, x(i));
    end
    fprintf('================================\n')
    input('Presione ENTER para continuar...');
end

%% Función para mostrar resultados de métodos no lineales
function mostrarResultadosNoLineales(raiz, fx, iteraciones)
    fprintf('\n========== RESULTADOS ==========\n')
    fprintf('Raíz encontrada: x = %12.8f\n', raiz);
    fprintf('f(x) = %12.8e\n', fx);
    fprintf('Iteraciones: %d\n', iteraciones);
    fprintf('================================\n')
end

%% Función para visualizar funciones no lineales
function visualizarFuncionNoLineal(funcionStr, raiz, a, b)
    try
        % Crear función anónima
        f = str2func(['@(x) ', funcionStr]);
        
        % Generar puntos para graficar
        x = linspace(a, b, 1000);
        y = arrayfun(f, x);
        
        % Crear figura
        figure('Name', 'Gráfico de Función No Lineal');
        plot(x, y, 'b-', 'LineWidth', 2);
        hold on;
        plot(raiz, f(raiz), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
        
        % Dibujar ejes de referencia
        plot([a, b], [0, 0], 'k--', 'Alpha', 0.3, 'LineWidth', 1);
        plot([0, 0], [min(y), max(y)], 'k--', 'Alpha', 0.3, 'LineWidth', 1);
        
        grid on;
        xlabel('x', 'FontSize', 12);
        ylabel('f(x)', 'FontSize', 12);
        title(['Función: f(x) = ', funcionStr], 'FontSize', 14);
        legend('f(x)', sprintf('Raíz: x = %.6f', raiz));
        hold off;
    catch
        fprintf('\nError al graficar. Verifique la función ingresada.\n')
    end
end

%% Función para visualizar interpolación
function visualizarInterpolacion(x, y, xi, yi, titulo)
    figure('Name', titulo);
    
    % Plotear puntos originales
    plot(x, y, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
    hold on;
    
    % Plotear punto interpolado
    plot(xi, yi, 'r*', 'MarkerSize', 15);
    
    % Dibujar una línea entre los puntos
    plot([x; xi], [y; yi], 'k--', 'Alpha', 0.5);
    
    grid on;
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    title(titulo, 'FontSize', 14);
    legend('Puntos dados', sprintf('Punto interpolado (%.2f, %.6f)', xi, yi));
    hold off;
end
