# Guía de Uso - Proyecto Integrador de Métodos Numéricos

## Índice
1. [Cómo Iniciar](#cómo-iniciar)
2. [Diferenciación Numérica](#diferenciación-numérica)
3. [Integración Numérica](#integración-numérica)
4. [Interpolación](#interpolación)
5. [Graficador](#graficador)
6. [Ejemplos de Uso](#ejemplos-de-uso)

---

## Cómo Iniciar

### Ejecutar el programa principal
```matlab
main
```

Esto abrirá el menú interactivo donde puedes seleccionar:
- Opción 3: Interpolación y Regresión
- Opción 4: Integración Numérica  
- Opción 5: Diferenciación Numérica

---

## Diferenciación Numérica

### 1. Diferencias Finitas
**Desde el menú:** Opción 5 → Opción 1

**Entrada:**
- Función: `x^2` o `sin(x)` o cualquier expresión MATLAB
- Punto x₀: valor donde calcular la derivada
- h: tamaño del paso (recomendado: 0.01 - 0.0001)
- Tipo: 1=Adelante, 2=Atrás, 3=Central (RECOMENDADO)

**Ejemplo:**
```
Función: sin(x)
x₀: 0.785398  (que es π/4)
h: 0.01
Tipo: 3 (Central)

Resultado: f'(π/4) ≈ 0.7071 (cercano a cos(π/4) = 0.7071)
```

### 2. Extrapolación de Richardson  
**Desde el menú:** Opción 5 → Opción 2

Mejora la precisión combinando cálculos con diferentes valores de h.

**Entrada:**
- Función: `sin(x)`
- x₀: 0.785398
- h₀: 0.1 (paso inicial)
- n: 4 (iteraciones, típicamente 3-5)

**Precisión:** Mucho mejor que diferencias finitas (error O(h⁴))

### 3. Derivadas de Datos Irregulares
**Desde el menú:** Opción 5 → Opción 3

Para datos experimentales no equiespaciados.

**Ejemplo:**
```
x: [0 0.5 1.2 2.0 3.1]
y: [0 0.4794 0.9320 0.9093 0.0416]
Tipo: 3 (Central)
```

---

## Integración Numérica

### 1. Método del Trapecio
**Desde el menú:** Opción 4 → Opción 1

**Entrada:**
```
Función: x^2
a: 0  (límite inferior)
b: 2  (límite superior)
n: 100 (subintervalos, recomendado ≥ 50)

Resultado: ∫x²dx de 0 a 2 ≈ 2.6668
Exacto: 8/3 = 2.6667
```

**Precisión:** O(h³), rápido pero menos preciso

### 2. Simpson 1/3 (RECOMENDADO)
**Desde el menú:** Opción 4 → Opción 2

**IMPORTANTE:** n DEBE SER PAR

**Entrada:**
```
Función: x^2
a: 0
b: 2
n: 100 (PAR)

Resultado: ∫x²dx ≈ 2.6666666667 (casi exacto!)
```

**Precisión:** O(h⁴), mejor que trapecio

### 3. Simpson 3/8
**Desde el menú:** Opción 4 → Opción 3

**IMPORTANTE:** n DEBE SER MÚLTIPLO DE 3

**Entrada:**
```
Función: x^2
a: 0
b: 2
n: 99 (múltiplo de 3)
```

### 4. Gauss-Legendre (MÁXIMA PRECISIÓN)
**Desde el menú:** Opción 4 → Opción 4

Para funciones suaves, máxima precisión con pocos puntos.

**Entrada:**
```
Función: x^2
a: 0
b: 2
n: 5 (puntos, de 2 a 10)

Resultado: Exacto para polinomios de grado ≤ 2n-1
```

---

## Interpolación

### 1. Interpolación Lineal
**Desde el menú:** Opción 3 → Opción 1

Usa los 2 puntos más cercanos.

**Entrada:**
```
¿Cuántos puntos? 5
Punto 1: x=0, y=1
Punto 2: x=1, y=2.5
Punto 3: x=2, y=5
Punto 4: x=3, y=4.5
Punto 5: x=4, y=2

Interpolar en: xi=1.5

Resultado: y(1.5) ≈ 3.75
```

### 2. Interpolación Polinomial
**Desde el menú:** Opción 3 → Opción 2

Polinomio de grado n-1 que pasa por todos los puntos.

**ADVERTENCIA:** Con muchos puntos (>10) puede oscilar (Fenómeno de Runge)

### 3. Interpolación de Lagrange
**Desde el menú:** Opción 3 → Opción 3

Similar a polinomial, mismo resultado con diferente método.

### 4. Trazadores Cúbicos (RECOMENDADO)
**Desde el menú:** Opción 3 → Opción 4

Splines cúbicos = muchos polinomios cúbicos suaves.

**VENTAJAS:**
- No oscila como polinomios altos
- Suave y continuo
- Ideal para cualquier cantidad de puntos

**Entrada:**
```
¿Cuántos puntos? 5
[Ingresar los 5 puntos]
xi = 1.5

Resultado: y(1.5) ≈ 3.8772 (interpolación suave)
```

---

## Graficador

### Función: graficarInterpolacion()

Se llama automáticamente cuando seleccionas "s" en cualquier método de interpolación.

**Qué hace:**
- Muestra los puntos originales (círculos azules)
- Muestra el punto interpolado (estrella roja)
- Dibuja grid y etiquetas

**Ejemplo de uso manual:**
```matlab
% Datos
x = [0, 1, 2, 3, 4];
y = [1, 2.5, 5, 4.5, 2];

% Interpolar un punto
xi = 2.5;
yi = trazadoresCubicos(x, y, xi);

% Graficar
graficarInterpolacion(x, y, xi, yi, 'Mi Interpolación');
```

### Graficar Funciones Generales

Si quieres graficar una función cualquiera:

```matlab
% Definir función
f = @(x) x.^2 - 4*x + 3;

% Crear rango
x = -2:0.01:6;
y = f(x);

% Graficar
figure;
plot(x, y, 'b-', 'LineWidth', 2);
grid on;
xlabel('x');
ylabel('f(x)');
title('Función f(x) = x² - 4x + 3');
```

### Graficar Múltiples Funciones

```matlab
x = -2*pi:0.01:2*pi;

figure;
plot(x, sin(x), 'r-', 'LineWidth', 2, 'DisplayName', 'sin(x)');
hold on;
plot(x, cos(x), 'b-', 'LineWidth', 2, 'DisplayName', 'cos(x)');
grid on;
legend('show');
xlabel('x');
ylabel('y');
title('Funciones Trigonométricas');
hold off;
```

---

## Ejemplos de Uso

### Ejemplo Completo 1: Derivada e Integración

```matlab
% Función: f(x) = x²
% Derivada: f'(x) = 2x
% Integral de 0 a 2: 8/3

% 1. Calcular derivada en x=1
[deriv, ~] = diferenciacionNumerica('x^2', 1, 0.01, 'central');
fprintf('f''(1) ≈ %.4f (exacto: 2)\n', deriv);

% 2. Calcular integral
[integ, ~] = simpson13('x^2', 0, 2, 100);
fprintf('∫x²dx = %.4f (exacto: %.4f)\n', integ, 8/3);
```

### Ejemplo Completo 2: Interpolación y Graficación

```matlab
% Datos experimentales
x_data = [0, 1, 2, 3, 4];
y_data = [1, 2.5, 5, 4.5, 2];

% Interpolar en varios puntos
xi_values = 0:0.1:4;
yi_spline = zeros(size(xi_values));

for i = 1:length(xi_values)
    yi_spline(i) = trazadoresCubicos(x_data, y_data, xi_values(i));
end

% Graficar todo
figure;
plot(x_data, y_data, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
hold on;
plot(xi_values, yi_spline, 'b-', 'LineWidth', 2);
grid on;
legend('Datos originales', 'Spline cúbico');
xlabel('x');
ylabel('y');
title('Interpolación con Trazadores Cúbicos');
```

---

## Consejos y Buenas Prácticas

### Diferenciación:
- **h muy pequeño:** puede causar errores de redondeo
- **h muy grande:** pierde precisión
- **Recomendado:** h entre 0.001 y 0.01
- **Mejor precisión:** Usa Richardson con n=4 o 5

### Integración:
- **Trapecio:** Rápido, usar con n ≥ 50
- **Simpson 1/3:** Mejor precisión, usa n ≥ 20 (PAR)
- **Gauss-Legendre:** Máxima precisión, n = 5-8 puntos es suficiente

### Interpolación:
- **Pocos puntos (2-5):** Cualquier método funciona
- **Puntos medios (6-10):** Preferir polinomial o Lagrange
- **Muchos puntos (>10):** SIEMPRE usar Trazadores Cúbicos
- **Datos irregulares:** Trazadores Cúbicos es la mejor opción

### Graficación:
- Usa `hold on` para superponer múltiples gráficas
- `grid on` para mejor visualización
- `legend('show')` para identificar líneas
- Ajusta `LineWidth` para mejor visibilidad

---

## Solución de Problemas Comunes

### Error: "n debe ser PAR"
**Problema:** Estás usando Simpson 1/3 con n impar  
**Solución:** Usa n = 20, 50, 100 (números pares)

### Error: "n debe ser MÚLTIPLO DE 3"
**Problema:** Estás usando Simpson 3/8 con n incorrecto  
**Solución:** Usa n = 15, 21, 99 (múltiplos de 3)

### La gráfica no aparece
**Problema:** MATLAB puede tener deshabilitada la visualización  
**Solución:** Verifica que tienes ventanas gráficas habilitadas

### Interpolación oscila mucho
**Problema:** Usas polinomial con muchos puntos  
**Solución:** Cambia a Trazadores Cúbicos (Opción 4)

### Derivada muy imprecisa
**Problema:** h muy grande o muy pequeño  
**Solución:** Usa h = 0.01 y método Central o Richardson

---

**Última actualización:** Febrero 2026  
**Todos los métodos verificados y funcionales** ✅
