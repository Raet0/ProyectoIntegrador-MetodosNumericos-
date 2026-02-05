function menuEcuacionesDiferenciales()
    % Asegurar que el path incluya las funciones auxiliares
    addpath(genpath(pwd));
    
    continuar = true;
    while continuar
        clc;
        fprintf('\n===== ECUACIONES DIFERENCIALES ORDINARIAS =====\n')
        fprintf('Resuelve: dy/dt = f(t,y) con condición inicial y(t₀)=y₀\n')
        fprintf('----------------------------------------------\n')
        fprintf('1. Método de Euler\n')
        fprintf('   └─ Simple pero error acumula, O(h)\n')
        fprintf('2. Método de Euler Mejorado (Heun) (RECOMENDADO)\n')
        fprintf('   └─ Mejor precisión O(h²), mejor balance\n')
        fprintf('3. Volver al menú principal\n')
        fprintf('================================================\n')
        opcion = input('Seleccione un método: ');
        
        switch opcion
            case 1
                clc;
                fprintf('\n---- MÉTODO DE EULER ----\n')
                fprintf('Fórmula: y_{n+1} = y_n + h·f(t_n, y_n)\n')
                fprintf('Error: O(h²) local, O(h) global\n')
                fprintf('Uso: Introducción simple, pero menos preciso\n\n')
                ejecutarEuler();
            case 2
                clc;
                fprintf('\n---- MÉTODO DE EULER MEJORADO (HEUN) ----\n')
                fprintf('Fórmula: k₁ = f(t_n, y_n)\n')
                fprintf('         k₂ = f(t_{n+1}, y_n + h·k₁)\n')
                fprintf('         y_{n+1} = y_n + (h/2)·(k₁ + k₂)\n')
                fprintf('Error: O(h³) local, O(h²) global (MEJOR)\n')
                fprintf('Recomendación: Usa este en la mayoría de casos\n\n')
                ejecutarEulerMejorado();
            case 3
                continuar = false;
            otherwise
                fprintf('\nOpción inválida. Intente de nuevo.\n')
                pause(1);
        end
    end
end

function ejecutarEuler()
    fprintf('INSTRUCCIONES:\n')
    fprintf('Ingresa la ecuación diferencial en la forma: dy/dt = f(t,y)\n')
    fprintf('Donde:\n')
    fprintf('  t = variable independiente (tiempo)\n')
    fprintf('  y = variable dependiente (función desconocida)\n')
    fprintf('\nEJEMPLOS válidos:\n')
    fprintf('  "t + y"\n')
    fprintf('  "2*t - 3*y"\n')
    fprintf('  "sin(t) + y^2"\n\n')
    
    funcion_str = input('Ingrese dy/dt = f(t,y): ', 's');
    t0 = input('Valor inicial t₀: ');
    y0 = input('Valor inicial y₀: ');
    tf = input('Valor final tƒ: ');
    h = input('Tamaño del paso h (recomendado 0.01 - 0.1): ');
    
    [t, y, error] = metodoEuler(funcion_str, t0, y0, tf, h);
    
    % Graficar
    graficar_edo = input('¿Desea ver la gráfica de la solución? (s/n) [s]: ', 's');
    if isempty(graficar_edo) || strcmpi(graficar_edo, 's')
        figure('Name', 'Método de Euler');
        plot(t, y, 'b.-', 'LineWidth', 2, 'MarkerSize', 8);
        grid on;
        xlabel('t', 'FontSize', 12);
        ylabel('y(t)', 'FontSize', 12);
        title(['Solución dy/dt = ', funcion_str ' | Método de Euler'], 'FontSize', 14);
        legend(['y(t) con h=', num2str(h)], 'Location', 'best')
    end
end

function ejecutarEulerMejorado()
    fprintf('INSTRUCCIONES:\n')
    fprintf('Ingresa la ecuación diferencial en la forma: dy/dt = f(t,y)\n')
    fprintf('Donde:\n')
    fprintf('  t = variable independiente (tiempo)\n')
    fprintf('  y = variable dependiente (función desconocida)\n')
    fprintf('\nEJEMPLOS válidos:\n')
    fprintf('  "t + y"\n')
    fprintf('  "2*t - 3*y"\n')
    fprintf('  "sin(t) + y^2"\n\n')
    
    funcion_str = input('Ingrese dy/dt = f(t,y): ', 's');
    t0 = input('Valor inicial t₀: ');
    y0 = input('Valor inicial y₀: ');
    tf = input('Valor final tƒ: ');
    h = input('Tamaño del paso h (puede ser más grande que Euler, típico 0.1-1): ');
    
    [t, y, error] = eulerMejorado(funcion_str, t0, y0, tf, h);
    
    % Graficar
    graficar_edo = input('¿Desea ver la gráfica de la solución? (s/n) [s]: ', 's');
    if isempty(graficar_edo) || strcmpi(graficar_edo, 's')
        figure('Name', 'Método de Euler Mejorado');
        plot(t, y, 'r.-', 'LineWidth', 2, 'MarkerSize', 8);
        grid on;
        xlabel('t', 'FontSize', 12);
        ylabel('y(t)', 'FontSize', 12);
        title(['Solución dy/dt = ', funcion_str ' | Método de Euler Mejorado'], 'FontSize', 14);
        legend(['y(t) con h=', num2str(h)], 'Location', 'best')
    end
end
