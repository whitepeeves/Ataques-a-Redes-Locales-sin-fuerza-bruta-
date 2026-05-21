# Ver tu interfaz WiFi (normalmente wlan0)
sudo airmon-ng

# Matar procesos que interfieran
sudo airmon-ng check kill

# Activar modo monitor (crea wlan0mon)
sudo airmon-ng start wlan0

# Verificar que se creó
sudo airmon-ng