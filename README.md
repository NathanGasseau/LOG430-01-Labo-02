### ✍️ Auteur  
**Nom** : Nathan Gasseau  
**Cours** : LOG430-01  
**Session** : ÉTÉ 2025  

---

### 🎯 Système de Caisse  
Cette application console écrite en Rust simule un système de caisse pour un petit commerce de quartier. Elle permet à un employé de :  
- Rechercher un produit par nom, catégorie ou identifiant  
- Enregistrer une vente et mettre à jour le stock  
- Annuler une vente (retour)  
- Consulter l'état du stock  

Les données sont stockées dans une base de données SQLite unique partagée entre les caisses, et les opérations critiques utilisent des transactions pour garantir la cohérence.

---

### 🔀 Choix de technologies  
**Rust** : J’ai choisi Rust pour ses performances, sa sécurité mémoire et son modèle de gestion de la concurrence.  
**SQLite** : Utilisée comme base de données légère, locale et transactionnelle.  
**rusqlite** : Bibliothèque Rust utilisée pour interagir avec la base SQLite.  

---

🔧 Instructions d’exécution  

### ⚙️ Prérequis  
- Rust (1.70+ recommandé)  
- SQLite installé (`sqlite3`)  
- VS Code (avec extension Rust) recommandé  
- DB Browser for SQLite (optionnel pour visualiser les données)  

### 🧪 Étapes pour exécuter l'application  

Cloner le dépôt :  
```bash
git clone https://github.com/NathanGasseau/LOG430-01-Labo-01.git
cd LOG430-01-Labo-01
```

Compiler l'application :  
```bash
cargo build
```

Lancer l'application :  
```bash
cargo run
```

La base de données `db/caisse.db` sera automatiquement initialisée et peuplée avec un jeu d’essai si elle est vide.

---

📁 Structure du projet  

```
LOG430-01-Labo-01/
│
├── src/                     # Code source Rust
│   ├── main.rs              # Point d’entrée de l’application
│   ├── ui/                  # Interface console
│   │   ├── mod.rs
│   │   └── menu.rs
│   └── ...                  # (services, modèles, etc.)
│
├── db/
│   ├── caisse.db            # Base SQLite locale (ignorée par Git)
│   └── init_caisse.sql      # Script de création des tables
│
├── .gitignore               # Fichiers ignorés par Git
├── Cargo.toml               # Dépendances Rust
└── README.md                # Ce fichier
```

