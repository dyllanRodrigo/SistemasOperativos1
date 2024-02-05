#!/bin/bash

# Lea la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de GitHub: " GITHUB_USER

# Consulte la URL https://api.github.com/users/
API_URL="https://api.github.com/users/$GITHUB_USER"
JSON_RESPONSE=$(curl -s $API_URL)

# Extraer datos del JSON
USER_ID=$(echo $JSON_RESPONSE | jq -r '.id')
CREATED_AT=$(echo $JSON_RESPONSE | jq -r '.created_at')

# Imprimir mensaje
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."

# Crear log file en /tmp/<fecha>/saludos.log
LOG_DIR="/tmp/$(date +'%Y%m%d')"
LOG_FILE="$LOG_DIR/saludos.log"

mkdir -p $LOG_DIR
echo "Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT." >> $LOG_FILE

echo "Se ha creado el log en $LOG_FILE."

# cronjob para ejecutar el script cada 5 minutos
(crontab -l ; echo "*/5 * * * * $(pwd)/$(basename $0)") | crontab -
echo "Cronjob configurado para ejecutar el script cada 5 minutos."
