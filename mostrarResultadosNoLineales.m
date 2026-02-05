%% Función para mostrar resultados de métodos no lineales
function mostrarResultadosNoLineales(raiz, fx, iteraciones)
    fprintf('\n========== RESULTADOS ==========\n')
    fprintf('Raíz encontrada: x = %12.8f\n', raiz);
    fprintf('f(x) = %12.8e\n', fx);
    fprintf('Iteraciones: %d\n', iteraciones);
    fprintf('================================\n')
end
