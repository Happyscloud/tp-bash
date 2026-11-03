#!/bin/bash
set -Eeuo pipefail

LOG_FILE="ci.log"

# Fonction de log horodatée
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Vérifier qu'on a bien une URL en argument
if [ -z "${1:-}" ]; then
    log "Erreur : Aucune URL fournie. Usage : ./ci.sh <url-du-depot>"
    exit 1
fi

URL="$1"
REPO_NAME=$(basename "$URL" .git)

log "Début du pipeline CI pour : $URL"

# Étape 1 : Clone ou Pull
if [ -d "$REPO_NAME" ]; then
    log "Le dossier existe déjà. Mise à jour (git pull)..."
    cd "$REPO_NAME"
    git pull
else
    log "Clonage du dépôt..."
    git clone "$URL"
    cd "$REPO_NAME"
fi

# Étape 2 : Simulation de tests
log "Exécution des tests..."
if [ -f "test.sh" ]; then
    bash test.sh
else
    log "Aucun fichier test.sh trouvé. Tests simulés avec succès."
fi

log "Pipeline terminé avec succès !"
exit 0
