Para instalar el servicio y verificar sus logs, se tiene que seguir estos pasos:

Instalación del Servicio:

Copiar el script de saludo en /usr/local/bin/:

bash
Copy code
sudo cp saludo.sh /usr/local/bin/
Dale permisos de ejecución al script:

bash
Copy code
sudo chmod +x /usr/local/bin/saludo.sh
Crea el archivo de unidad systemd en /etc/systemd/system/saludo.service con el siguiente contenido:

plaintext
Copy code
[Unit]
Description=Servicio de saludo y fecha
After=network.target

[Service]
ExecStart=/usr/local/bin/saludo.sh
Restart=always
User=root

[Install]
WantedBy=multi-user.target
Habilita el servicio para que se inicie con el sistema:

bash
Copy code
sudo systemctl enable saludo.service
Inicia el servicio:

bash
Copy code
sudo systemctl start saludo.service
Verificación de Logs:

Para ver los logs del servicio y asegurarse de que está funcionando correctamente, se puede usar el siguiente comando:

bash
Copy code
sudo journalctl -u saludo.service
Para ver los logs en tiempo real, se ouede usar el siguiente comando:

bash
Copy code
sudo journalctl -u saludo.service -f
Si se desea ver solo los logs de hoy, se puede usar:

bash
Copy code
sudo journalctl -u saludo.service --since today

Para ver los logs de ayer:

bash
Copy code
sudo journalctl -u saludo.service --since yesterday --until today
Y así sucesivamente, puedes ajustar los parámetros de --since y --until según necesidad para ver los logs de un periodo específico.