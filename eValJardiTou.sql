DROP DATABASE IF EXISTS `Jarditou`;

CREATE DATABASE `Jarditou`;

USE `Jarditou`;

CREATE TABLE commande(
    ComID             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DateCommande      DATE,
    DateLivraison     DATE,
    EtatCommande      VARCHAR(25),
    EditionFacture    BIT(1),
    Client            INT
);

CREATE TABLE panier(
    compQuantiteProduit    INT,
    compPrixVentePar       FLOAT,
    compPrixVentePro       FLOAT,
    produit                CHAR(6),
    commande               INT
  
);

ALTER TABLE panier ADD PRIMARY KEY (produit, commande);

CREATE TABLE client(
    CliID           INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Type            BIT(1),
    Nom             VARCHAR(50),
    Prenom          VARCHAR(50),
    Adresse         VARCHAR(100),
    CP              CHAR(5),
    Ville           VARCHAR(50),
    Tel             VARCHAR(10),
    Mail            VARCHAR(50)

  
);