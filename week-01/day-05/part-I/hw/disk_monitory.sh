#!/bin/bash

ADMIN="admin@example.com"

# Obtener el uso de la partición raíz como número entero (%)
ROOT_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//g' | awk -F. '{print $1}')

# Obtener el tamaño de /home directamente en Megabytes (número entero)
HOME_SIZE_MB=$(du -sm /home | awk '{print $1}')

# 1. Alerta si la partición raíz supera el 90%
if [ "$ROOT_USAGE" -ge 90 ]; then
    echo "Alert: Partition / is at ${ROOT_USAGE}%!" | mail -s "Alert partition /" "$ADMIN"
fi

# 2. Alerta si /home supera los 2048 MB (2 GB) usando aritmética nativa de Bash
if [ "$HOME_SIZE_MB" -gt 2048 ]; then
    echo "Alert: /home usage is ${HOME_SIZE_MB}MB!" | mail -s "Alert directory /home" "$ADMIN"
fi
