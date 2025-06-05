// src/ui/mod.rs

// Déclare le sous-module "menu.rs"
pub mod menu;

// (Optionnel) Réexporte la fonction pour qu'on puisse l'utiliser avec ui::afficher_menu
pub use menu::afficher_menu;
