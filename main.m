clear; %borrar varriables
close all; %cierra figuras
clc; % limpia terminal
addpath(genpath(pwd)); % Agrega todas las subcarpetas del proyecto al Path de MATLAB

%  variable para que el programa siga en pie hasta que el usuario decidad salir
continuar = true;

while continuar
    fprintf('\n========================================\n')
    fprintf('     PROYECTO - MÉTODOS NUMÉRICOS      \n')
    fprintf('========================================\n')
    fprintf('1. Sistemas de ecuaciones LINEALES\n')
    fprintf('2. Sistemas de ecuaciones NO LINEALES\n')
    fprintf('3. Interpolación y Regresión\n')
    fprintf('4. Integración Numérica\n')
    fprintf('5. Diferenciación Numérica\n')
    fprintf('6. Ecuaciones Diferenciales Ordinarias\n')
    fprintf('7. Salir\n')
    fprintf('========================================\n')
    opcion = input('Seleccione una categoría: ');
    
    switch opcion
        case 1
            menuSistemasLineales();
        case 2
            menuSistemasNoLineales();
        case 3
            menuInterpolacion();
        case 4
            menuIntegracion();
        case 5
            menuDiferenciacion();
        case 6
            menuEcuacionesDiferenciales();
        case 7
            fprintf('\n¡Gracias por usar la aplicación!\n')
            continuar = false;
        otherwise
            fprintf('\nOpción inválida. Intente de nuevo.\n')
    end
end