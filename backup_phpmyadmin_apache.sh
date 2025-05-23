#!/bin/bash

# Variables
BACKUP_DIR="/home/$USER/backup_phpmyadmin_apache_$(date +%Y%m%d_%H%M%S)"
MYSQL_USER="root"          # adapte si besoin
MYSQL_PASS="ton_mdp_root"  # adapte ici ton mot de passe root MySQL
DB_NAME="phpmyadmin"

# Création du dossier de sauvegarde
mkdir -p "$BACKUP_DIR"

echo "Sauvegarde des fichiers de configuration..."

# Sauvegarde configs phpMyAdmin
cp /etc/phpmyadmin/config.inc.php "$BACKUP_DIR/"
cp /etc/phpmyadmin/config-db.php "$BACKUP_DIR/"

# Sauvegarde configs Apache
cp /etc/apache2/apache2.conf "$BACKUP_DIR/"
cp -r /etc/apache2/sites-available "$BACKUP_DIR/"
cp -r /etc/apache2/sites-enabled "$BACKUP_DIR/"
cp -r /etc/apache2/conf-available "$BACKUP_DIR/"
cp -r /etc/apache2/conf-enabled "$BACKUP_DIR/"

echo "Sauvegarde de la base de données phpmyadmin..."

# Dump de la base phpmyadmin si elle existe
if mysql -u"$MYSQL_USER" -p"$MYSQL_PASS" -e "use $DB_NAME;" 2>/dev/null; then
    mysqldump -u"$MYSQL_USER" -p"$MYSQL_PASS" "$DB_NAME" > "$BACKUP_DIR/${DB_NAME}_backup.sql"
    echo "Base $DB_NAME sauvegardée."
else
    echo "Base $DB_NAME inexistante ou accès refusé. Pas de dump effectué."
fi

echo "Sauvegarde terminée dans $BACKUP_DIR"
