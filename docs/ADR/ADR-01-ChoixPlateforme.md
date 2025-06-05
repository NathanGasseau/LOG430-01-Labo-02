# ADR-01: Choix de la plateforme

## Statut
Accepté – 21 mai 2025

## Contexte
L’application à développer est un système de caisse simple pour un petit magasin de quartier. Elle doit être fiable, performante, fonctionner sur plusieurs postes en parallèle, et être facile à déployer dans un environnement local.

## Décision
Le développement de l’application se fera en **Rust**, en mode **console**, avec une exécution locale sur chaque poste de caisse.

## Justification
- **Rust** offre un excellent compromis entre **performance**, **sécurité mémoire**, et **portabilité**.
- J'ai de l'expérience avec RUST et c'est un language en émergence
## Conséquences
- Le développement demandera une bonne maîtrise de Rust et de son écosystème.
- Le système sera léger, rapide et sécurisé, mais certains outils d'interface graphique seront limités.
