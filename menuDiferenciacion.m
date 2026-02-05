function menuDiferenciacion()
    % Asegurar que el path incluya las funciones auxiliares
    addpath(genpath(pwd));
    
    continuar = true;
    while continuar
        clc;
        fprintf('\n===== DIFERENCIACIÓN NUMÉRICA =====\n')
        fprintf('Calcula: f''(x) = derivada de f(x)\n')
        fprintf('------------------------------------\n')
        fprintf('1. Diferenciación por Diferencias Finitas\n')
        fprintf('   └─ Adelante, Atrás, o Central (central es más preciso)\n')
        fprintf('2. Extrapolación de Richardson (MÁXIMA PRECISIÓN)\n')
        fprintf('   └─ Mejora la precisión con múltiples tamaños de paso\n')
        fprintf('3. Derivadas de Datos Irregularmente Espaciados\n')
        fprintf('   └─ Para datos experimentales no equiespaciados\n')
        fprintf('4. Volver al menú principal\n')
        fprintf('====================================\n')
        opcion = input('Seleccione un método: ');
        
        switch opcion
            case 1
                clc;
                fprintf('\n---- DIFERENCIACIÓN NUMÉRICA (DIFERENCIAS FINITAS) ----\n')
                fprintf('Tres opciones de fórmulas:\n')
                fprintf('\n1. ADELANTE: f''(x) ≈ [f(x+h) - f(x)] / h\n')
                fprintf('   Error: O(h), precisión moderada\n')
                fprintf('   Uso: Cuando solo tienes datos a la derecha\n')
                fprintf('\n2. ATRÁS: f''(x) ≈ [f(x) - f(x-h)] / h\n')
                fprintf('   Error: O(h), precisión moderada\n')
                fprintf('   Uso: Cuando solo tienes datos a la izquierda\n')
                fprintf('\n3. CENTRAL (RECOMENDADO): f''(x) ≈ [f(x+h) - f(x-h)] / (2h)\n')
                fprintf('   Error: O(h²), mejor precisión\n')
                fprintf('   Uso: Cuando tienes datos a ambos lados (MEJOR)\n\n')
                ejecutarDiferenciacion();
            case 2
                clc;
                fprintf('\n---- EXTRAPOLACIÓN DE RICHARDSON ----\n')
                fprintf('Mejora la derivada combinando cálculos con diferentes h\n')
                fprintf('Error: O(h⁴) (mucho mejor que O(h²))\n')
                fprintf('Método: Crea tabla de extrapolación para máxima precisión\n')
                fprintf('Ideal para: Cuando necesitas muy alta precisión\n\n')
                ejecutarRichardson();
            case 3
                clc;
                fprintf('\n---- DERIVADAS DATOS IRREGULARMENTE ESPACIADOS ----\n')
                fprintf('Para datos experimentales donde los puntos NO están equiespaciados\n')
                fprintf('Usa interpolación de Lagrange internamente\n')
                fprintf('Soporta: Adelante, Atrás, Central\n\n')
                ejecutarDerivadaIrregular();
            case 4
                continuar = false;
            otherwise
                fprintf('\nOpción inválida. Intente de nuevo.\n')
                pause(1);
        end
    end
end

function ejecutarDiferenciacion()
    funcion_str = input('Ingrese la función f(x): ', 's');
    x0 = input('Punto donde calcular la derivada (x₀): ');
    h = input('Tamaño del paso (h, típicamente 0.01 - 0.0001): ');
    
    fprintf('\nTipo de diferenciación:\n')
    fprintf('1. Adelante  [f''(x) ≈ [f(x+h)-f(x)]/h, Error: O(h)]\n')
    fprintf('2. Atrás     [f''(x) ≈ [f(x)-f(x-h)]/h, Error: O(h)]\n')
    fprintf('3. Central   [f''(x) ≈ [f(x+h)-f(x-h)]/(2h), Error: O(h²) - MEJOR]\n')
    tipo_op = input('Seleccione tipo (recomendado 3): ');
    
    switch tipo_op
        case 1
            tipo = 'adelante';
            fprintf('[Usando diferencias ADELANTE]\n')
        case 2
            tipo = 'atras';
            fprintf('[Usando diferencias ATRÁS]\n')
        case 3
            tipo = 'central';
            fprintf('[Usando diferencias CENTRAL - Mayor precisión]\n')
        otherwise
            tipo = 'central';
            fprintf('[Usando diferencias CENTRAL (defecto)]\n')
    end
    
    [derivada, error] = diferenciacionNumerica(funcion_str, x0, h, tipo);
end

function ejecutarRichardson()
    funcion_str = input('Ingrese la función f(x): ', 's');
    x0 = input('Punto donde calcular la derivada (x₀): ');
    h0 = input('Tamaño del paso inicial (h₀, típicamente 0.1 - 0.01): ');
    n = input('Número de iteraciones (típicamente 3-5): ');
    
    [derivada, error] = richardson(funcion_str, x0, h0, n);
end

function ejecutarDerivadaIrregular()
    fprintf('Ingrese los puntos x (separados por espacios):\n')
    fprintf('Ejemplo: [0 0.5 1.2 2.0 3.1]\n')
    x = input('x = ');
    
    fprintf('Ingrese los valores y (separados por espacios):\n')
    fprintf('Ejemplo: [1 1.5 2.0 1.8 2.5]\n')
    y = input('y = ');
    
    fprintf('\nTipo de diferenciación:\n')
    fprintf('1. Adelante\n')
    fprintf('2. Atrás\n')
    fprintf('3. Central (RECOMENDADO)\n')
    tipo_op = input('Seleccione tipo (defecto 3): ');
    
    switch tipo_op
        case 1
            tipo = 'adelante';
            fprintf('[Usando diferencias ADELANTE]\n')
        case 2
            tipo = 'atras';
            fprintf('[Usando diferencias ATRÁS]\n')
        otherwise
            tipo = 'central';
            fprintf('[Usando diferencias CENTRAL]\n')
    end
    
    derivadas = derivadasDatosIrregulares(x, y, tipo);
end
