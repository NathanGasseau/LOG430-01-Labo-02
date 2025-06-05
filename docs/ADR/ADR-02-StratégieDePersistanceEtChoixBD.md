# ADR-02: Persistance et choix de la base de données

## Statut
Accepté – 21 mai 2025

## Contexte
Le système de caisse doit permettre d’enregistrer des ventes, de gérer les retours et de maintenir l’état du stock. Ces opérations doivent être **fiables**, **consistantes** et **rapides**, avec une gestion transactionnelle.

## Décision
L’application utilisera une **base de données SQLite** stockée localement sur le serveur. Les clients (caisses) y accèderont via un ORM.

## Justification
- **SQLite** est un **RDBMS embarqué léger**, adapté aux applications locales mono-utilisateur ou multi-accès léger.
- Il supporte les **transactions ACID**, garantissant la cohérence des écritures.
- Le choix du **stockage local** simplifie la configuration (pas de serveur à maintenir) et correspond à l’environnement de test demandé.
- SQLite est **bien intégré dans l’écosystème Rust** via des bibliothèques comme `rusqlite`.

## Conséquences
- Le partage du fichier `.db` entre plusieurs processus nécessite de s'assurer qu’ils sont bien **séquencés ou transactionnels**.
