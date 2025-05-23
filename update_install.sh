#!/bin/bash

echo "$(date): Mise à jour des paquets..."
sudo apt update -y
sudo apt upgrade -y

# Installer Apache si absent
if ! command -v apache2 > /dev/null; then
    echo "$(date): Apache2 not found. Installing..."
    sudo apt install -y apache2
fi

# Installer MySQL si absent
if ! command -v mysqld > /dev/null; then
    echo "$(date): MySQL not found. Installing..."
    sudo apt install -y mysql-server
fi

# Installer PHP et modules si absent
if ! command -v php > /dev/null; then
    echo "$(date): PHP not found. Installing..."
    sudo apt install -y php libapache2-mod-php php-mysql php-cli php-curl php-json php-mbstring
fi

# Installer phpMyAdmin si absent
if [ ! -d /usr/share/phpmyadmin ]; then
    echo "$(date): phpMyAdmin not found. Installing..."
    sudo apt install -y phpmyadmin
    # Activer la conf apache pour phpmyadmin si besoin
    sudo ln -sf /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
    sudo a2enconf phpmyadmin
fi

echo "$(date): Redémarrage Apache pour prise en compte..."
sudo service apache2 restart
echo "$(date): Redémarrage MySQL..."
sudo service mysql restart

echo "$(date): Mise à jour et installation terminées."
