%% Función para visualizar interpolación
function graficarInterpolacion(x, y, xi, yi, titulo)
    figure('Name', titulo);
    
    % Plotear puntos originales
    plot(x, y, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
    hold on;
    
    % Plotear punto interpolado
    plot(xi, yi, 'r*', 'MarkerSize', 15);
    
    % Dibujar una línea entre los puntos
    plot([x; xi], [y; yi], 'k--', 'Alpha', 0.5);
    
    grid on;
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    title(titulo, 'FontSize', 14);
    legend('Puntos dados', sprintf('Punto interpolado (%.2f, %.6f)', xi, yi));
    hold off;
end
