mod db;
mod ui;


use crate::db::{establish_connection, init_database};
use crate::ui::afficher_menu;
use std::process::exit;

fn main() {
    // Connexion à la BD et initialisation au besoin
    let conn = match establish_connection() {
        Ok(c) => c,
        Err(e) => {
            eprintln!("Erreur de connexion à la base de données: {}", e);
            exit(1);
        }
    };

    if let Err(e) = init_database(&conn) {
        eprintln!("Erreur lors de l'initialisation de la base : {}", e);
        exit(1);
    }

    loop {
        match afficher_menu() {
            1 => println!("→ Recherche de produit (à implémenter)"),
            2 => println!("→ Enregistrement d'une vente (à implémenter)"),
            3 => println!("→ Annuler une vente (à implémenter)"),
            4 => println!("→ Consultation du stock (à implémenter)"),
            0 => {
                println!("→ Fermeture de l'application.");
                break;
            }
            _ => println!("Option invalide. Réessaye."),
        }
    }
}
