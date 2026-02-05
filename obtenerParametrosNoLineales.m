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
