%% Función para mostrar resultados de sistemas lineales
function mostrarResultadosSistemaLineal(x)
    n = length(x);
    fprintf('\n========== RESULTADOS ==========\n')
    for i = 1:n
        fprintf('x%d = %12.8f\n', i, x(i));
    end
    fprintf('================================\n')
    input('Presione ENTER para continuar...');
end
