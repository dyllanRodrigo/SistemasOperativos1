
a) ¿Cuántos procesos únicos son creados?

Se crean 5 procesos únicos en total.

Explicación:

El primer fork() crea dos procesos: el proceso padre y el proceso hijo.
El proceso hijo ejecuta otro fork(), que crea dos procesos adicionales: otro proceso hijo y otro proceso padre.
El proceso padre original (el que se encuentra al principio del código) también ejecuta un fork(), que crea dos procesos más: otro proceso hijo y otro proceso padre.
En total, tenemos:

1 proceso padre original
2 procesos hijos del primer fork()
2 procesos hijos del segundo fork()
2 procesos hijos del tercer fork()
b) ¿Cuántos hilos únicos son creados?

Se crea 1 hilo único en el proceso hijo del primer fork().

Explicación:

La línea thread_create( . . .); solo se ejecuta en el proceso hijo del primer fork().
No se crean hilos en ningún otro proceso.