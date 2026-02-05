%% Función para visualizar interpolación
function graficarInterpolacion(x, y, xi, yi, titulo)
    figure('Name', titulo);
    
    % Asegurar que x e y son vectores fila
    if iscolumn(x)
        x = x';
    end
    if iscolumn(y)
        y = y';
    end
    
    % Plotear puntos originales
    plot(x, y, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
    hold on;
    
    % Plotear punto(s) interpolado(s)
    plot(xi, yi, 'r*', 'MarkerSize', 15);
    
    % Dibujar una línea suave conectando todos los puntos
    x_sort = sort([x, xi]);
    
    grid on;
    xlabel('x', 'FontSize', 12);
    ylabel('y', 'FontSize', 12);
    title(titulo, 'FontSize', 14);
    
    if length(xi) == 1
        legend('Puntos dados', sprintf('Punto interpolado (%.2f, %.6f)', xi, yi));
    else
        legend('Puntos dados', 'Puntos interpolados');
    end
    
    hold off;
end
