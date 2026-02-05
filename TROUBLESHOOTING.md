# Guía de Errores y Soluciones - Proyecto Métodos Numéricos

## Errores Comunes y Soluciones

### 1. "Error: Function or variable 'main' not recognized"

**Causa**: El archivo main.m no está en el path de MATLAB.

**Soluciones**:
- Asegúrate de estar en la carpeta del proyecto: `cd d:\...\ProyectoIntegrador-MetodosNumericos-`
- Verifica que main.m existe en esa carpeta
- En MATLAB, ve a File > Set Path > Add Folder y selecciona la carpeta del proyecto
- Ejecuta: `addpath(genpath('.'))`

---

### 2. "ERROR: Función interna (xxx) sin interfaz"

**Causa**: La función xxxyInterno() no existe o hay error de ortografía.

**Soluciones**:
- Verifica que los archivos están en las subcarpetas src/
- Comprueba que `addpath(genpath(pwd))` se ejecutó en main.m
- Revisa que los .m files no tienen la palabra clave `function` mal colocada
- Ejecuta PRUEBAS.m para detectar errores

---

### 3. Sistema No Lineal: "ERROR: No hay cambio de signo en [a, b]"

**Causa**: La función f(a) y f(b) tienen el mismo signo.

**Solución para Bisección/Falsa Posición**:
- Verifica que f(a) * f(b) < 0
- Prueba con intervalos diferentes, por ejemplo:
  - Para x^2 - 2, usa [0, 2] en lugar de [1, 2]
  - Grafica mentalmente la función primero
  - Puedes usar `fplot('x^2 - 2', [0, 3])` en MATLAB para visualizar

**Solución para Secante/Newton-Raphson**:
- Estos métodos pueden no requerir cambio de signo
- Acerca la aproximación inicial a la raíz

---

### 4. "ERROR: Sistema singular" (Sistemas Lineales)

**Causa**: La matriz A es singular (determinante = 0).

**Soluciones**:
- Verifica que la matriz es invertible
- Usa `det(A)` en MATLAB para comprobar
- Si det(A) ≈ 0, el sistema no tiene solución única
- Considera usar el método con pivote o escalamiento

---

### 5. "ERROR: Pivote nulo detectado"

**Causa**: Un elemento diagonal es cero durante la eliminación gaussiana.

**Soluciones**:
- Usa Gauss Simple con Pivote (opción 3) o Gauss Jordan
- Estos métodos intercambian filas automáticamente
- Si persiste, verifica que la matriz es invertible

---

### 6. Newton-Raphson: "ERROR: Derivada nula"

**Causa**: f'(x) = 0 en algún punto de la iteración.

**Soluciones**:
- Ingresa una derivada correcta:
  - f(x) = x^2 - 2 → f'(x) = 2*x
  - f(x) = sin(x) - 0.5 → f'(x) = cos(x)
  - f(x) = 1/x → f'(x) = -1/x^2
- Usa aproximación numérica si es necesario
- Prueba con una aproximación inicial diferente
- En ese punto, la derivada podría tener un cero

---

### 7. Función: "ERROR: Función inválida"

**Causa**: La sintaxis de la función en string es incorrecta.

**Formatos válidos para ingresar funciones**:
```
x^2 - 2                (potencia)
x^3 + x^2 + x - 1      (polinomio)
sin(x) - 0.5           (trigonométricas)
cos(x) + x             (combinadas)
exp(x) - 2             (exponencial)
log(x) - 1             (logaritmo natural)
sqrt(x) - 2            (raíz cuadrada)
1/x - 0.5              (división)
```

**Formatos inválidos**:
```
x² - 2                 (usar ^ NO ²)
f(x) = x^2             (NO escribir "f(x)=")
(x^2 - 2)              (NO necesita paréntesis externos)
x * * 2                (NO dobles operadores)
```

---

### 8. Interpolación: "ADVERTENCIA: xi fuera del intervalo"

**Causa**: Estás interpolando fuera del rango de los puntos dados (extrapolación).

**Soluciones**:
- Usa solo puntos dentro del intervalo de datos
- Para interpolar en x=5 con puntos en [0,3], primero agrega más datos
- Ten en cuenta que la extrapolación puede ser inestable
- La interpolación lineal es más confiable que polinomios para extrapolación

---

### 9. "Error: El número de ecuaciones debe ser un entero positivo"

**Causa**: Ingresaste un número inválido (negativo, cero o no numérico).

**Soluciones**:
- Ingresa solo números enteros positivos (1, 2, 3, ...)
- No ingreses 0, números negativos o texto
- Si vuelve a pedir, recuerda que n > 0

---

### 10. Gráfico no aparece

**Causa**: MATLAB no creó la ventana gráfica o está detrás de otras ventanas.

**Soluciones**:
- La primera vez presiona "s" cuando pregunte "¿Desea graficar?"
- Busca una ventana con nombre "Gráfico de Función No Lineal"
- Si no aparece, presiona Alt+Tab para cambiar ventanas
- Verifica que no marcaste "n" cuando preguntó sobre gráficos
- Si falta la ventana: `figure` seguido de los plots manualmente

---

### 11. "El programa se congelá"

**Causa**: Método no converge (loop infinito).

**Soluciones**:
- Presiona Ctrl+C para detener la ejecución
- Aumenta la tolerancia (prueba con 1e-3 en lugar de 1e-6)
- Reduce máximo de iteraciones a 50 primero
- Verifica que tu función es correcta con `fplot()`
- Prueba con un intervalo/aproximación inicial diferente
- Algunos métodos NO convergen para ciertas funciones

---

### 12. Resultados incorrectos en Sistemas Lineales

**Causa**: Ingreso de datos incorrecto.

**Verificación**:
```
Sistema: 2x + y = 5
         3x - y = 5

n = 2 ✓
A(1,1) = 2, A(1,2) = 1 ✓
A(2,1) = 3, A(2,2) = -1 ✓
B(1) = 5 ✓
B(2) = 5 ✓

Respuesta esperada: x1 = 2, x2 = 1
```

**Verificar respuesta**:
- Sustituyen en las ecuaciones originales
- 2*2 + 1 = 5 ✓
- 3*2 - 1 = 5 ✓

---

### 13. Interpolación de Lagrange da un resultado muy diferente

**Causa**: Comportamiento normal para muchos puntos (fenómeno de Runge).

**Soluciones**:
- Es normal con 5+ puntos espaciados uniformemente
- Usa interpolación lineal entre dos puntos para mejor comportamiento
- Considera usar polinomios de grado bajo
- Para muchos datos, considera regresión en lugar de interpolación

---

### 14. "Error al graficar. Verifique la función ingresada."

**Causa**: Error en la función durante la evaluación.

**Soluciones**:
- Verifica la sintaxis de la función nuevamente
- Prueba componentes por separado en MATLAB:
  ```
  f = @(x) x^2 - 2;
  f(1)  % Debería ser -1
  ```
- Si tiene logaritmos, asegúrate que x > 0
- Si tiene raícesles, x debe ser positivo (para raíces reales)
- Evita divisiones por cero: `1/(x-1)` requiere x ≠ 1

---

### 15. "Opción inválida. Intente de nuevo"

**Causa**: Ingresaste un número que no corresponde a ninguna opción.

**Soluciones**:
- Mira el menú:
  ```
  1. Gauss Simple
  2. Gauss Jordan
  3. ...
  5. Volver
  ```
- Solo puedes seleccionar 1, 2, 3, 4 o 5
- No puedes ingresar letras o números fuera del rango
- Tampoco ingresas 0

---

## Consejos Para Evitar Errores

### ✓ Antes de usar Bisección
1. Grafica la función mentalmente o con `fplot()`
2. Verifica que hay un cero en el intervalo [a,b]
3. Comprueba que f(a)*f(b) < 0

### ✓ Antes de usar Newton-Raphson
1. Verifica que la derivada es fácil de calcular
2. Asegúrate que la aproximación inicial es buena
3. Si la derivada es nula en la raíz, el método no funciona bien

### ✓ Antes de Interpolar
1. Ordena los puntos de menor a mayor en x
2. Asegúrate de tener al menos 2 puntos
3. Si usas pocos puntos (2-3), la interpolación es más estable

### ✓ Antes de Resolver Sistemas
1. Verifica que la matriz no es singular: `det(A) ≠ 0`
2. Comprueba dimensiones: n ecuaciones, n incógnitas
3. Si hay problemas numéricos, usa pivote o escalamiento

---

## Debug Rápido

### Ejecutar Pruebas
```matlab
PRUEBAS  % Verifica que todo se carga
```

### Verificar una Función
```matlab
addpath(genpath('.'))
A = [2 1; 3 -1];
B = [5; 5];
[x, cond] = gaussSimpleInterno(A, B)
```

### Graficar una Función
```matlab
fplot('x^2 - 2', [0 3])
grid on
```

### Probar Bisección
```matlab
[r, iter, fx, hist] = biseccionInterno('x^2 - 2', 1, 2, 1e-6, 100)
```

---

## ¿Aún No Funciona?

1. **Reinstala el proyecto**:
   - Copia nuevamente los archivos
   - Asegúrate que main.m existe
   - Verifica rutas de carpetas

2. **Reinicia MATLAB**:
   - A veces ayuda cerrar y abrir de nuevo

3. **Ejecuta PRUEBAS.m**:
   - Te dirá exactamente dónde está el problema

4. **Revisa puntuación**:
   - Verificar que la sintaxis MATLAB es correcta
   - Los strings usan comillas simples: 'function'

5. **Contacta al profesor**:
   - Si persisten los errores, proporciona el mensaje exacto
