# SistemasOperativos1
Sistemas Operativos 1 - 201907774

## Características principales del Completely Fair Scheduler (CFS) de Linux:

**1. Planificación basada en tiempo:** CFS utiliza un algoritmo de planificación basado en tiempo, en lugar de colas de ejecución. Esto significa que a cada tarea se le asigna un "presupuesto" de tiempo de CPU, que se agota a medida que la tarea se ejecuta.

**2. Árbol rojo-negro:** CFS utiliza un árbol rojo-negro para almacenar una línea de tiempo de las futuras tareas que usarán la CPU. Este árbol permite una búsqueda rápida y eficiente de la siguiente tarea que debe ejecutarse.

**3. Prioridades:** CFS admite prioridades de tareas, que se utilizan para determinar qué tareas se ejecutan primero cuando hay varias tareas en espera.

**4. Interactividad:** CFS está diseñado para ser interactivo, lo que significa que las tareas que necesitan responder rápidamente a la entrada del usuario (como las aplicaciones de interfaz gráfica) se ejecutan con mayor prioridad.

**5. Ahorro de energía:** CFS puede utilizar técnicas de ahorro de energía para reducir el consumo de energía del sistema.

## Funcionamiento del CFS:

1. Cuando se crea una nueva tarea, se le asigna un "presupuesto" de tiempo de CPU y se coloca en el árbol rojo-negro.
2. La tarea con el mayor presupuesto de tiempo restante se ejecuta primero.
3. A medida que la tarea se ejecuta, su presupuesto de tiempo se agota.
4. Cuando el presupuesto de tiempo de una tarea se agota, se coloca al final del árbol rojo-negro.
5. Si hay varias tareas con el mismo presupuesto de tiempo restante, se selecciona una de ellas al azar para ejecutarse.

**Ventajas del CFS:**

* Equidad: CFS asegura que todas las tareas tengan un acceso justo a la CPU.
* Eficiencia: CFS utiliza el tiempo de CPU de forma eficiente, minimizando el tiempo de inactividad.
* Interactividad: CFS da prioridad a las tareas interactivas, lo que mejora la experiencia del usuario.
* Ahorro de energía: CFS puede ayudar a reducir el consumo de energía del sistema.

**Desventajas del CFS:**

* Complejidad: CFS es un algoritmo complejo, lo que puede dificultar su comprensión y configuración.
* Overhead: CFS puede tener un pequeño overhead de rendimiento debido a la necesidad de mantener el árbol rojo-negro.

**Referencias:**

* Linux Kernel documentation: Completely Fair Scheduler: [se quitó una URL no válida]
* The Linux Programming Interface: Chapter 23. Scheduling: [se quitó una URL no válida]
* Modern Operating Systems (4th Edition): Chapter 6. Process Scheduling: [se quitó una URL no válida]
