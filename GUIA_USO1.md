# ProyectoIntegrador - Métodos Numéricos

## Descripción

Aplicación MATLAB completa que implementa métodos numéricos para:
1. Solución de sistemas de ecuaciones lineales
2. Solución de sistemas de ecuaciones no lineales
3. Interpolación y regresión por mínimos cuadrados

## Características

- **Interfaz de usuario intuitiva** con menús navegables
- **Entrada de datos flexible** por consola
- **Gráficos opcionales automáticos** cuando el método lo requiere
- **Arquitectura modular** separando lógica de UI
- **Validación de datos** en todas las entradas

## Estructura del Proyecto

```
├── main.m                              # Programa principal
├── menuSistemasLineales.m             # Menú sistemas lineales
├── menuSistemasNoLineales.m           # Menú sistemas no lineales
├── menuInterpolacion.m                 # Menú interpolación
├── menuIntegracion.m                   # Menú integración numérica
├── menuDiferenciacion.m                # Menú diferenciación numérica
├── menuEcuacionesDiferenciales.m      # Menú ecuaciones diferenciales
├── funcionesAuxiliares.m               # Funciones de entrada/salida
└── src/
    ├── lineales/
    │   ├── gaussSimple.m               # Gauss Simple
    │   ├── gaussJordan.m               # Gauss Jordan
    │   ├── gaussSimpleR.m              # Gauss Simple con Pivote
    │   └── gaussJordanE.m              # Gauss Jordan con Escalamiento
    ├── nolineales/
    │   ├── biseccion.m                 # Método Bisección
    │   ├── falsaPosicion.m             # Método Falsa Posición
    │   ├── secante.m                   # Método Secante
    │   └── newtonRapshon.m             # Método Newton-Raphson
    ├── interpolacion/
    │   ├── lineal.m                    # Interpolación Lineal
    │   ├── polinomial.m                # Interpolación Polinomial
    │   ├── laGranje.m                  # Interpolación de Lagrange
    │   └── trazadoresCubicos.m         # Trazadores Cúbicos
    ├── integracion/
    │   ├── trapecio.m                  # Método del Trapecio
    │   ├── simpson13.m                 # Simpson 1/3
    │   ├── simpson38.m                 # Simpson 3/8
    │   └── gaussLegendre.m             # Gauss-Legendre
    ├── diferenciacion/
    │   ├── diferenciacionNumerica.m    # Diferencias Finitas
    │   ├── richardson.m                # Extrapolación de Richardson
    │   └── derivadasDatosIrregulares.m # Derivadas de Datos Irregulares
    └── ecuacionesDiferenciales/
        ├── metodoEuler.m               # Método de Euler
        └── eulerMejorado.m             # Método de Euler Mejorado (Heun)
```

## Cómo Usar

### 1. Iniciar la Aplicación

En MATLAB, ejecuta:
```matlab
main
```

### 2. Menú Principal

Seleccione una categoría:
- **1** - Sistemas de ecuaciones LINEALES
- **2** - Sistemas de ecuaciones NO LINEALES
- **3** - Interpolación y Regresión
- **4** - Integración Numérica
- **5** - Diferenciación Numérica
- **6** - Ecuaciones Diferenciales Ordinarias
- **7** - Salir

### 3. Ejemplos de Uso

#### Ejemplo 1: Sistemas Lineales (Gauss Simple)

Resolver el sistema:
```
2x + y = 5
3x - y = 5
```

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **1** (Sistemas Lineales)
3. Seleccionar opción **1** (Gauss Simple)
4. Ingresar n = 2
5. Ingresar matriz A: A(1,1)=2, A(1,2)=1, A(2,1)=3, A(2,2)=-1
6. Ingresar vector B: B(1)=5, B(2)=5
7. Resultado: x1=2, x2=1

#### Ejemplo 2: Sistemas No Lineales (Bisección)

Encontrar la raíz de f(x) = x² - 2

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **2** (Sistemas No Lineales)
3. Seleccionar opción **1** (Bisección)
4. Ingresar intervalo: a=1, b=2
5. Ingresar tolerancia: 1e-6
6. Ingresar máx iteraciones: 100
7. Ingresar función: `x^2 - 2`
8. Ver resultado y gráfico

#### Ejemplo 3: Interpolación (Lagrange)

Interpolar con puntos (0, 1), (1, 2), (2, 5) en x = 0.5

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **3** (Interpolación)
3. Seleccionar opción **3** (Lagrange)
4. Ingresar número de puntos: 3
5. Ingresar puntos:
   - Punto 1: x=0, y=1
   - Punto 2: x=1, y=2
   - Punto 3: x=2, y=5
6. Punto a interpolar: 0.5
7. Ver resultado: y(0.5) ≈ 1.5 (interpolado)
8. Ver gráfico con puntos y polinomio

#### Ejemplo 4: Integración Numérica (Simpson 1/3)

Calcular ∫(x² + 1)dx desde 0 hasta 2

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **4** (Integración Numérica)
3. Seleccionar opción **2** (Simpson 1/3)
4. Ingresar función: `x^2 + 1`
5. Límite inferior: 0
6. Límite superior: 2
7. Número de subintervalos: 4 (DEBE SER PAR)
8. Resultado: Integral ≈ 5.3333, Error estimado: 0.0053
9. Comparar: Valor exacto = 5.333... ✓ Muy preciso!

**Cuándo usar cada método:**
- **Trapecio**: Para integrales simples, rápido pero menos preciso
- **Simpson 1/3**: Mejor precisión, n DEBE SER PAR (recomendado)
- **Simpson 3/8**: Similar a Simpson 1/3, n DEBE SER MÚLTIPLO DE 3
- **Gauss-Legendre**: Mayor precisión, ideal para funciones suaves (2-10 puntos)

#### Ejemplo 5: Diferenciación Numérica (Diferencias Centrales)

Calcular la derivada de f(x) = sin(x) en x = π/4

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **5** (Diferenciación Numérica)
3. Seleccionar opción **1** (Diferenciación)
4. Ingresar función: `sin(x)`
5. Punto x₀ = pi/4
6. Tamaño del paso h = 0.01
7. Seleccionar tipo: **3** (Central - más preciso)
   - Central: f'(x) ≈ [f(x+h) - f(x-h)]/(2h)
8. Resultado: f'(π/4) ≈ 0.7071 (compara con cos(π/4) = 0.7071 ✓)

**Cuándo usar cada tipo:**
- **Adelante**: Para puntos al inicio del dominio
- **Atrás**: Para puntos al final del dominio
- **Central**: Mejor precisión O(h²), recomendado cuando es posible

#### Ejemplo 6: Ecuaciones Diferenciales (Método de Euler)

Resolver dy/dt = t + y con y(0) = 1, desde t=0 hasta t=2

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **6** (Ecuaciones Diferenciales)
3. Seleccionar opción **1** (Método de Euler)
4. Ingresar dy/dt = f(t,y): `t + y`
5. Valor inicial t₀: 0
6. Valor inicial y₀: 1
7. Valor final tƒ: 2
8. Tamaño del paso h: 0.1
9. Ver tabla con t y y(t) calculados
10. ¿Desea ver gráfica?: s
11. Ver solución numérica graficada

**Cuándo usar cada método:**
- **Método de Euler**: Simple, pero error acumula rápido
- **Euler Mejorado (Heun)**: Mejor precisión, O(h³), recomendado

#### Ejemplo 7: Interpolación con Trazadores Cúbicos

Interpolar 4 puntos con splines cúbicos

Pasos:
1. Ejecutar `main`
2. Seleccionar opción **3** (Interpolación)
3. Seleccionar opción **4** (Trazadores Cúbicos)
4. Ingresar número de puntos: 4
5. Ingresar puntos:
   - (0, 0), (1, 2), (2, 1), (3, 3)
6. Puntos a interpolar: 0.5, 1.5, 2.5
7. Ver resultados suaves y continuos
8. Ver gráfico con splines

**Cuándo usar:**
- **Trazadores Cúbicos**: Cuando necesitas interpolación suave entre muchos puntos
- Mejor que polinomios de alto grado (evita oscilaciones)


## Métodos Implementados

### Sistemas Lineales

1. **Gauss Simple**: Eliminación gaussiana sin pivote. Rápido pero inestable con pivotes pequeños.
2. **Gauss Jordan**: Eliminación completa hacia el pivote diagonal. Produce la solución directamente.
3. **Gauss Simple con Pivote**: Con estrategia de pivote parcial para mejorar estabilidad.
4. **Gauss Jordan con Escalamiento**: Con escalamiento de filas para mejorar condicionamiento.

### Sistemas No Lineales

1. **Bisección**: Método robusto para encontrar raíces mediante división de intervalos. Requiere cambio de signo.
2. **Falsa Posición**: Mejora de bisección que usa interpolación lineal entre puntos.
3. **Secante**: No requiere derivada, usa aproximación de la derivada.
4. **Newton-Raphson**: Muy rápido pero requiere la función y su derivada. Puede no converger si derivada es nula.

### Interpolación

1. **Lineal**: Interpolación entre dos puntos más cercanos. Sencilla pero menos precisa.
2. **Polinomial**: Interpolación por diferencias divididas de Newton. Precisa para múltiples puntos.
3. **Lagrange**: Interpolación por polinomios de Lagrange. Alternativa a Newton, mismo grado.
4. **Trazadores Cúbicos**: Splines cúbicos naturales. Interpolación suave que evita oscilaciones de polinomios de alto grado.

### Integración Numérica

1. **Método del Trapecio**: Aproxima el área bajo la curva con trapezoides. 
   - Fórmula: ∫ƒ(x)dx ≈ (h/2)[ƒ(x₀) + 2ƒ(x₁) + ... + ƒ(xₙ)]
   - Error: O(h²) para caso simple, O(h³) compuesto
   - Uso: Rápido, precisión moderada

2. **Simpson 1/3**: Usa parábolas en intervalos para mejor aproximación.
   - Fórmula: ∫ƒ(x)dx ≈ (h/3)[ƒ(x₀) + 4ƒ(x₁) + 2ƒ(x₂) + 4ƒ(x₃) + ... + ƒ(xₙ)]
   - Requisito: **n DEBE SER PAR**
   - Error: O(h⁴)
   - Uso: Mejor precisión que trapecio, muy común

3. **Simpson 3/8**: Usa cúbicas en intervalos de 3 subintervalos.
   - Fórmula: ∫ƒ(x)dx ≈ (3h/8)[ƒ(x₀) + 3ƒ(x₁) + 3ƒ(x₂) + 2ƒ(x₃) + ... + ƒ(xₙ)]
   - Requisito: **n DEBE SER MÚLTIPLO DE 3**
   - Error: O(h⁴)
   - Uso: Alternativa a Simpson 1/3

4. **Gauss-Legendre**: Usa puntos y pesos óptimos basados en polinomios de Legendre.
   - Rango: 2 a 10 puntos
   - Error: O(h^(2n)) donde n = número de puntos
   - Uso: Máxima precisión para funciones suaves

### Diferenciación Numérica

1. **Diferenciación Numérica (Diferencias Finitas)**:
   - **Adelante**: f'(x) ≈ [f(x+h) - f(x)]/h, Error: O(h)
   - **Atrás**: f'(x) ≈ [f(x) - f(x-h)]/h, Error: O(h)
   - **Central**: f'(x) ≈ [f(x+h) - f(x-h)]/(2h), Error: O(h²) - MÁS PRECISA
   - Uso: Simple y directa, ideal para funciones analíticas

2. **Extrapolación de Richardson**: Mejora la precisión usando múltiples tamaños de paso.
   - Combina aproximaciones de diferentes h para error O(h⁴)
   - Usa tabla triangular de extrapolación
   - Uso: Derivadas con máxima precisión

3. **Derivadas de Datos Irregularmente Espaciados**: Maneja datos donde los puntos no están equiespaciados.
   - Usa interpolación de Lagrange para calcular derivadas
   - Ideal para datos experimentales
   - Tipos: Adelante, Atrás, Central

### Ecuaciones Diferenciales Ordinarias

1. **Método de Euler**: Método simple de un paso.
   - Fórmula: y_{n+1} = y_n + h·f(t_n, y_n)
   - Error local: O(h²), Error global: O(h)
   - Uso: Introducción a resolver EDO, simple pero menos preciso

2. **Método de Euler Mejorado (Heun)**: Mejora a Euler usando aproximación de punto medio.
   - Fórmula: y_{n+1} = y_n + (h/2)[f(t_n, y_n) + f(t_{n+1}, y_{n+1}^{pred})]
   - Error local: O(h³), Error global: O(h²)
   - Uso: RECOMENDADO - Mejor balance precisión/complejidad

## Validación de Datos

La aplicación valida automáticamente:
- ✓ Números positivos donde sea requerido
- ✓ Intervalos válidos para métodos no lineales
- ✓ Cambio de signo en bisección y falsa posición
- ✓ Derivadas no nulas en Newton-Raphson
- ✓ Matrices no singulares en sistemas lineales
- ✓ **n PAR para Simpson 1/3** (validación crucial)
- ✓ **n MÚLTIPLO DE 3 para Simpson 3/8** (validación crucial)
- ✓ Parámetros dentro de rangos válidos
- ✓ Funciones válidas y evaluables es MATLAB

## Gráficos

Los gráficos se muestran **únicamente cuando es necesario**:

- **Sistemas No Lineales**: 
  - Gráfico de f(x) con la raíz encontrada marcada
  - Líneas de eje de referencia
  - Opcional: pregunta si desea ver gráfico

- **Interpolación**: 
  - Puntos dados marcados
  - Punto interpolado destacado
  - Líneas conectoras para referencia
  - Splines cúbicos suaves

- **Integración**: 
  - Sin gráficos (cálculo numérico puro)

- **Diferenciación**: 
  - Sin gráficos (cálculo puro)

- **Ecuaciones Diferenciales**: 
  - Gráfico de la solución t vs y(t)
  - Opcional: pregunta si desea ver gráfico
  - Diferentes colores para Euler (azul) vs Euler Mejorado (rojo)

- **Sistemas Lineales**: 
  - Sin gráficos (problemas algebraicos)

## Consejos Prácticos

### Selección de Métodos

**Para Sistemas Lineales:**
- Usa **Gauss Simple** para sistemas pequeños (< 100 ecuaciones)
- Usa **Gauss Simple con Pivote** para mejor estabilidad
- Usa **Gauss Jordan** si necesitas la matriz inversa también

**Para Sistemas No Lineales:**
- **Bisección**: Siempre funciona si f(a)·f(b) < 0, pero lento
- **Newton-Raphson**: Muy rápido si tienes la derivada, pero puede divergir
- **Secante**: No requiere derivada, convergencia casi tan rápida como Newton
- **Falsa Posición**: Balance entre bisección y secante

**Para Integración:**
- **Trapecio**: Práctica, rápida, OK para integrales simples
- **Simpson 1/3**: 👍 RECOMENDADO - Mejor que trapecio
- **Simpson 3/8**: Alternativa a Simpson 1/3
- **Gauss-Legendre**: Máxima precisión con pocos puntos (2-10)

**Para Diferenciación:**
- **Diferencias Centrales**: 👍 RECOMENDADO - O(h²)
- **Diferencias Adelante/Atrás**: Cuando no puedes usar central
- **Richardson**: Cuando necesitas máxima precisión
- **Datos Irregulares**: SOLO para datos no equiespaciados

**Para EDO:**
- **Euler Simple**: Educativo, baja precisión
- **Euler Mejorado**: 👍 RECOMENDADO - O(h²) vs O(h) de Euler

### Tamaños de Paso Recomendados

| Método | h Recomendado | Notas |
|--------|---------------|-------|
| Diferencias Finitas | 0.001 - 0.0001 | h pequeño pero no demasiado (errores de redondeo) |
| Integración Trapecio | n ≥ 50 | Aumentar n para mejor precisión |
| Simpson 1/3 | n ≥ 20 (par) | Mucho mejor que trapecio con menos puntos |
| EDO - Euler | 0.01 - 0.1 | Depende de la suavidad de la solución |
| EDO - Euler Mejorado | 0.1 - 1.0 | Puede usar h más grande |

## Troubleshooting Rápido

| Problema | Solución |
|----------|----------|
| Simpson 1/3: "Error n debe ser par" | Incrementa o decrementa n en 1 |
| Simpson 3/8: "Error n debe ser múltiplo de 3" | Haz n = múltiplo de 3 (3, 6, 9, 12...) |
| Newton-Raphson no converge | Intenta otro método o proporciona mejor aproximación inicial |
| Integración: resultado negativo o muy grande | Verifica que [a,b] sea correcto y que f(x) sea válida |
| Diferenciación: derivada muy pequeña | Revisa el punto x₀ y el tamaño h |
| EDO: solución salta mucho | Reduce el tamaño del paso h |

## Architec tura Técnica

### Diseño Modular

Cada método implementa funciones separadas:

```
menuXXX.m (Interfaz)
    ├── obtenerDatos()
    ├── xxxInterno() (Cálculo)
    ├── mostrarResultados()
    └── visualizar() (Gráficos)
```

### Sin Acoplamiento UI-Lógica

- Funciones internas puras que reciben parámetros
- Retornan solo datos numéricos, no UI
- Reutilizables en otros contextos

## Requisitos

- MATLAB R2018b o superior
- No requiere toolboxes adicionales
- Compatible con MATLAB Online

## Evaluación del Proyec to

Criterios de calificación:
- **Presentación**: 4 puntos
- **Funcionalidad**: 3 puntos
- **Defensa y Exposición**: 5 puntos
- **Total**: 12 puntos

## Autores

Proyecto Integrador - Métodos Numéricos
Curso de Análisis Numérico
