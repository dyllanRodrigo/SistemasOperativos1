#!/bin/bash

# Script para configurar un servicio systemd que imprime un saludo y la fecha actual infinitamente con una pausa de un segundo

# Crear el script de saludo
cat << 'EOF' > /usr/local/bin/saludo.sh
#!/bin/bash
while true
do
    echo "Hola, la fecha actual es: $(date)"
    sleep 1
done
EOF

# Dar permisos de ejecución al script
chmod +x /usr/local/bin/saludo.sh

# Crear el archivo de unidad systemd
cat << 'EOF' > /etc/systemd/system/saludo.service
[Unit]
Description=Servicio de saludo y fecha
After=network.target

[Service]
ExecStart=/usr/local/bin/saludo.sh
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

# Habilitar el servicio
systemctl enable saludo.service

# Iniciar el servicio
systemctl start saludo.service

# Mostrar los logs del servicio
journalctl -u saludo.service
