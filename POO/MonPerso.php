<?php
require_once('classes/Personnage.class.php');

$p = new Personnage();
$p->setNom("Lebowski");
$p->setPrenom("Jeff");

echo "Nom : " . $p->getNom() . "<br/>";
echo "Prénom : " . $p->getPrenom() . "<br/>";
