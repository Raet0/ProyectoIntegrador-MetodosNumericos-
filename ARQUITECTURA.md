# Arquitectura del Proyecto - Métodos Numéricos

## Diagrama General

```
┌─────────────────────────────────────────────────────────┐
│                      MAIN.M                             │
│              (Menú Principal - Punto de entrada)        │
└────────────┬──────────────────────┬──────────────────────┘
             │                      │
      ┌──────▼──────┐        ┌──────▼────────┐
      │ Lineales    │        │ No Lineales   │
      │ Menú        │        │ Menú          │
      └──────┬──────┘        └──────┬────────┘
             │                      │
    ┌────────┴────────────┬─────────┴────────┬──────┐
    │                     │                  │      │
┌───▼────┐   ┌───────┐  ┌─▼────┐   ┌────┐  │  ┌──▼──┐
│GaussS  │   │GaussJ │  │BiN   │   │Fal │  │  │Sec  │
│Multiple│   │Multiple│  │Multiple │Pos │  │  │iple │
└────────┘   └───────┘  └──────┘   └────┘  │  └─────┘
                                            │
                                         ┌──▼──┐
                                         │Newt │
                                         │Raph │
                                         └─────┘
```

## Flujo de Ejecución

### 1. Ejecución Principal
```
main.m
├── Inicializa rutas (addpath)
├── Muestra menú principal
└── Crea loop hasta que usuario selecciona "Salir"
    ├── Opción 1 → menuSistemasLineales()
    ├── Opción 2 → menuSistemasNoLineales()
    ├── Opción 3 → menuInterpolacion()
    └── Opción 4 → Cierra aplicación
```

### 2. Flujo de Sistemas Lineales
```
menuSistemasLineales()
└── Loop del menú
    └── Opción elegida (1-5)
        ├── 1 → ejecutarGaussSimple()
        │   ├── obtenerSistemaLineal() → Pide datos
        │   ├── gaussSimpleInterno(A,B) → Calcula
        │   └── mostrarResultadosSistemaLineal(x) → Muestra
        │
        ├── 2 → ejecutarGaussJordan()
        │   ├── obtenerSistemaLineal()
        │   ├── gaussJordanInterno(A,B)
        │   └── mostrarResultadosSistemaLineal(x)
        │
        ├── 3 → ejecutarGaussSimpleR()
        │   ├── obtenerSistemaLineal()
        │   ├── gaussSimpleRInterno(A,B)
        │   └── mostrarResultadosSistemaLineal(x)
        │
        ├── 4 → ejecutarGaussJordanE()
        │   ├── obtenerSistemaLineal()
        │   ├── gaussJordanEInterno(A,B)
        │   └── mostrarResultadosSistemaLineal(x)
        │
        └── 5 → Volver al menú principal
```

### 3. Flujo de Sistemas No Lineales
```
menuSistemasNoLineales()
└── Loop del menú
    └── Opción elegida (1-5)
        ├── 1 → ejecutarBiseccion()
        │   ├── obtenerParametrosNoLineales() → [a, b, tol, iter]
        │   ├── Pide: función f(x)
        │   ├── biseccionInterno() → Calcula raíz
        │   ├── mostrarResultadosNoLineales() → Muestra resultado
        │   └── ¿Graficar? → Si → visualizarFuncionNoLineal()
        │
        ├── 2 → ejecutarFalsaPosicion()
        │   ├── Similar a Bisección
        │   ├── falsaPosicionInterno()
        │   └── Gráfico opcional
        │
        ├── 3 → ejecutarSecante()
        │   ├── Pide: x0, x1, tol, iter
        │   ├── Pide: función f(x)
        │   ├── secanteInterno()
        │   └── Gráfico opcional
        │
        ├── 4 → ejecutarNewtonRaphson()
        │   ├── Pide: x0, tol, iter
        │   ├── Pide: función f(x)
        │   ├── Pide: derivada f'(x)
        │   ├── newtonRaphsonInterno()
        │   └── Gráfico opcional
        │
        └── 5 → Volver al menú principal
```

### 4. Flujo de Interpolación
```
menuInterpolacion()
└── Loop del menú
    └── Opción elegida (1-4)
        ├── 1 → ejecutarInterpolacionLineal()
        │   ├── Pide: n puntos
        │   ├── Pide: xi (punto a interpolar)
        │   ├── interpolacionLinealInterno()
        │   └── Gráfico opcional
        │
        ├── 2 → ejecutarInterpolacionPolinomial()
        │   ├── Pide: n puntos
        │   ├── Pide: xi
        │   ├── interpolacionPolinomialInterno()
        │   └── Gráfico opcional
        │
        ├── 3 → ejecutarInterpolacionLagrange()
        │   ├── Pide: n puntos
        │   ├── Pide: xi
        │   ├── laGranjeInterno()
        │   └── Gráfico opcional
        │
        └── 4 → Volver al menú principal
```

## Componentes y Responsabilidades

### main.m
- **Responsabilidad**: Punto de entrada, menú principal
- **Entrada**: Selección del usuario (1-4)
- **Salida**: Llama a menuXXX()
- **Características**: Loop continuo hasta "Salir"

### menuXXX.m (3 archivos)
- **menuSistemasLineales.m**: Submenú sistemas lineales
- **menuSistemasNoLineales.m**: Submenú sistemas no lineales
- **menuInterpolacion.m**: Submenú interpolación

**Responsabilidad**: Manejar UI de cada categoría
**Entrada**: Selección del usuario del submenú
**Salida**: Llama ejecutarXXX() según opción
**Características**: Loop local, valida entrada

### funcionesAuxiliares.m
Contiene funciones de utilidad:
- `obtenerSistemaLineal()` - Entrada/salida de datos lineales
- `obtenerParametrosNoLineales()` - Entrada de parámetros
- `mostrarResultadosSistemaLineal()` - Muestra soluciones
- `mostrarResultadosNoLineales()` - Muestra raíces
- `visualizarFuncionNoLineal()` - Grafica funciones
- `visualizarInterpolacion()` - Grafica interpolaciones

### src/lineales/ (4 funci ones)
```
gaussSimple.m
├── gaussSimpleInterno(A, B) → [x, condicion]
└── gaussSimple() → UI wrapper

gaussJordan.m
├── gaussJordanInterno(A, B) → [x, condicion]
└── gaussJordan() → UI wrapper

gaussSimpleR.m (Pivote Parcial)
├── gaussSimpleRInterno(A, B) → [x, condicion]
└── gaussSimpleR() → UI wrapper

gaussJordanE.m (Escalamiento)
├── gaussJordanEInterno(A, B) → [x, condicion]
└── gaussJordanE() → UI wrapper
```

**Responsabilidad**: Implementar métodos de sistemas lineales
**Entrada**: Matriz A nxn, Vector B nx1
**Salida**: Vector solución x, condición de éxito
**Validación**: Pivotes nulos, matrices singulares

### src/nolineales/ (4 funciones)
```
biseccion.m
├── biseccionInterno(f_str, a, b, tol, iter_max) → [raiz, iter, fx, hist]
└── Retorna coordenadas del historial de iteraciones

falsaPosicion.m
├── falsaPosicionInterno(f_str, a, b, tol, iter_max) → [raiz, iter, fx, hist]
└── Usa interpolación lineal

secante.m
├── secanteInterno(f_str, x0, x1, tol, iter_max) → [raiz, iter, fx, hist]
└── No requiere derivada

newtonRapshon.m
├── newtonRaphsonInterno(f_str, fp_str, x0, tol, iter_max) → [raiz, iter, fx, hist]
└── Requiere función y derivada
```

**Responsabilidad**: Encontrar raíces de ecuaciones
**Entrada**: Función (string), parámetros del intervalo
**Salida**: Raíz encontrada, número de iteraciones
**Validación**: Cambio de signo, derivadas nulas

### src/interpolacion/ (3 funciones)
```
lineal.m
├── interpolacionLinealInterno(x, y, xi) → [yi, indices]
└── Usa dos puntos más cercanos

polinomial.m
├── interpolacionPolinomialInterno(x, y, xi) → [yi, coef]
└── Newton's divided differences

laGranje.m
├── laGranjeInterno(x, y, xi) → [yi, poly]
└── Polinomios de Lagrange
```

**Responsabilidad**: Interpolar valores en puntos
**Entrada**: Puntos (x, y), punto xi a interpolar
**Salida**: Valor yi interpolado
**Validación**: Extrapolación fuera del intervalo

## Convenciones de Código

### Nombres de Funciones
- `xxxInterno()`: Función de cálculo puro (sin UI)
- `xxx()`: Wrapper para compatibilidad
- `ejecutarXxx()`: Ejecuta desde menú
- `obtenerXxx()`: Obtiene entrada del usuario
- `mostrarXxx()`: Muestra salida
- `visualizarXxx()`: Dibuja gráficos

### Retorno de Funciones
- Funciones internas retornan SOLO datos numéricos
- `[solucion, exito]` para booleanos
- `[resultado, iteraciones, error, historial]` para métodos iterativos

### Parámetros
- `A, B` para matriz y vector en sistemas lineales
- `f_str` para función como string
- `x, y` para datos de interpolación
- `tol` para tolerancia
- `maxIter` o `iter_max` para máximo de iteraciones

### Validación
- Verificar entrada en menús
- Detectar condiciones de error en funciones
- Retornar `condicion = false` o `NaN` para errores
- Mostrar mensajes de error al usuario

## Separación de Responsabilidades

**UI Layer (Menús)**
- Entrada de usuario
- Validación de entrada
- Presentación de resultados
- Decisión de gráficos

**Cálculo Layer (xxxInterno)**
- Algoritmo puro
- Validación numérica
- Retorno de datos
- Sin interacción con usuario

**Utilidad Layer (funcionesAuxiliares)**
- Reutilizable en todos los menús
- Consistencia en entrada/salida
- Gráficos centralizados

## Ventajas de la Arquitectura

1. **Modularidad**: Cada función tiene una responsabilidad clara
2. **Reutilización**: Funciones auxiliares usadas por múltiples menús
3. **Testabilidad**: Funciones internas pueden usarse directamente
4. **Mantenimiento**: Cambios localizados sin afectar todo
5. **Escalabilidad**: Fácil agregar nuevos métodos
6. **Flexibilidad**: Los menús pueden cambiar sin alterar algoritmos

## Flujo de Datos

```
Usuario
  │
  ├─ Selecciona opción
  │
  ▼
main.m (Menú principal)
  │
  ├─ Llama menuXXX()
  │
  ▼
menuXXX.m (Submenú)
  │
  ├─ Llama ejecutarYYY()
  │
  ▼
ejecutarYYY() (Función de ejecución)
  │
  ├─ Llama obtenerDatos()
  ├─ Llama yyyInterno() [Cálculo]
  └─ Llama mostrarResultados()
      └─ Llama visualizar() [Opcional]
         │
         └─ Retorna al menú
```

## Testing

El archivo `PRUEBAS.m` verifica:
1. Carga de todas las funciones
2. Ejecución correcta sin errores
3. Resultados numéricos válidos
4. Convergencia de métodos iterativos

Ejecuta: `PRUEBAS` en MATLAB
