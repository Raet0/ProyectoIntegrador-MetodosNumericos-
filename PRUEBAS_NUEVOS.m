%% Script de Pruebas para Nuevos Métodos
clc; clear all; close all;
addpath(genpath(pwd));

fprintf('╔════════════════════════════════════════════════╗\n')
fprintf('║   PRUEBAS - NUEVOS MÉTODOS NUMÉRICOS           ║\n')
fprintf('╚════════════════════════════════════════════════╝\n\n')

%% TEST 1: INTEGRACIÓN NUMÉRICA
fprintf('TEST 1: Métodos de Integración Numérica\n')
fprintf('────────────────────────────────────────\n')
fprintf('Integral de x^2 en [0, 2]\n')

funcion = 'x^2';
a = 0;
b = 2;

try
    [int_trap, err_trap] = trapecio(funcion, a, b, 100);
    fprintf('✓ Trapecio: %.8f\n', int_trap);
catch
    fprintf('✗ Trapecio: Error\n');
end

try
    [int_s13, err_s13] = simpson13(funcion, a, b, 100);
    fprintf('✓ Simpson 1/3: %.8f\n', int_s13);
catch
    fprintf('✗ Simpson 1/3: Error\n');
end

try
    [int_s38, err_s38] = simpson38(funcion, a, b, 99);
    fprintf('✓ Simpson 3/8: %.8f\n', int_s38);
catch
    fprintf('✗ Simpson 3/8: Error\n');
end

try
    [int_gauss, ~] = gaussLegendre(funcion, a, b, 5);
    fprintf('✓ Gauss-Legendre: %.8f\n', int_gauss);
    fprintf('  (Valor exacto: 8/3 = %.8f)\n', 8/3);
catch
    fprintf('✗ Gauss-Legendre: Error\n');
end

fprintf('\n')

%% TEST 2: DIFERENCIACIÓN NUMÉRICA
fprintf('TEST 2: Métodos de Diferenciación Numérica\n')
fprintf('───────────────────────────────────────────\n')
fprintf('Derivada de sin(x) en x=π/4\n')

funcion_der = 'sin(x)';
x0 = pi/4;
h = 0.01;

try
    [der_central, ~] = diferenciacionNumerica(funcion_der, x0, h, 'central');
    fprintf('✓ Diferencias Centrales: %.8f\n', der_central);
    fprintf('  (Valor exacto: cos(π/4) = %.8f)\n', cos(pi/4));
catch
    fprintf('✗ Diferencias Centrales: Error\n');
end

try
    [der_rich, ~] = richardson(funcion_der, x0, 0.1, 4);
    fprintf('✓ Richardson (mejora): %.8f\n', der_rich);
catch
    fprintf('✗ Richardson: Error\n');
end

fprintf('\n')

%% TEST 3: DERIVADAS DE DATOS IRREGULARES
fprintf('TEST 3: Derivadas de Datos Irregularmente Espaciados\n')
fprintf('────────────────────────────────────────────────────\n')

x_irr = [0, 0.1, 0.3, 0.6, 1.0];
y_irr = [0, 0.1, 0.3, 0.6, 1.0].^2;  % y = x^2

try
    derivadas = derivadasDatosIrregulares(x_irr, y_irr, 'central');
    fprintf('✓ Derivadas irregulares calculadas\n');
catch
    fprintf('✗ Derivadas irregulares: Error\n');
end

fprintf('\n')

%% TEST 4: TRAZADORES CÚBICOS
fprintf('TEST 4: Trazadores Cúbicos\n')
fprintf('────────────────────────────\n')

x_spline = [0, 1, 2, 3];
y_spline = [0, 1, 4, 9];  % aproximadamente x^2
xi_spline = 1.5;

try
    yi_spline = trazadoresCubicos(x_spline, y_spline, xi_spline);
    fprintf('✓ Trazadores cúbicos: y(%.1f) ≈ %.6f\n', xi_spline, yi_spline);
    fprintf('  (Valor esperado: %.2f)\n', xi_spline^2);
catch
    fprintf('✗ Trazadores cúbicos: Error\n');
end

fprintf('\n')

%% TEST 5: ECUACIONES DIFERENCIALES
fprintf('TEST 5: Ecuaciones Diferenciales Ordinarias\n')
fprintf('──────────────────────────────────────────\n')
fprintf('dy/dt = -2*t*y, y(0)=1, en [0, 1]\n')

ode_str = '-2*t*y';
t0_ode = 0;
y0_ode = 1;
tf_ode = 1;
h_ode = 0.1;

try
    [t_euler, y_euler, err_euler] = metodoEuler(ode_str, t0_ode, y0_ode, tf_ode, h_ode);
    fprintf('✓ Método de Euler: y(1) ≈ %.8f\n', y_euler(end));
    fprintf('  (Valor exacto: exp(-1) ≈ %.8f)\n', exp(-1));
catch
    fprintf('✗ Método de Euler: Error\n');
end

try
    [t_heu, y_heu, err_heu] = eulerMejorado(ode_str, t0_ode, y0_ode, tf_ode, h_ode);
    fprintf('✓ Euler Mejorado: y(1) ≈ %.8f\n', y_heu(end));
catch
    fprintf('✗ Euler Mejorado: Error\n');
end

fprintf('\n')

fprintf('╔════════════════════════════════════════════════╗\n')
fprintf('║   PRUEBAS COMPLETADAS                          ║\n')
fprintf('║   Para usar la app interactiva: main           ║\n')
fprintf('╚════════════════════════════════════════════════╝\n')
