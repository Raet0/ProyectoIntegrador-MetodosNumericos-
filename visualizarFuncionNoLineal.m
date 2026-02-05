%% Función para visualizar funciones no lineales
function visualizarFuncionNoLineal(funcionStr, raiz, a, b)
    try
        % Crear función anónima
        f = str2func(['@(x) ', funcionStr]);
        
        % Generar puntos para graficar
        x = linspace(a, b, 1000);
        y = arrayfun(f, x);
        
        % Crear figura
        figure('Name', 'Gráfico de Función No Lineal');
        plot(x, y, 'b-', 'LineWidth', 2);
        hold on;
        plot(raiz, f(raiz), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
        
        % Dibujar ejes de referencia
        plot([a, b], [0, 0], 'k--', 'Alpha', 0.3, 'LineWidth', 1);
        plot([0, 0], [min(y), max(y)], 'k--', 'Alpha', 0.3, 'LineWidth', 1);
        
        grid on;
        xlabel('x', 'FontSize', 12);
        ylabel('f(x)', 'FontSize', 12);
        title(['Función: f(x) = ', funcionStr], 'FontSize', 14);
        legend('f(x)', sprintf('Raíz: x = %.6f', raiz));
        hold off;
    catch
        fprintf('\nError al graficar. Verifique la función ingresada.\n')
    end
end
