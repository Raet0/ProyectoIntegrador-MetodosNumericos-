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
