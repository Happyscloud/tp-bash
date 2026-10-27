#!/bin/bash
set -Eeuo pipefail

DOSSIER=${1:-data}
DEST="backups"

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier '$DOSSIER' n'existe pas." >&2
    exit 1
fi

mkdir -p "$DEST"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$DEST/backup_$DATE.tar.gz"

echo "Création de l'archive : $ARCHIVE"
tar -czf "$ARCHIVE" "$DOSSIER"

echo "Suppression des anciennes sauvegardes (> 7 jours)..."
find "$DEST" -name "backup_*.tar.gz" -mtime +7 -exec rm -v {} \;

echo "Sauvegarde terminée avec succès."
exit 0
