#!/bin/bash

# Vérifie qu'un message de commit est passé en argument
if [ -z "$1" ]; then
  echo "Usage : ./push.sh \"Message de commit\""
  exit 1
fi

# Ajoute tous les fichiers modifiés
git add .

# Commit avec le message fourni
git commit -m "$1"

# Pousse sur la branche actuelle
git push
