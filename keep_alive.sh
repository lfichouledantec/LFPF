#!/bin/bash
sudo ./update_install.sh
sudo ./setup_lfpf.sh
sudo ./restore_phpmyadmin_apache.sh
while true
do
    # Vérifier et démarrer Apache si nécessaire
    if ! pgrep -x "apache2" > /dev/null; then
        echo "$(date): Apache non démarré, démarrage..."
        sudo service apache2 start
    fi

    # Vérifier et démarrer MySQL si nécessaire
    if ! pgrep -x "mysqld" > /dev/null; then
        echo "$(date): MySQL non démarré, démarrage..."
        sudo service mysql start
    fi

    # Ping local pour garder actif
    curl -s http://localhost > /dev/null

    # Attendre 60 secondes avant prochaine vérification
    sleep 60
done
