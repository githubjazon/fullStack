<?php

class Personnage {
    private $nom;
    private $prenom;
    private $age;
    private $sexe;

    public function getNom() {
        return $this->nom;
    }

    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function getPrenom() {
        return $this->prenom;
    }

    public function setPrenom($prenom) {
        $this->prenom = $prenom;
    }

    public function getAge() {
        return $this->age;
    }

    public function setAge($age) {
        $this->age = $age;
    }

    public function getSexe() {
        return $this->sexe;
    }

    public function setSexe($sexe) {
        $this->sexe = $sexe;
    }

    public function __toString() {
        return "Nom : " . $this->nom . ", Prenom : " . $this->prenom;
    }
}


class Employe {
    private $nom;
    private $prenom;
    private $dateEmbauche;
    private $fonction;
    private $salaire;
    private $service;
    private $magasin;

    public function __construct($nom, $prenom, $dateEmbauche, $fonction, $salaire, $service) {
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->dateEmbauche = $dateEmbauche;
        $this->fonction = $fonction;
        $this->salaire = $salaire;
        $this->service = $service;
        $this->magasin = null;
    }

    public function getNom() {
        return $this->nom;
    }

    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function getPrenom() {
        return $this->prenom;
    }

    public function setPrenom($prenom) {
        $this->prenom = $prenom;
    }

    public function getDateEmbauche() {
        return $this->dateEmbauche;
    }

    public function setDateEmbauche($dateEmbauche) {
        $this->dateEmbauche = $dateEmbauche;
    }

    public function getFonction() {
        return $this->fonction;
    }

    public function setFonction($fonction) {
        $this->fonction = $fonction;
    }

    public function getSalaire() {
        return $this->salaire;
    }

    public function setSalaire($salaire) {
        $this->salaire = $salaire;
    }

    public function getService() {
        return $this->service;
    }

    public function setService($service) {
        $this->service = $service;
    }

    public function anciennete() {
        $dateActuelle = new DateTime();
        $dateEmbauche = new DateTime($this->dateEmbauche);
        $difference = $dateEmbauche->diff($dateActuelle);
        return $difference->y;
    }

    public function calculerPrime() {
        $prime = $this->salaire * 0.05; // 5% du salaire annuel
        $prime += $this->salaire * $this->anciennete() * 0.02; // 2% du salaire annuel par année d'ancienneté
    
        $dateVersement = new DateTime('30-11'); // Date du versement
        $dateActuelle = new DateTime();
        if ($dateActuelle >= $dateVersement) { // Si la date actuelle est après la date du versement
            echo "L'ordre de transfert d'une prime de $prime euros a été envoyé à la banque.\n";
        } else {
            echo "La prime sera versée le 30/11.\n";
        }
    
        return $prime;
    }
    
}



class Magasin {
    private $nom;
    private $adresse;
    private $codePostal;
    private $ville;
    private $employes;

    public function __construct($nom, $adresse, $codePostal, $ville) {
        $this->nom = $nom;
        $this->adresse = $adresse;
        $this->codePostal = $codePostal;
        $this->ville = $ville;
        $this->employes = array();
    }

    public function getNom() {
        return $this->nom;
    }

    public function setNom($nom) {
        $this->nom = $nom;
    }

    public function getAdresse() {
        return $this->adresse;
    }

    public function setAdresse($adresse) {
        $this->adresse = $adresse;
    }

    public function getCodePostal() {
        return $this->codePostal;
    }

    public function setCodePostal($codePostal) {
        $this->codePostal = $codePostal;
    }

    public function getVille() {
        return $this->ville;
    }

    public function setVille($ville) {
        $this->ville = $ville;
    }

    public function addEmploye($employe) {
        $this->employes[] = $employe;
    }

    public function getEmployes() {
        return $this->employes;
    }






    
}


