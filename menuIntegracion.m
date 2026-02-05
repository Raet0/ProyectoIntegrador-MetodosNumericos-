function menuIntegracion()
    % Asegurar que el path incluya las funciones auxiliares
    addpath(genpath(pwd));
    
    continuar = true;
    while continuar
        clc;
        fprintf('\n===== INTEGRACIÓN NUMÉRICA =====\n')
        fprintf('Calcula: ∫ƒ(x)dx en el intervalo [a, b]\n')
        fprintf('-----------------------------------\n')
        fprintf('1. Método del Trapecio\n')
        fprintf('   └─ Rápido, precisión moderada O(h³)\n')
        fprintf('2. Simpson 1/3 (RECOMENDADO)\n')
        fprintf('   └─ Mejor precisión O(h⁴), n DEBE SER PAR\n')
        fprintf('3. Simpson 3/8\n')
        fprintf('   └─ Similar a Simpson 1/3, n DEBE SER MÚLTIPLO DE 3\n')
        fprintf('4. Gauss-Legendre (MÁXIMA PRECISIÓN)\n')
        fprintf('   └─ Óptimo para funciones suaves (2-10 puntos)\n')
        fprintf('5. Volver al menú principal\n')
        fprintf('==================================\n')
        opcion = input('Seleccione un método: ');
        
        switch opcion
            case 1
                clc;
                fprintf('\n---- MÉTODO DEL TRAPECIO ----\n')
                fprintf('Fórmula: ∫ ≈ (h/2)[f(x₀) + 2f(x₁) + ... + f(xₙ)]\n')
                fprintf('Error: O(h³) compuesto\n')
                fprintf('Uso: Rápido, precisión moderada\n\n')
                ejecutarTrapecio();
            case 2
                clc;
                fprintf('\n---- SIMPSON 1/3 ----\n')
                fprintf('Fórmula: ∫ ≈ (h/3)[f(x₀) + 4f(x₁) + 2f(x₂) + ...]\n')
                fprintf('Error: O(h⁴)\n')
                fprintf('Requisito: n DEBE SER PAR\n')
                fprintf('Recomendación: Empieza con n = 20-50\n\n')
                ejecutarSimpson13();
            case 3
                clc;
                fprintf('\n---- SIMPSON 3/8 ----\n')
                fprintf('Fórmula: ∫ ≈ (3h/8)[f(x₀) + 3f(x₁) + 3f(x₂) + 2f(x₃) + ...]\n')
                fprintf('Error: O(h⁴)\n')
                fprintf('Requisito: n DEBE SER MÚLTIPLO DE 3\n')
                fprintf('Alternativa a Simpson 1/3\n\n')
                ejecutarSimpson38();
            case 4
                clc;
                fprintf('\n---- GAUSS-LEGENDRE ----\n')
                fprintf('Usa puntos y pesos óptimos basados en Legendre\n')
                fprintf('Error: O(h^(2n)) donde n = #puntos\n')
                fprintf('Puntos disponibles: 2 a 10\n')
                fprintf('Ideal para: Funciones suaves, máxima precisión\n\n')
                ejecutarGaussLegendre();
            case 5
                continuar = false;
            otherwise
                fprintf('\nOpción inválida. Intente de nuevo.\n')
                pause(1);
        end
    end
end

function ejecutarTrapecio()
    funcion_str = input('Ingrese la función f(x): ', 's');
    a = input('Límite inferior (a): ');
    b = input('Límite superior (b): ');
    n = input('Número de subintervalos (recomendado ≥ 50): ');
    
    [integral, error] = trapecio(funcion_str, a, b, n);
end

function ejecutarSimpson13()
    funcion_str = input('Ingrese la función f(x): ', 's');
    a = input('Límite inferior (a): ');
    b = input('Límite superior (b): ');
    
    % Validar que n sea par
    while true
        n = input('Número de subintervalos (DEBE SER PAR, recomendado 20-50): ');
        if mod(n, 2) == 0
            break;
        else
            fprintf('¡Error! n debe ser PAR. Intente de nuevo.\n')
        end
    end
    
    [integral, error] = simpson13(funcion_str, a, b, n);
end

function ejecutarSimpson38()
    funcion_str = input('Ingrese la función f(x): ', 's');
    a = input('Límite inferior (a): ');
    b = input('Límite superior (b): ');
    
    % Validar que n sea múltiplo de 3
    while true
        n = input('Número de subintervalos (DEBE SER MÚLTIPLO DE 3, recomendado 15-45): ');
        if mod(n, 3) == 0
            break;
        else
            fprintf('¡Error! n debe ser MÚLTIPLO DE 3. Intente de nuevo.\n')
        end
    end
    
    [integral, error] = simpson38(funcion_str, a, b, n);
end

function ejecutarGaussLegendre()
    funcion_str = input('Ingrese la función f(x): ', 's');
    a = input('Límite inferior (a): ');
    b = input('Límite superior (b): ');
    
    % Validar que n esté en rango
    while true
        n = input('Número de puntos Gauss (2-10, recomendado 5-8): ');
        if n >= 2 && n <= 10
            break;
        else
            fprintf('¡Error! n debe estar entre 2 y 10. Intente de nuevo.\n')
        end
    end
    
    [integral, error] = gaussLegendre(funcion_str, a, b, n);
end
