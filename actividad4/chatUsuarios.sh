#!/bin/bash

# Función para leer mensajes
function leer_mensajes() {
  while true; do
    if read mensaje < "$1"; then
      echo "$mensaje"
    fi
  done
}

# Función para escribir mensajes
function escribir_mensajes() {
  while true; do
    read mensaje
    echo "$mensaje" > "$1"
  done
}

# Obtener nombre de usuario
usuario=$(whoami)

# Crear named pipes
mkfifo pipe1
mkfifo pipe2

# Iniciar dos procesos: uno para leer y otro para escribir
if [[ $1 == "1" ]]; then
  escribir_mensajes pipe1 &
  leer_mensajes pipe2
elif [[ $1 == "2" ]]; then
  leer_mensajes pipe1 &
  escribir_mensajes pipe2
else
  echo "Uso: ./chat.sh 1 | 2"
  exit 1
fi

# Bucle principal
while true; do
  # Mostrar mensaje de bienvenida
  if [[ $1 == "1" ]]; then
    echo "Bienvenido al chat ($usuario) - Escribe 'salir' para terminar"
  elif [[ $1 == "2" ]]; then
    echo "Bienvenido al chat ($usuario)"
  fi

  # Leer mensaje del usuario
  read mensaje

  # Salir del chat
  if [[ $mensaje == "salir" ]]; then
    break
  fi

  # Enviar mensaje al otro usuario
  if [[ $1 == "1" ]]; then
    echo "[$usuario]: $mensaje" > pipe2
  elif [[ $1 == "2" ]]; then
    echo "[$usuario]: $mensaje" > pipe1
  fi
done

# Eliminar named pipes
rm pipe1
rm pipe2

