
<?php

class Employe {
    private $nom;
    private $prenom;
    private $dateEmbauche;
    private $fonction;
    private $salaire;
    private $service;
  
    public function __construct($nom, $prenom, $dateEmbauche, $fonction, $salaire, $service) {
      $this->nom = $nom;
      $this->prenom = $prenom;
      $this->dateEmbauche = $dateEmbauche;
      $this->fonction = $fonction;
      $this->salaire = $salaire;
      $this->service = $service;
    }
  
    public function getNom() {
      return $this->nom;
    }
  
    public function getPrenom() {
      return $this->prenom;
    }
  
    public function getDateEmbauche() {
      return $this->dateEmbauche;
    }
  
    public function getFonction() {
      return $this->fonction;
    }
  
    public function getSalaire() {
      return $this->salaire;
    }
  
    public function getService() {
      return $this->service;
    }
  
    public function setNom($nom) {
      $this->nom = $nom;
    }
  
    public function setPrenom($prenom) {
      $this->prenom = $prenom;
    }
  
    public function setDateEmbauche($dateEmbauche) {
      $this->dateEmbauche = $dateEmbauche;
    }
  
    public function setFonction($fonction) {
      $this->fonction = $fonction;
    }
  
    public function setSalaire($salaire) {
      $this->salaire = $salaire;
    }
  
    public function setService($service) {
      $this->service = $service;
    }
  }
  

/* 
$employe1 = new Employe("Dupont", "Pierre", "01/01/2022", "Comptable", 30, "Comptabilité");
echo $employe1->getNom(); // affiche "Dupont"
echo $employe1->getSalaire(); // affiche 30
$employe1->setSalaire(35); // change le salaire à 35
echo $employe1->getSalaire(); // affiche 35
*/

public function anciennete() {
    $dateEmbauche = new DateTime($this->dateEmbauche);
    $aujourdhui = new DateTime();
    $difference = $aujourdhui->diff($dateEmbauche);
    return $difference->y;
}


/*
$employe1 = new Employe("Dupont", "Pierre", "01/01/2010", "Comptable", 30, "Comptabilité");
echo $employe1->anciennete(); // affiche 13 (en supposant qu'on est en 2023)
*/

public function calculerPrime() {
    $aujourdhui = new DateTime();
    $dateVersement = new DateTime('30/11');

    // Vérifier si la date de versement est passée
    if ($aujourdhui > $dateVersement) {
        return "La prime a déjà été versée.";
    }

    // Calculer le montant de la prime
    $anciennete = $this->anciennete();
    $montantPrime = $this->salaire * 0.05 + ($anciennete * $this->salaire * 0.02);

    // Donner l'ordre de transfert à la banque
    $message = "Transfert de prime de " . $montantPrime . " euros pour " . $this->prenom . " " . $this->nom . ".";
    return $message;
}
