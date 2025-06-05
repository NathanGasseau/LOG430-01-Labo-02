-- ========================
-- Création des tables
-- ========================

-- Table Catégorie
CREATE TABLE categorie (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    description TEXT
);

-- Table Produit
CREATE TABLE produit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    categorie_id INTEGER NOT NULL,
    prix REAL NOT NULL,
    quantite_en_stock INTEGER NOT NULL,
    FOREIGN KEY (categorie_id) REFERENCES categorie(id)
);

-- Table Vente
CREATE TABLE vente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    total REAL NOT NULL
);

-- Table LigneVente
CREATE TABLE ligne_vente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vente_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (vente_id) REFERENCES vente(id),
    FOREIGN KEY (produit_id) REFERENCES produit(id)
);

-- Table Retour
CREATE TABLE retour (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    vente_id INTEGER NOT NULL,
    date_retour TEXT NOT NULL,
    FOREIGN KEY (vente_id) REFERENCES vente(id)
);

-- Table ProduitRetourne (relation retour -> produits)
CREATE TABLE produit_retourne (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    retour_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (retour_id) REFERENCES retour(id),
    FOREIGN KEY (produit_id) REFERENCES produit(id)
);
