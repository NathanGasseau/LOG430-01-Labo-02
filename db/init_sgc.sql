-- ========================
-- Création des tables
-- ========================

-- Table MaisonMere
CREATE TABLE maison_mere (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    adresse TEXT NOT NULL
);

-- Table Magasin
CREATE TABLE magasin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    adresse TEXT NOT NULL,
    maison_mere_id INTEGER NOT NULL,
    FOREIGN KEY (maison_mere_id) REFERENCES maison_mere(id)
);

-- Table Gestionnaire
CREATE TABLE gestionnaire (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    magasin_id INTEGER NOT NULL,
    FOREIGN KEY (magasin_id) REFERENCES magasin(id)
);

-- Table ResponsableLogistique
CREATE TABLE responsable_logistique (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    maison_mere_id INTEGER NOT NULL,
    FOREIGN KEY (maison_mere_id) REFERENCES maison_mere(id)
);

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
    FOREIGN KEY (categorie_id) REFERENCES categorie(id)
);

-- Table StockProduit
CREATE TABLE stock_produit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produit_id INTEGER NOT NULL,
    magasin_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (produit_id) REFERENCES produit(id),
    FOREIGN KEY (magasin_id) REFERENCES magasin(id)
);

-- Table Vente
CREATE TABLE vente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    total REAL NOT NULL,
    magasin_id INTEGER NOT NULL,
    FOREIGN KEY (magasin_id) REFERENCES magasin(id)
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

-- Table ProduitRetourne
CREATE TABLE produit_retourne (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    retour_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (retour_id) REFERENCES retour(id),
    FOREIGN KEY (produit_id) REFERENCES produit(id)
);

-- Table DemandeApprovisionnement
CREATE TABLE demande_approvisionnement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    statut TEXT NOT NULL,
    magasin_id INTEGER NOT NULL,
    responsable_id INTEGER,
    FOREIGN KEY (magasin_id) REFERENCES magasin(id),
    FOREIGN KEY (responsable_id) REFERENCES responsable_logistique(id)
);

-- Table LigneApprovisionnement
CREATE TABLE ligne_approvisionnement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    demande_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    FOREIGN KEY (demande_id) REFERENCES demande_approvisionnement(id),
    FOREIGN KEY (produit_id) REFERENCES produit(id)
);
