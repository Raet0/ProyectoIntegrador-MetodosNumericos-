%% Script de Pruebas para el Proyecto de Métodos Numéricos
% Este script verifica que todos los métodos se cargan correctamente

clc;
clear all;
close all;

fprintf('╔════════════════════════════════════════════╗\n')
fprintf('║    PRUEBAS - PROYECTO MÉTODOS NUMÉRICOS    ║\n')
fprintf('╚════════════════════════════════════════════╝\n\n')

addpath(genpath(pwd));

%% Prueba 1: Métodos Lineales
fprintf('TEST 1: Métodos de Sistemas Lineales\n')
fprintf('─────────────────────────────────────\n')

% Sistema: 2x + y = 5, 3x - y = 5 => x=2, y=1
A = [2 1; 3 -1];
B = [5; 5];

try
    [x1, cond1] = gaussSimple(A, B);
    if cond1
        fprintf('✓ Gauss Simple: x = [%.2f, %.2f]\n', x1(1), x1(2));
    else
        fprintf('✗ Gauss Simple: Error\n');
    end
catch
    fprintf('✗ Gauss Simple: Función no encontrada\n');
end

try
    [x2, cond2] = gaussJordan(A, B);
    if cond2
        fprintf('✓ Gauss Jordan: x = [%.2f, %.2f]\n', x2(1), x2(2));
    else
        fprintf('✗ Gauss Jordan: Error\n');
    end
catch
    fprintf('✗ Gauss Jordan: Función no encontrada\n');
end

try
    [x3, cond3] = gaussSimpleR(A, B);
    if cond3
        fprintf('✓ Gauss Simple con Pivote: x = [%.2f, %.2f]\n', x3(1), x3(2));
    else
        fprintf('✗ Gauss Simple con Pivote: Error\n');
    end
catch
    fprintf('✗ Gauss Simple con Pivote: Función no encontrada\n');
end

try
    [x4, cond4] = gaussJordanE(A, B);
    if cond4
        fprintf('✓ Gauss Jordan con Escalamiento: x = [%.2f, %.2f]\n', x4(1), x4(2));
    else
        fprintf('✗ Gauss Jordan con Escalamiento: Error\n');
    end
catch
    fprintf('✗ Gauss Jordan con Escalamiento: Función no encontrada\n');
end

fprintf('\n')

%% Prueba 2: Métodos No Lineales
fprintf('TEST 2: Métodos de Sistemas No Lineales\n')
fprintf('───────────────────────────────────────\n')

funcion = 'x^2 - 2';
derivada = '2*x';

try
    [r1, iter1, fx1, hist1] = biseccion(funcion, 1, 2, 1e-6, 100);
    if ~isnan(r1)
        fprintf('✓ Bisección: raiz = %.8f, iteraciones = %d\n', r1, iter1);
    else
        fprintf('✗ Bisección: No converged\n');
    end
catch
    fprintf('✗ Bisección: Función no encontrada\n');
end

try
    [r2, iter2, fx2, hist2] = falsaPosicion(funcion, 1, 2, 1e-6, 100);
    if ~isnan(r2)
        fprintf('✓ Falsa Posición: raiz = %.8f, iteraciones = %d\n', r2, iter2);
    else
        fprintf('✗ Falsa Posición: No converged\n');
    end
catch
    fprintf('✗ Falsa Posición: Función no encontrada\n');
end

try
    [r3, iter3, fx3, hist3] = secante(funcion, 1, 2, 1e-6, 100);
    if ~isnan(r3)
        fprintf('✓ Secante: raiz = %.8f, iteraciones = %d\n', r3, iter3);
    else
        fprintf('✗ Secante: No converged\n');
    end
catch
    fprintf('✗ Secante: Función no encontrada\n');
end

try
    [r4, iter4, fx4, hist4] = newtonRapshon(funcion, derivada, 1.5, 1e-6, 100);
    if ~isnan(r4)
        fprintf('✓ Newton-Raphson: raiz = %.8f, iteraciones = %d\n', r4, iter4);
    else
        fprintf('✗ Newton-Raphson: No converged\n');
    end
catch
    fprintf('✗ Newton-Raphson: Función no encontrada\n');
end

fprintf('\n')

%% Prueba 3: Interpolación
fprintf('TEST 3: Métodos de Interpolación\n')
fprintf('─────────────────────────────────\n')

x_interp = [0, 1, 2];
y_interp = [1, 2, 5];
xi_interp = 0.5;

try
    [yi1, idx] = lineal(x_interp, y_interp, xi_interp);
    fprintf('✓ Interpolación Lineal: y(%.1f) = %.8f\n', xi_interp, yi1);
catch
    fprintf('✗ Interpolación Lineal: Función no encontrada\n');
end

try
    [yi2, coef] = polinomial(x_interp, y_interp, xi_interp);
    fprintf('✓ Interpolación Polinomial: y(%.1f) = %.8f\n', xi_interp, yi2);
catch
    fprintf('✗ Interpolación Polinomial: Función no encontrada\n');
end

try
    [yi3, poly] = laGranje(x_interp, y_interp, xi_interp);
    fprintf('✓ Interpolación Lagrange: y(%.1f) = %.8f\n', xi_interp, yi3);
catch
    fprintf('✗ Interpolación Lagrange: Función no encontrada\n');
end

fprintf('\n')

%% Resumen
fprintf('╔════════════════════════════════════════════╗\n')
fprintf('║         PRUEBAS COMPLETADAS                ║\n')
fprintf('║   Para ejecutar la app: main              ║\n')
fprintf('╚════════════════════════════════════════════╝\n')
