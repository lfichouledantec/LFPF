#!/bin/bash

while true
do
    # Installer Apache si absent
    if ! command -v apache2 > /dev/null; then
        echo "$(date): Apache2 not found. Installing..."
        sudo apt update && sudo apt install -y apache2
    fi

    # Installer MySQL si absent
    if ! command -v mysqld > /dev/null; then
        echo "$(date): MySQL not found. Installing..."
        sudo apt update && sudo apt install -y mysql-server
    fi

    # Démarrer Apache si nécessaire
    if ! pgrep -x "apache2" > /dev/null; then
        echo "$(date): Starting Apache..."
        sudo service apache2 start
    fi

    # Démarrer MySQL si nécessaire
    if ! pgrep -x "mysqld" > /dev/null; then
        echo "$(date): Starting MySQL..."
        sudo service mysql start
    fi

    # Ping pour garder vivant
    curl -s http://localhost > /dev/null

    sleep 60
done
