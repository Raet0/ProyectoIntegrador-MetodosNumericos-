function x = gaussSimple()
clc; % Limpia para que el encabezado esté arriba
fprintf('====================================================\n');
fprintf('        MÉTODO DE ELIMINACIÓN DE GAUSS SIMPLE       \n');
fprintf('====================================================\n');
fprintf('Este método resuelve sistemas de la forma [A][x] = [B].\n');
fprintf('La matriz A debe ser cuadrada y no tener ceros en la diagonal.\n\n');

% Agregamos un pequeño espacio para asegurar que el texto se imprima
pause(0.1);

% Ahora sí, el input
n = input('1. Ingrese el número total de incógnitas (n): ');
% Validación rápida de dimensiones
if isempty(n) || n <= 0
    fprintf('\nError: El número de ecuaciones debe ser un entero positivo.\n');
    return;
end

A = zeros(n,n);
B = zeros(n,1);

% Llenado de matriz A elemento por elemento
fprintf('\n2. Ingreso de los Coeficientes (Matriz A):\n');
for i = 1:n
    for j = 1:n
        fprintf('   Ingrese A(%d,%d): ', i, j);
        A(i,j) = input('');
    end
end

% Llenado de vector B
fprintf('\n3. Ingreso de los Términos Independientes (Vector B):\n');
for i = 1:n
    fprintf('   Ingrese resultado B(%d): ', i);
    B(i) = input('');
end

%~~~~~~~~~~~~~~~~~~~~~~~~~ Setup ~~~~~~~~~~~~~~~~~~~~~~~~~%
fprintf('\n----------------------------------------------------\n');
disp('ESTADO INICIAL DEL SISTEMA:');
t = ' | '; T = repmat(t,n,1);
a = num2str(A); b = num2str(B); c = [a T b];
disp(c);
fprintf('----------------------------------------------------\n\n');

%~~~~~~~~~~~~~~~~~ Eliminación hacia adelante ~~~~~~~~~~~~~~~~~%
j = 1;
for k = 1:n - 1
    % Análisis Crítico: Detección de división por cero
    if A(k,k) == 0
        fprintf('\n!!! ERROR CRÍTICO: Pivote nulo detectado en A(%d,%d).\n', k, k);
        fprintf('El método de Gauss Simple no puede continuar.\n');
        input('\nPresione ENTER para volver al menú...');
        return;
    end

    for i = k + 1:n
        if A(i,k) ~= 0
            factor = A(i,k)/A(k,k);
            A(i,:) = A(i,:) - factor*A(k,:);
            B(i) = B(i) - factor*B(k);

            % Actualización visual del proceso
            fprintf('Eliminando elemento A(%d,%d)... Paso %d:\n', i, k, j);
            c = [num2str(A), T, num2str(B)];
            disp(c); fprintf('\n');
            j = j+1;
        end
    end
end

%~~~~~~~~~~~~~~~~~ Sustitución hacia atrás ~~~~~~~~~~~~~~~~~%
x = zeros(n, 1);
x(n) = B(n)/A(n,n);
for i = n - 1:-1:1
    sumVal = B(i);
    for j = i + 1:n
        sumVal = sumVal - A(i,j)*x(j);
    end
    x(i) = sumVal/A(i,i);
end

%~~~~~~~~~~~~~~~~~ Impresión de resultados ~~~~~~~~~~~~~~~~~%
fprintf('====================================================\n');
fprintf('             RESULTADOS DEL SISTEMA                 \n');
fprintf('====================================================\n');
for i = 1:n
    fprintf('   Variable x%d = %f\n', i, x(i));
end
fprintf('====================================================\n');

% Bloque de Standby solicitado anteriormente
fprintf('\nCálculo completado exitosamente.\n');
input('Presione ENTER para limpiar y regresar al menú principal...');
end