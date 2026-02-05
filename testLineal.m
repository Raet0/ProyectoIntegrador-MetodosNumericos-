% Test simple para validar funciones lineales
clc; clear all; close all;

% Añadir paths
addpath(genpath(pwd));

% Mostrar el path actual
fprintf('Current Directory: %s\n', pwd);
fprintf('Search Path includes:\n');
pathCell = strsplit(path, ';');
for i=1:min(5, length(pathCell))
    fprintf('  %s\n', pathCell{i});
end

% Buscar gaussSimple
fprintf('\n--- Buscando gaussSimple ---\n');
s = which('gaussSimple');
if isempty(s)
    fprintf('ERROR: gaussSimple no encontrado\n');
else
    fprintf('ENCONTRADO en: %s\n', s);
end

% Intentar crear una matriz test
A = [2 1; 3 -1];
B = [5; 5];

% Intentar ejecutar método
fprintf('\nIntentando ejecutar gaussSimple...\n');
try
    [x, cond] = gaussSimple(A, B);
    fprintf('SUCCESS! Resultado: x = [%.2f, %.2f]\n', x(1), x(2));
catch ME
    fprintf('ERROR: %s\n', ME.message);
end
