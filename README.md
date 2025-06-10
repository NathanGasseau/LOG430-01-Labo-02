### ✍️ Auteur  
**Nom** : Nathan Gasseau  
**Cours** : LOG430-01  
**Session** : ÉTÉ 2025  

---

### 🎯 Système de Gestion de Caisse (SGC)  
Cette application Django simule un système de gestion de caisse pour un réseau de petits magasins connectés à une maison mère. Elle offre différentes interfaces selon le rôle (employé, gestionnaire, responsable logistique) et permet de :

- Rechercher des produits par nom, catégorie ou identifiant  
- Enregistrer des ventes et gérer les retours  
- Suivre l'état du stock local et central  
- Initier des demandes d’approvisionnement  
- Générer des rapports consolidés sur les ventes  
- Visualiser les performances des magasins  

L'application utilise PostgreSQL comme base de données centrale, avec un **pool de connexions** partagé entre les services internes. Django ORM assure la persistance et les transactions.

---

### 🔧 Instructions d’exécution  

#### ⚙️ Prérequis  
- python3 3.10+  
- pip + virtualenv  
- PostgreSQL (ex. : via Docker ou localement)  
- Django 4.x  
- (Optionnel) pgAdmin ou autre client PostgreSQL

#### 🧪 Étapes pour exécuter l'application  

Cloner le dépôt :  
```bash
git clone https://github.com/NathanGasseau/LOG430-01-Labo-02.git
cd LOG430-01-Labo-02
```

Créer et activer un environnement virtuel :  
```bash
python3 -m venv venv
source venv/bin/activate  # Sur Windows: venv\Scripts\activate
```

Installer les dépendances :  
```bash
pip install -r requirements.txt
```

Configurer la base de données (PostgreSQL) dans `sgc_project/settings.py` puis exécuter :  
```bash
python3 manage.py migrate
python3 manage.py loaddata initial_data.json  # Optionnel : données d’exemple
```

Lancer le serveur :  
```bash
python3 manage.py runserver
```

Accéder à l'application à l’adresse : [http://127.0.0.1:8000/](http://127.0.0.1:8000/)

---

### 📁 Structure du projet Django  

```
LOG430-01-Labo-02/
│
├── sgc_project/             # Répertoire du projet Django
│   ├── settings.py          # Configuration du projet
│   ├── urls.py              # Routes principales
│   └── ...
│
├── caisse/                  # Application Django principale
│   ├── models.py            # Modèles de données (Produit, Vente, etc.)
│   ├── views.py             # Logique des vues / API
│   ├── services/            # Logique métier (StockService, etc.)
│   ├── templates/           # Fichiers HTML (si UI)
│   └── ...
│
├── db/
│   └── init_postgres.sql    # Script de création des tables PostgreSQL
│
├── manage.py                # Entrée principale Django
├── requirements.txt         # Dépendances python3
└── README.md                # Ce fichier
```

---

### 💡 Remarques  
- Le projet suit une architecture **monolithique modulaire**.  
- Des composants comme `CaisseService` ou `MaisonMereService` orchestrent les opérations métiers.  
- L’interface employé est en ligne de commande, mais l’extension vers une UI web est envisageable.