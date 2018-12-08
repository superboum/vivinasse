# Prolog

## Vivinasse

Génération de phrases aléatoires sur le thème du vin via l'implémentation d'une grammaire française en prolog.

Projet personnel en cours de développement.

Pour l'exécuter sur votre machine :

```
sudo dnf install pl
swipl -s vivinasse.prolog -g "gen." -t halt.
```

## SC

*WIP*

Generate sctrading.pl:

```
python3 sctradingToProlog.py < sctrading.csv > sctrading.prolog
```

```
swipl sc.prolog
```
