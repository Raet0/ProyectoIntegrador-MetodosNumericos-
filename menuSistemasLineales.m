function menuSistemasLineales()
    % Asegurar que el path incluya las funciones auxiliares
    addpath(genpath(pwd));
    
    continuar = true;
    while continuar
        clc;
        fprintf('\n===== SISTEMAS DE ECUACIONES LINEALES =====\n')
        fprintf('Resuelve: Ax = B (donde A es matriz, x y B son vectores)\n')
        fprintf('-------------------------------------------\n')
        fprintf('1. Gauss Simple\n')
        fprintf('   └─ Rápido, pero inestable si pivote es pequeño\n')
        fprintf('2. Gauss Jordan\n')
        fprintf('   └─ Producción directa de solución\n')
        fprintf('3. Gauss Simple con Pivote (RECOMENDADO)\n')
        fprintf('   └─ Estable, mejor condicionamiento\n')
        fprintf('4. Gauss Simple con Escalamiento\n')
        fprintf('   └─ Más estable aún, para sistemas mal condicionados\n')
        fprintf('5. Volver al menú principal\n')
        fprintf('===========================================\n')
        opcion = input('Seleccione un método: ');
        
        switch opcion
            case 1
                clc;
                fprintf('\n---- MÉTODO DE GAUSS SIMPLE ----\n')
                fprintf('Eliminación gaussiana sin pivote\n')
                fprintf('Velocidad: Rápido\n')
                fprintf('Estabilidad: Baja (evitar si posible)\n\n')
                ejecutarGaussSimple();
            case 2
                clc;
                fprintf('\n---- MÉTODO DE GAUSS JORDAN ----\n')
                fprintf('Gauss con pivote completo (diagonal)\n')
                fprintf('Velocidad: Rápido\n')
                fprintf('Produce: x directamente\n\n')
                ejecutarGaussJordan();
            case 3
                clc;
                fprintf('\n---- GAUSS SIMPLE CON PIVOTE (RECOMENDADO) ----\n')
                fprintf('Gauss con estrategia de pivote parcial\n')
                fprintf('Velocidad: Rápido\n')
                fprintf('Estabilidad: Buena (👍 MEJOR BALANCE)\n\n')
                ejecutarGaussSimpleR();
            case 4
                clc;
                fprintf('\n---- GAUSS JORDAN CON ESCALAMIENTO ----\n')
                fprintf('Gauss Jordan + escalamiento de filas\n')
                fprintf('Velocidad: Rápido\n')
                fprintf('Estabilidad: Excelente para sistemas mal condicionados\n\n')
                ejecutarGaussJordanE();
            case 5
                continuar = false;
            otherwise
                fprintf('\nOpción inválida. Intente de nuevo.\n')
                pause(1);
        end
    end
end

function ejecutarGaussSimple()
    [A, B, n] = obtenerSistemaLineal();
    if isempty(A)
        return;
    end
    
    fprintf('\nResolviendo Sistema Ax = B con Gauss Simple...\n')
    [x, cond] = gaussSimple(A, B);
    
    if ~cond
        fprintf('\n⚠️  Error: No fue posible resolver el sistema.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosSistemaLineal(x);
end

function ejecutarGaussJordan()
    [A, B, n] = obtenerSistemaLineal();
    if isempty(A)
        return;
    end
    
    fprintf('\nResolviendo Sistema Ax = B con Gauss-Jordan...\n')
    [x, cond] = gaussJordan(A, B);
    
    if ~cond
        fprintf('\n⚠️  Error: No fue posible resolver el sistema.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosSistemaLineal(x);
end

function ejecutarGaussSimpleR()
    [A, B, n] = obtenerSistemaLineal();
    if isempty(A)
        return;
    end
    
    fprintf('\nResolviendo Sistema Ax = B con Gauss Simple + Pivote...\n')
    [x, cond] = gaussSimpleR(A, B);
    
    if ~cond
        fprintf('\n⚠️  Error: No fue posible resolver el sistema.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosSistemaLineal(x);
end

function ejecutarGaussJordanE()
    [A, B, n] = obtenerSistemaLineal();
    if isempty(A)
        return;
    end
    
    fprintf('\nResolviendo Sistema Ax = B con Gauss-Jordan + Escalamiento...\n')
    [x, cond] = gaussJordanE(A, B);
    
    if ~cond
        fprintf('\n⚠️  Error: No fue posible resolver el sistema.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosSistemaLineal(x);
end
