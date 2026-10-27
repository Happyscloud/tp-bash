#!/bin/bash

# Seuil par defaut = 80%
SEUIL=${1:-80}

# Recuperer le pourcentage utilise (compatible Windows/Git Bash et Linux)
# On cible la ligne qui contient le disque C: (ou la racine / sous Linux)
UTILISATION=$(df -h . | tail -n 1 | awk '{print $5}' | tr -d '%')

if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE : Espace disque utilise a ${UTILISATION}% (seuil : ${SEUIL}%)"
    exit 1
else
    echo "OK : Espace disque utilise a ${UTILISATION}% (seuil : ${SEUIL}%)"
    exit 0
fi
