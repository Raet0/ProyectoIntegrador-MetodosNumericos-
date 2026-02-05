% Test de verificación de funciones
clc; clear all; close all;

addpath(genpath(pwd));

fprintf('=== VERIFICACIÓN DE FUNCIONES ===\n\n');

% Test 1: Funciones auxiliares
fprintf('Test 1: Buscando funciones auxiliares...\n');
status = ~isempty(which('obtenerSistemaLineal'));
fprintf('  obtenerSistemaLineal: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('obtenerParametrosNoLineales'));
fprintf('  obtenerParametrosNoLineales: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('mostrarResultadosSistemaLineal'));
fprintf('  mostrarResultadosSistemaLineal: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('visualizarFuncionNoLineal'));
fprintf('  visualizarFuncionNoLineal: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

% Test 2: Métodos lineales
fprintf('\nTest 2: Buscando métodos lineales...\n');
status = ~isempty(which('gaussSimple'));
fprintf('  gaussSimple: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('gaussJordan'));
fprintf('  gaussJordan: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('gaussSimpleR'));
fprintf('  gaussSimpleR: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('gaussJordanE'));
fprintf('  gaussJordanE: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

% Test 3: Métodos no lineales
fprintf('\nTest 3: Buscando métodos no lineales...\n');
status = ~isempty(which('biseccion'));
fprintf('  biseccion: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('falsaPosicion'));
fprintf('  falsaPosicion: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('secante'));
fprintf('  secante: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('newtonRapshon'));
fprintf('  newtonRapshon: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

% Test 4: Métodos de interpolación
fprintf('\nTest 4: Buscando métodos de interpolación...\n');
status = ~isempty(which('lineal'));
fprintf('  lineal: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('polinomial'));
fprintf('  polinomial: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('laGranje'));
fprintf('  laGranje: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

% Test 5: Archivos menú
fprintf('\nTest 5: Buscando archivos menú...\n');
status = ~isempty(which('menuSistemasLineales'));
fprintf('  menuSistemasLineales: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('menuSistemasNoLineales'));
fprintf('  menuSistemasNoLineales: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

status = ~isempty(which('menuInterpolacion'));
fprintf('  menuInterpolacion: %s\n', iif(status, 'OK', 'NO ENCONTRADA'));

fprintf('\n=== VERIFICACIÓN COMPLETADA ===\n\n');
fprintf('Si todas las funciones están OK, puedes ejecutar: main\n');

function result = iif(condition, trueVal, falseVal)
    if condition
        result = trueVal;
    else
        result = falseVal;
    end
end
