function menuSistemasNoLineales()
    % Asegurar que el path incluya las funciones auxiliares
    addpath(genpath(pwd));
    
    continuar = true;
    while continuar
        clc;
        fprintf('\n===== SISTEMAS NO LINEALES (Búsqueda de Raíces) =====\n')
        fprintf('Encuentra x donde f(x) = 0\n')
        fprintf('----------------------------------------------\n')
        fprintf('1. Bisección (SIEMPRE FUNCIONA)\n')
        fprintf('   └─ Lento O(log₂(1/ε)), pero robusto\n')
        fprintf('2. Falsa Posición\n')
        fprintf('   └─ Similar a bisección, usa interpolación\n')
        fprintf('3. Secante\n')
        fprintf('   └─ Rápido, no necesita derivada\n')
        fprintf('4. Newton-Raphson (MÁS RÁPIDO)\n')
        fprintf('   └─ Convergencia cuadrática, requiere f''(x)\n')
        fprintf('5. Volver al menú principal\n')
        fprintf('====================================================\n')
        opcion = input('Seleccione un método: ');
        
        switch opcion
            case 1
                clc;
                fprintf('\n---- MÉTODO DE BISECCIÓN ----\n')
                fprintf('Requiere: Intervalo [a,b] con f(a)·f(b) < 0\n')
                fprintf('Velocidad: O(log₂(1/ε)) iteraciones\n')
                fprintf('Garantía: SIEMPRE converge si cambio de signo\n')
                fprintf('Recomendación: EMPIEZA AQUÍ si no sabes qué usar\n\n')
                ejecutarBiseccion();
            case 2
                clc;
                fprintf('\n---- MÉTODO DE FALSA POSICIÓN ----\n')
                fprintf('Requiere: Intervalo [a,b] con f(a)·f(b) < 0\n')
                fprintf('Método: Bisección mejorada con interpolación\n')
                fprintf('Velocidad: Mejor que bisección en algunos casos\n\n')
                ejecutarFalsaPosicion();
            case 3
                clc;
                fprintf('\n---- MÉTODO DE SECANTE ----\n')
                fprintf('Requiere: Dos aproximaciones iniciales x0, x1\n')
                fprintf('NO necesita: Derivada f''(x)\n')
                fprintf('Velocidad: Rápido, convergencia super-lineal\n')
                fprintf('Recomendación: Cuando no tienes la derivada\n\n')
                ejecutarSecante();
            case 4
                clc;
                fprintf('\n---- MÉTODO DE NEWTON-RAPHSON ----\n')
                fprintf('Requiere: Aproximación inicial x0 Y derivada f''(x)\n')
                fprintf('Velocidad: ⭐ MÁS RÁPIDO (convergencia cuadrática)\n')
                fprintf('Iteraciones: Típicamente 3-5 para convergencia\n')
                fprintf('Advertencia: Puede divergir si x0 es malo o f''(x)=0\n\n')
                ejecutarNewtonRaphson();
            case 5
                continuar = false;
            otherwise
                fprintf('\nOpción inválida. Intente de nuevo.\n')
                pause(1);
        end
    end
end

function ejecutarBiseccion()
    [a, b, tol, maxIter] = obtenerParametrosNoLineales();
    if isempty(a)
        return;
    end
    
    fprintf('\nIngrese la función en términos de x (ej: x^2 - 2):\n')
    funcionStr = input('f(x) = ', 's');
    
    fprintf('\nResolviendo con Bisección...\n')
    [raiz, iteraciones, fx, historial] = biseccion(funcionStr, a, b, tol, maxIter);
    
    if isnan(raiz)
        fprintf('\nError: No se pudo encontrar la raíz.\n')
        fprintf('Verifique que f(a) y f(b) tengan signo opuesto.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosNoLineales(raiz, fx, iteraciones);
    
    % Graficar
    respuesta = input('\n¿Desea graficar la función y la raíz encontrada? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        visualizarFuncionNoLineal(funcionStr, raiz, a, b);
    end
end

function ejecutarFalsaPosicion()
    [a, b, tol, maxIter] = obtenerParametrosNoLineales();
    if isempty(a)
        return;
    end
    
    fprintf('\nIngrese la función en términos de x (ej: x^2 - 2):\n')
    funcionStr = input('f(x) = ', 's');
    
    fprintf('\nResolviendo con Falsa Posición...\n')
    [raiz, iteraciones, fx, historial] = falsaPosicion(funcionStr, a, b, tol, maxIter);
    
    if isnan(raiz)
        fprintf('\nError: No se pudo encontrar la raíz.\n')
        fprintf('Verifique que f(a) y f(b) tengan signo opuesto.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosNoLineales(raiz, fx, iteraciones);
    
    % Graficar
    respuesta = input('\n¿Desea graficar la función y la raíz encontrada? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        visualizarFuncionNoLineal(funcionStr, raiz, a, b);
    end
end

function ejecutarSecante()
    fprintf('Ingrese dos aproximaciones iniciales:\n')
    fprintf('(No requieren cambio de signo como bisección)\n')
    x0 = input('x0 = ');
    x1 = input('x1 = ');
    tol = input('Tolerancia (ej: 1e-6): ');
    maxIter = input('Máximo de iteraciones (ej: 100): ');
    
    if isempty(x0) || isempty(x1) || isempty(tol) || isempty(maxIter)
        fprintf('\nDatos inválidos.\n')
        return;
    end
    
    fprintf('\nIngrese la función en términos de x (ej: x^2 - 2):\n')
    funcionStr = input('f(x) = ', 's');
    
    fprintf('\nResolviendo con Secante...\n')
    fprintf('(Aproximando f''(x) usando secantes)\n')
    [raiz, iteraciones, fx, historial] = secante(funcionStr, x0, x1, tol, maxIter);
    
    if isnan(raiz)
        fprintf('\nError: No se pudo encontrar la raíz.\n')
        fprintf('Intenta con aproximaciones iniciales más cercanas a la raíz.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosNoLineales(raiz, fx, iteraciones);
    
    % Graficar
    respuesta = input('\n¿Desea graficar la función y la raíz encontrada? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        visualizarFuncionNoLineal(funcionStr, raiz, x0-1, x1+1);
    end
end

function ejecutarNewtonRaphson()
    fprintf('Ingrese una aproximación inicial cerca de la raíz esperada:\n')
    x0 = input('x0 = ');
    tol = input('Tolerancia (ej: 1e-6): ');
    maxIter = input('Máximo de iteraciones (ej: 100): ');
    
    if isempty(x0) || isempty(tol) || isempty(maxIter)
        fprintf('\nDatos inválidos.\n')
        return;
    end
    
    fprintf('\nIngrese la función en términos de x (ej: x^2 - 2):\n')
    funcionStr = input('f(x) = ', 's');
    
    fprintf('\nIngrese la derivada en términos de x (ej: 2*x):\n')
    fprintf('(Si no la tienes, usa Secante en su lugar)\n')
    derivadaStr = input("f'(x) = ", 's');
    
    fprintf('\nResolviendo con Newton-Raphson...\n')
    fprintf('(Fórmula: x_{n+1} = x_n - f(x_n)/f''(x_n))\n')
    [raiz, iteraciones, fx, historial] = newtonRapshon(funcionStr, derivadaStr, x0, tol, maxIter);
    
    if isnan(raiz)
        fprintf('\nError: No se pudo encontrar la raíz.\n')
        fprintf('Posibles causas:\n')
        fprintf('  - Aproximación inicial x0 muy lejos de la raíz\n')
        fprintf('  - Derivada f''(x) no está bien especificada\n')
        fprintf('  - La raíz está cerca de un punto donde f''(x)=0\n')
        fprintf('Intenta con Bisección o Secante.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    mostrarResultadosNoLineales(raiz, fx, iteraciones);
    
    % Graficar
    respuesta = input('\n¿Desea graficar la función y la raíz encontrada? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        visualizarFuncionNoLineal(funcionStr, raiz, x0-2, x0+2);
    end
end
