#!/bin/bash

# Variables
REPO_DIR="/workspaces/$(basename "$PWD")"
VHOST_FILE="/etc/apache2/sites-available/000-default.conf"

echo "🧰 Mise à jour des paquets..."
sudo apt update && sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql curl

echo "🔧 Configuration d'Apache pour servir le répertoire du repo : $REPO_DIR"

# Modifier le virtualhost Apache
sudo sed -i "s|DocumentRoot .*|DocumentRoot $REPO_DIR|" "$VHOST_FILE"

# Donner accès à Apache au dossier du repo
sudo chown -R www-data:www-data "$REPO_DIR"
sudo chmod -R 755 "$REPO_DIR"

# Définir les permissions de /workspaces pour permettre l'accès
sudo sed -i "/<Directory \/usr\/share>/a <Directory $REPO_DIR>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride None\n\tRequire all granted\n</Directory>" /etc/apache2/apache2.conf

# Redémarrer Apache
echo "🚀 Redémarrage d'Apache..."
sudo service apache2 restart

# Configurer MySQL (si non fait)
echo "🔐 Configuration du mot de passe root MySQL..."
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

# Test de connexion MySQL
echo "<?php
\$link = mysqli_connect('localhost', 'root', 'root');
if (!\$link) {
    die('Erreur de connexion (' . mysqli_connect_errno() . ') ' . mysqli_connect_error());
}
echo 'Connexion MySQL réussie via PHP';
mysqli_close(\$link);
?>" > "$REPO_DIR/index.php"

# Afficher l'URL d'accès
echo "✅ Configuration terminée."
echo "➡️ Accède à ton site ici : https://$(hostname)-80.app.github.dev/"
