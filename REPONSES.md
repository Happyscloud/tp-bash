# TP 2 - Réponses aux questions de réflexion

## Exercice 2.1
Avec `chmod 644`, le propriétaire peut lire et modifier le fichier, mais il ne peut pas l'exécuter. Les autres peuvent seulement le lire. Donc non, ce n'est pas exécutable par le propriétaire. Pour qu'il puisse le lancer, il faudrait utiliser `chmod 744` (ou `700`).

## Exercice 2.2
On met des guillemets pour éviter que Bash plante si la variable est vide. Si on écrit `[ $UTILISATION -ge 80 ]` et que la variable est vide, ça fait une erreur de syntaxe. Avec les guillemets, `[ "$UTILISATION" -ge 80 ]`, Bash comprend qu'il y a une valeur vide et il gère ça sans planter.

## Exercice 2.3
Si on enlève `set -Eeuo pipefail` et que `tar` échoue, le script va continuer à tourner alors qu'il y a eu une erreur. Il risque de supprimer les anciennes sauvegardes alors que la nouvelle n'a même pas été créée. Avec cette ligne, le script s'arrête direct dès qu'il y a un problème, c'est plus sûr.

## Exercice 2.4
Cron s'exécute tout seul dans son coin, il ne sait pas dans quel dossier on est quand on tape la commande. Donc si on met un chemin relatif (comme `./backup.sh`), il ne va pas le trouver. Il faut lui donner le chemin complet depuis la racine pour qu'il sache exactement où aller.

## Exercice 2.5
Pour en faire un vrai pipeline, il faudrait ajouter la compilation du code, de vrais tests unitaires, l'analyse du code, la création d'images Docker et le déploiement. Les points où ça peut planter sont : si le clone échoue, si les tests échouent, si la compilation rate ou si le déploiement plante. À chaque fois, il faut utiliser `exit 1` pour que le pipeline s'arrête net.
