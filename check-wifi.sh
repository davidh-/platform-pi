#!/bin/bash

# Check if connected to WiFi
isConnected=$(/usr/sbin/iwgetid -r)

while true; do
    if [ "$isConnected" ]; then
        echo "Connected to WiFi"
    else
        echo "Not connected to WiFi, stopping uap0 service..."
        systemctl stop uap@0
        echo "Attempting to reconnect to WiFi..."
        # Wait for the connection to be re-established
        while [ -z "$isConnected" ]; do
            sleep 5
            isConnected=$(iwgetid -r)
        done
        echo "Connected to WiFi, starting uap0 service..."
        systemctl start uap@0
    fi
    # Check connection every 10 seconds
    sleep 10
    isConnected=$(/usr/sbin/iwgetid -r)
done
