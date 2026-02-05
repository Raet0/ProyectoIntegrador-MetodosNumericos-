clear; %borrar varriables
close all; %cierra figuras
clc; % limpia terminal
addpath(genpath(pwd)); % Agrega todas las subcarpetas del proyecto al Path de MATLAB

%  variable para que el programa siga en pie hasta que el usuario decidad salir
continuar  = true;

while continuar
    fprintf('\n=============================\n')
    fprintf('   PROYECTO MÉTODOS NÚMERICOS\n  ')
    fprintf('===============================\n')
    fprintf('1.Sistemas de ecuaciones líneales\n')
    fprintf('2.Sistemas de ecuaciones non líneales\n')
    fprintf('3.Interpolación y Regresión\n')
    fprintf('4.end\n')
    opcion = input('Seleccione una categoria: ');
    switch opcion
        case 1
            fprintf('Entrando a sistemas lineales...\n')
            continuar2 = true;
            while continuar2
                fprintf('1.gauss simple\n')
                fprintf('2.gauss Jordan\n')
                fprintf('3.gauss simple con pivote')
                fprintf('4.gauss jordan con escalonamiento')
                fprintf('5.Volver al menú principal\n')
                opcion2 = input('selecciona un metodo.');
                switch opcion2
                    case 1
                        fprintf('entrando a gauss simple')
                        gaussSimple();
                    case 2
                        fprintf('entrando a gauss jordan')
                    case 3
                        fprintf('entrando a gauss simple con pivote')
                    case 4
                        fprintf('entrando a guass jordan con escalonamiento')
                        case 5
                            fprintf('saliendo...')
                            continuar2 = false;
                    otherwise
                        fprintf('seleccion invalida. Intente de nuevo.')
                end
            end
        case 2
            fprintf('Entrando a sistemas no lineales...')
        case 3
            fprintf('Entrando a interpolación...')
        case 4
            disp('crerrando el programa.....')
            continuar =false;
        otherwise
            fprintf('selección invalida. Intente de nuevo.\n')
    end
end