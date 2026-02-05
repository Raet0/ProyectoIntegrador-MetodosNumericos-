function menuInterpolacion()
    % Asegurar que el path incluya las funciones auxiliares
    addpath(genpath(pwd));
    
    continuar = true;
    while continuar
        clc;
        fprintf('\n===== INTERPOLACIÓN Y REGRESIÓN =====\n')
        fprintf('Encuentra valores de y entre puntos conocidos\n')
        fprintf('------------------------------------\n')
        fprintf('1. Interpolación Lineal\n')
        fprintf('   └─ Simple, solo 2 puntos cercanos\n')
        fprintf('2. Interpolación Polinomial\n')
        fprintf('   └─ Todos los puntos, polinomio grado n-1\n')
        fprintf('3. Interpolación de Lagrange\n')
        fprintf('   └─ Alternativa a Newton, mismo resultado\n')
        fprintf('4. Trazadores Cúbicos (RECOMENDADO)\n')
        fprintf('   └─ Splines cúbicos, interpolación suave\n')
        fprintf('5. Volver al menú principal\n')
        fprintf('====================================\n')
        opcion = input('Seleccione un método: ');
        
        switch opcion
            case 1
                clc;
                fprintf('\n---- INTERPOLACIÓN LINEAL ----\n')
                fprintf('Usa los 2 puntos más cercanos a xi\n')
                fprintf('Fórmula: y = y₁ + (y₂-y₁)·(xi-x₁)/(x₂-x₁)\n')
                fprintf('Precisión: Baja (lineal)\n')
                fprintf('Uso: Rápida, pero menos precisa\n\n')
                ejecutarInterpolacionLineal();
            case 2
                clc;
                fprintf('\n---- INTERPOLACIÓN POLINOMIAL ----\n')
                fprintf('Polinomio que pasa por TODOS los puntos\n')
                fprintf('Método: Diferencias divididas de Newton\n')
                fprintf('Grado del polinomio: n-1 (donde n=#puntos)\n')
                fprintf('Advertencia: Polinomios altos oscilan (Fenómeno de Runge)\n')
                fprintf('Uso: Buena para pocos puntos (n<10)\n\n')
                ejecutarInterpolacionPolinomial();
            case 3
                clc;
                fprintf('\n---- INTERPOLACIÓN DE LAGRANGE ----\n')
                fprintf('Polinomio similar a Newton (mismo grado, mismo resultado)\n')
                fprintf('Fórmula: y = Σ yᵢ·Lᵢ(x) donde Lᵢ son polinomios de Lagrange\n')
                fprintf('Grado del polinomio: n-1\n')
                fprintf('Uso: Alternativa a Newton con similar precisión\n\n')
                ejecutarInterpolacionLagrange();
            case 4
                clc;
                fprintf('\n---- TRAZADORES CÚBICOS (SPLINES) ----\n')
                fprintf('Muchos polinomios cúbicos suaves (uno por intervalo)\n')
                fprintf('Propiedades:\n')
                fprintf('  - Continuidad: C² (suave, sin quiebres)\n')
                fprintf('  - Entre cada par de puntos: polinomio cúbico\n')
                fprintf('  - Condiciones: Extremos naturales (segunda derivada = 0)\n')
                fprintf('Ventajas: Evita oscilaciones de polinomios altos\n')
                fprintf('Uso: 👍 RECOMENDADO para cualquier cantidad de puntos\n\n')
                ejecutarTrazadoresCubicos();
            case 5
                continuar = false;
            otherwise
                fprintf('\nOpción inválida. Intente de nuevo.\n')
                pause(1);
        end
    end
end

function ejecutarInterpolacionLineal()
    fprintf('Ingrese los puntos (x, y):\n')
    n = input('¿Cuántos puntos tiene? ');
    
    if n < 2
        fprintf('\nNecesita al menos 2 puntos para interpolación lineal.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    x = zeros(n, 1);
    y = zeros(n, 1);
    
    for i = 1:n
        fprintf('\nPunto %d:\n', i)
        x(i) = input('  x = ');
        y(i) = input('  y = ');
    end
    
    fprintf('\nIngrese el punto a interpolar:\n')
    xi = input('xi = ');
    
    fprintf('\nCalculando interpolación lineal...\n')
    [yi, indices] = lineal(x, y, xi);
    
    fprintf('\n---- RESULTADO ----\n')
    fprintf('Valor interpolado: y(%f) = %f\n', xi, yi);
    fprintf('Puntos utilizados: (%f, %f) y (%f, %f)\n', ...
        x(indices(1)), y(indices(1)), x(indices(2)), y(indices(2)));
    
    % Graficar
    respuesta = input('\n¿Desea graficar los datos y la interpolación? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        graficarInterpolacion(x, y, xi, yi, 'Interpolación Lineal');
    end
    
    input('Presione ENTER para continuar...');
end

function ejecutarInterpolacionPolinomial()
    fprintf('Ingrese los puntos (x, y):\n')
    n = input('¿Cuántos puntos tiene? (recomendado < 10): ');
    
    if n < 2
        fprintf('\nNecesita al menos 2 puntos para interpolación.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    if n > 15
        fprintf('\n⚠️  ADVERTENCIA: Muchos puntos (%d) causarán oscilaciones\n', n)
        fprintf('Considera usar Trazadores Cúbicos en su lugar.\n')
    end
    
    x = zeros(n, 1);
    y = zeros(n, 1);
    
    for i = 1:n
        fprintf('\nPunto %d:\n', i)
        x(i) = input('  x = ');
        y(i) = input('  y = ');
    end
    
    fprintf('\nIngrese el punto a interpolar:\n')
    xi = input('xi = ');
    
    fprintf('\nCalculando interpolación polinomial (Newton)...\n')
    [yi, coef] = polinomial(x, y, xi);
    
    fprintf('\n---- RESULTADO ----\n')
    fprintf('Valor interpolado: y(%f) = %f\n', xi, yi);
    fprintf('Grado del polinomio: %d\n', length(coef)-1);
    
    % Graficar
    respuesta = input('\n¿Desea graficar los datos y la interpolación? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        graficarInterpolacion(x, y, xi, yi, 'Interpolación Polinomial');
    end
    
    input('Presione ENTER para continuar...');
end

function ejecutarInterpolacionLagrange()
    fprintf('Ingrese los puntos (x, y):\n')
    n = input('¿Cuántos puntos tiene? (recomendado < 10): ');
    
    if n < 2
        fprintf('\nNecesita al menos 2 puntos para interpolación.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    if n > 15
        fprintf('\n⚠️  ADVERTENCIA: Muchos puntos (%d) causarán oscilaciones\n', n)
        fprintf('Considera usar Trazadores Cúbicos en su lugar.\n')
    end
    
    x = zeros(n, 1);
    y = zeros(n, 1);
    
    for i = 1:n
        fprintf('\nPunto %d:\n', i)
        x(i) = input('  x = ');
        y(i) = input('  y = ');
    end
    
    fprintf('\nIngrese el punto a interpolar:\n')
    xi = input('xi = ');
    
    fprintf('\nCalculando interpolación de Lagrange...\n')
    [yi, poly] = laGranje(x, y, xi);
    
    fprintf('\n---- RESULTADO ----\n')
    fprintf('Valor interpolado: y(%f) = %f\n', xi, yi);
    
    % Graficar
    respuesta = input('\n¿Desea graficar los datos y la interpolación? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        graficarInterpolacion(x, y, xi, yi, 'Interpolación de Lagrange');
    end
    
    input('Presione ENTER para continuar...');
end

function ejecutarTrazadoresCubicos()
    fprintf('Ingrese los puntos (x, y):\n')
    fprintf('Nota: Los puntos se interpolarán con splines cúbicos\n')
    fprintf('(continuos y suaves, sin oscilaciones)\n')
    n = input('¿Cuántos puntos tiene? ');
    
    if n < 2
        fprintf('\nNecesita al menos 2 puntos para interpolación.\n')
        input('Presione ENTER para continuar...');
        return;
    end
    
    x = zeros(n, 1);
    y = zeros(n, 1);
    
    fprintf('\nIngrese los puntos conocidos:\n')
    for i = 1:n
        fprintf('Punto %d:\n', i)
        x(i) = input('  x = ');
        y(i) = input('  y = ');
    end
    
    fprintf('\nIngrese punto(s) a interpolar:\n')
    fprintf('(Puede ingresar uno o múltiples separados por espacios)\n')
    fprintf('Ej: 1.5  ó  1.5 2.5 3.5\n')
    xi = input('xi = ');
    
    % Asegurarse de que xi es un vector fila
    if ~isrow(xi)
        xi = xi';
    end
    
    fprintf('\nCalculando trazadores cúbicos naturales...\n')
    fprintf('(Construyendo sistema tridiagonal...)\n')
    
    yi = zeros(size(xi));
    for i = 1:length(xi)
        yi(i) = trazadoresCubicos(x, y, xi(i));
    end
    
    fprintf('\n---- RESULTADOS ----\n')
    if length(xi) == 1
        fprintf('Valor interpolado: y(%f) = %f\n', xi, yi);
    else
        fprintf('Valores interpolados:\n')
        for i = 1:length(xi)
            fprintf('  y(%f) = %f\n', xi(i), yi(i));
        end
    end
    
    % Graficar
    respuesta = input('\n¿Desea graficar los splines? (s/n): ', 's');
    if strcmpi(respuesta, 's')
        graficarInterpolacion(x, y, mean(xi), mean(yi), 'Trazadores Cúbicos (Splines)');
    end
    
    input('Presione ENTER para continuar...');
end
