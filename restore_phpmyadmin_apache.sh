#!/bin/bash

# Dossier où sont stockées les sauvegardes (à modifier selon ton cas)
BACKUP_DIR="$HOME/backup_phpmyadmin_apache"

echo "Restauration des fichiers de configuration depuis $BACKUP_DIR..."

# Restaurer phpMyAdmin
if [ -f "$BACKUP_DIR/config-db.php" ]; then
    echo "Restauration de /etc/phpmyadmin/config-db.php"
    sudo cp "$BACKUP_DIR/config-db.php" /etc/phpmyadmin/config-db.php
else
    echo "⚠️  Fichier config-db.php manquant dans la sauvegarde"
fi

if [ -f "$BACKUP_DIR/config.inc.php" ]; then
    echo "Restauration de /etc/phpmyadmin/config.inc.php"
    sudo cp "$BACKUP_DIR/config.inc.php" /etc/phpmyadmin/config.inc.php
else
    echo "⚠️  Fichier config.inc.php manquant dans la sauvegarde"
fi

# Restaurer Apache (exemple avec apache2.conf, adapte selon tes fichiers)
if [ -f "$BACKUP_DIR/apache2.conf" ]; then
    echo "Restauration de /etc/apache2/apache2.conf"
    sudo cp "$BACKUP_DIR/apache2.conf" /etc/apache2/apache2.conf
else
    echo "⚠️  Fichier apache2.conf manquant dans la sauvegarde"
fi

# Tu peux ajouter ici d'autres fichiers Apache si besoin
# Exemple pour un virtual host:
# if [ -f "$BACKUP_DIR/000-default.conf" ]; then
#    sudo cp "$BACKUP_DIR/000-default.conf" /etc/apache2/sites-available/000-default.conf
# fi

echo "Redémarrage des services Apache et MySQL..."
sudo systemctl restart apache2
sudo systemctl restart mysql

echo "Restauration terminée."
