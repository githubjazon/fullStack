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

CREATE TABLE produit(
    ProCode          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Libelle          VARCHAR(100),
    Description      VARCHAR(250),
    Photo            VARCHAR(250),
    Affichage        BIT(1),
    PrixAchat        INT,
    StockPhysique    INT,
    StockAlerte      INT,
    fournisseur      INT,
    rubrique         INT
);

CREATE TABLE fournisseur(
    FouID                INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nom                  VARCHAR(50),
    Adresse              VARCHAR(100),
    CP                   CHAR(5),
    Ville                VARCHAR(50),
    Tel                  VARCHAR(10),
    Mail                 VARCHAR(50),
    Type                 BIT(1)
);

CREATE TABLE rubrique(
    RubID             INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Libelle           VARCHAR(50)
);


--_________________________________SUITE______________________________


INSERT INTO `client` (`Nom`,`Prenom`,`Adresse`,`CP`,`Ville`,`Tel`,`Mail`)
VALUES
  ("Regan","Bolton","Ap #931-2536 Scelerisque St.","03316","Brest","04 49 71 85 77","amet.ultricies.sem@hotmail.com"),
  ("Maxwell","Bartlett","461-3993 Ac Street","04938","Gap","04 89 38 24 11","et@yahoo.com"),
  ("Karina","Rios","208-5623 Ac Rd.","13141","Lisieux","03 53 42 11 84","convallis.in@yahoo.fr"),
  ("Mariko","Foster","7554 Blandit Avenue","81172","Nîmes","05 87 94 39 77","ornare@gmail.fr"),
  ("Colt","Valdez","Ap #255-6817 Ultricies Rd.","48181","Rueil-Malmaison","03 83 56 57 96","dictum.magna@yahoo.fr"),
  ("Cyrus","Mcdaniel","760-9213 Mauris Street","63925","Lisieux","07 30 08 76 12","nulla.interdum.curabitur@hotmail.fr"),
  ("Abdul","Holt","557-439 Diam. Rd.","82265","Chartres","02 76 84 97 61","nec@hotmail.com"),
  ("Bell","Wong","547-2125 Nostra, Avenue","16467","Bastia","07 66 45 52 64","semper.auctor@gmail.com"),
  ("Josiah","Moon","Ap #203-7751 Arcu. Rd.","69855","Metz","09 41 66 72 00","tempus.mauris@hotmail.fr"),
  ("Lana","Baird","Ap #648-7745 Consectetuer Av.","80000","Amiens","01 04 85 63 58","ut.cursus@gmail.com");



--__________________________SUITE________________________

INSERT INTO `myTable` (`Nom`,`Adresse`,`CP`,`Ville`,`Tel`,`Mail`,`Type`)
VALUES
  ("Morbi Ltd","P.O. Box 284, 1421 Praesent Street","66541","Lambersart","09 22 19 85 18","vehicula@protonmail.edu","0"),
  ("Orci Ut Institute","649-7764 Et Rd.","57577","Rodez","01 22 66 47 15","ante.ipsum@yahoo.org","1"),
  ("Urna Convallis Erat LLP","989-9826 Et Street","68517","Troyes","04 26 24 14 86","gravida.sagittis@icloud.couk","0"),
  ("Magna Nam Ligula Company","3759 Donec Av.","62852","Angers","02 12 16 05 17","pellentesque@icloud.net","1"),
  ("Odio Aliquam Inc.","P.O. Box 244, 5962 Nec Ave","66466","Mérignac","06 89 30 65 32","metus.sit@hotmail.net","0");



--MAIS



  #1452 - Cannot add or update a child row: a foreign key constraint fails
   (`jarditou`.`fournisseur`, CONSTRAINT `fournisseur_ibfk_1` FOREIGN KEY (`FouID`) REFERENCES `produit` (`fournisseur`))