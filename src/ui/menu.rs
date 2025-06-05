use std::io::{self, Write};

pub fn afficher_menu() -> u32 {
    println!("\n=== MENU PRINCIPAL ===");
    println!("1. Rechercher un produit");
    println!("2. Enregistrer une vente");
    println!("3. Annuler une vente");
    println!("4. Consulter le stock");
    println!("0. Quitter");

    print!("Votre choix : ");
    io::stdout().flush().unwrap();

    let mut choix = String::new();
    io::stdin().read_line(&mut choix).unwrap();
    choix.trim().parse().unwrap_or(999)
}
