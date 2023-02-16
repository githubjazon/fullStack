DROP DATABASE IF EXISTS Jarditou;

CREATE DATABASE Jarditou;

USE Jarditou;

CREATE TABLE client(
cli_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
cli_type BIT(1),
cli_nom VARCHAR(50),
cli_prenom VARCHAR(50),
cli_adresse VARCHAR(100),
cli_cp CHAR(5),
cli_ville VARCHAR(50),
cli_tel VARCHAR(10),
cli_mail VARCHAR(50)
);




CREATE TABLE commande(
com_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
com_date_commande DATE,
com_date_livraison DATE,
com_etat VARCHAR(25),
com_edition_facture BIT(1),
com_client_id INT,
CONSTRAINT FK_commande_client FOREIGN KEY (com_client_id) REFERENCES client(cli_id)
);



CREATE TABLE fournisseurs(
fou_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
fou_nom VARCHAR(50),
fou_adresse VARCHAR(100),
fou_cp CHAR(5),
fou_ville VARCHAR(50),
fou_tel VARCHAR(10),
fou_mail VARCHAR(50),
fou_type BIT(1)
);



CREATE TABLE rubrique(
rub_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
rub_libelle VARCHAR(50)
);



CREATE TABLE produit(
pro_code INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
pro_libelle VARCHAR(100),
pro_description VARCHAR(250),
pro_photo VARCHAR(250),
pro_affichage BIT(1),
pro_prix_achat INT,
pro_stock_phys INT,
pro_stock_alerte INT,
pro_fou_id INT,
pro_rub_id INT,
CONSTRAINT fk_produit_fou FOREIGN KEY (pro_fou_id) REFERENCES fournisseurs(fou_id),
CONSTRAINT fk_produit_rub FOREIGN KEY (pro_rub_id) REFERENCES rubrique(rub_id)
);




CREATE TABLE panier(
pan_quantite INT,
pan_prix_vente_par FLOAT,
pan_prix_vente_pro FLOAT,
pan_produit_code INT,
pan_com_id INT,
CONSTRAINT pk_panier PRIMARY KEY (pan_produit_code, pan_com_id),
CONSTRAINT fk_panier_produit FOREIGN KEY (pan_produit_code) REFERENCES produit(pro_code),
CONSTRAINT fk_panier_com FOREIGN KEY (pan_com_id) REFERENCES commande(com_id)
);



CREATE INDEX idx_com_client ON commande(com_client_id);
CREATE INDEX idx_com_date ON commande(com_date_commande);

INSERT INTO client(cli_type, cli_nom, cli_prenom, cli_adresse, cli_cp, cli_ville, cli_tel, cli_mail)
VALUES
(0, 'Dupont', 'Jean', '1 rue des Lilas', '75001', 'Paris', '0123456789', 'jean.dupont@mail.com'),
(0, 'Durand', 'Marie', '2 rue des Roses', '13001', 'Marseille', '0234567890', 'marie.durand@mail.com'),
(1, 'Martin', 'Pierre', '3 avenue des Peupliers', '69001', 'Lyon', '0345678901', 'pierre.martin@mail.com'),
(0, 'Dubois', 'Sophie', '4 rue du Chêne', '31000', 'Toulouse', '0456789012', 'sophie.dubois@mail.com'),
(1, 'Lefebvre', 'Paul', '5 rue des Acacias', '44000', 'Nantes', '0567890123', 'paul.lefebvre@mail.com'),
(0, 'Moreau', 'Julie', '6 boulevard des Alouettes', '59000', 'Lille', '0678901234', 'julie.moreau@mail.com'),
(0, 'Garcia', 'David', '7 rue du Soleil', '67000', 'Strasbourg', '0789012345', 'david.garcia@mail.com'),
(1, 'Petit', 'Isabelle', '8 avenue du Muguet', '75002', 'Paris', '0890123456', 'isabelle.petit@mail.com'),
(0, 'Roux', 'Thierry', '9 rue du Moulin', '13006', 'Marseille', '0912345678', 'thierry.roux@mail.com'),
(1, 'Bonnet', 'Claire', '10 rue des Oliviers', '69002', 'Lyon', '0012345678', 'claire.bonnet@mail.com');


INSERT INTO `fournisseurs` (`fou_nom`,`fou_adresse`,`fou_cp`,`fou_ville`,`fou_tel`,`fou_mail`,`fou_type`)
VALUES
  ("Cum Associates","4866 Vel Av.","3623","Zutendaal","04 90 23 34 37","a@yahoo.ca","0"),
  ("Mi Lacinia Institute","388-3315 Enim Ave","08458-38365","Calama","05 17 38 41 85","torquent@google.edu","1"),
  ("Amet Massa Quisque Limited","P.O. Box 674, 7801 Aliquam Rd.","72416","Chiclayo","01 93 75 32 13","in.lobortis.tellus@aol.net","0"),
  ("Ut Aliquam Corp.","8464 Turpis Ave","65241-124","Bathurst","07 47 25 34 05","sed.sem@aol.com","0"),
  ("Ipsum Suspendisse Sagittis LLC","4296 Id Road","3646","Chulucanas","01 64 57 97 23","auctor.mauris@hotmail.edu","1");

INSERT INTO rubrique(rub_libelle)
VALUES
("Plantes d'intérieur"),
("Plantes d'extérieur"),
('Arbres et arbustes'),
('Fleurs coupées');

INSERT INTO produit(pro_libelle, pro_description, pro_photo, pro_affichage, pro_prix_achat, pro_stock_phys, pro_stock_alerte, pro_fou_id, pro_rub_id)
VALUES
('Orchidée blanche', 'Orchidée blanche à fleurs simples', 'orchidee-blanche.jpg', 1, 10, 20, 5, 1, 4),
('Roses rouges', 'Bouquet de 12 roses rouges', 'roses-rouges.jpg', 1, 20, 40, 10, 2, 4),
('Laurier sauce', 'Plante aromatique pour la cuisine', 'laurier-sauce.jpg', 1, 4, 30, 10, 3, 3),
('Bouquet de lys', 'Bouquet de 10 lys blancs', 'bouquet-lys.jpg', 1, 30, 40, 10, 4, 2),
('Hortensia bleu', "Plante d'ornement pour les jardins", 'hortensia-bleu.jpg', 1, 14, 24, 4, 4, 1),
('Tulipes multicolores', "Bouquet de 20 tulipes de différentes couleurs", "tulipes-multicolores.jpg", 1, 24, 30, 10, 1, 4),
('Bambou en pot', "Plante d'intérieur facile à entretenir", 'bambou-en-pot.jpg', 1, 7, 40, 10, 2, 4),
('Couronne de fleurs', 'Couronne de fleurs pour mariage ou funérailles', 'couronne-fleurs.jpg', 1, 40, 10, 4, 3, 3),
('Plante grasse', 'Plante grasse en pot', 'plante-grasse.jpg', 1, 8, 14, 4, 4, 2),
('Lys jaunes', 'Bouquet de 10 lys jaunes', 'lys-jaunes.jpg', 1, 24, 30, 10, 4, 1),
('Rosier', 'Plante grimpante à fleurs roses', 'rosier.jpg', 1, 12, 24, 4, 1, 4),
('Chrysanthèmes', 'Bouquet de 20 chrysanthèmes de différentes couleurs', 'chrysanthemes.jpg', 1, 20, 40, 10, 2, 4),
('Fougère', "Plante verte d'intérieur", 'fougere.jpg', 1, 6, 20, 4, 3, 3),
('Bouquet de pivoines', 'Bouquet de 10 pivoines roses', 'bouquet-pivoines.jpg', 1, 40, 30, 10, 4, 2),
('Arbre à papillons', 'Petit arbre à fleurs violettes', 'arbre-a-papillons.jpg', 1, 40, 14, 4, 4, 1),
('Géraniums', 'Lot de 5 géraniums en pot', 'geraniums.jpg', 1, 14, 30, 10, 1, 4),
('Tulipes rouges', 'Bouquet de 10 tulipes rouges', 'tulipes-rouges.jpg', 1, 14, 40, 8, 2, 4),
('Lys blancs', 'Bouquet de 6 lys blancs', 'lys-blancs.jpg', 1, 24, 20, 4, 3, 3),
('Muguet', 'Brin de muguet pour le 1er mai', 'muguet.jpg', 1, 2, 100, 40, 4, 2),
('Chrysanthèmes', 'Bouquet de 10 chrysanthèmes', 'chrysanthemes.jpg', 1, 12, 30, 10, 4, 1);

INSERT INTO commande(com_date_commande, com_date_livraison, com_etat, com_edition_facture, com_client_id)
VALUES
('2023-02-10', '2023-02-15', 'En cours de livraison', 0, 1),
('2023-02-08', '2023-02-10', 'Livrée', 1, 2),
('2023-02-05', '2023-02-08', 'En attente de livraison', 0, 3),
('2023-02-11', '2023-02-13', 'En cours de livraison', 0, 4),
('2023-02-09', '2023-02-11', 'Livrée', 1, 5),
('2023-02-06', '2023-02-09', 'En attente de livraison', 0, 6),
('2023-02-12', '2023-02-16', 'En cours de livraison', 0, 7),
('2023-02-07', '2023-02-10', 'Livrée', 1, 8),
('2023-02-04', '2023-02-07', 'En attente de livraison', 0, 9),
('2023-02-13', '2023-02-17', 'En cours de livraison', 0, 10);

INSERT INTO panier(pan_quantite, pan_prix_vente_par, pan_prix_vente_pro, pan_produit_code, pan_com_id)
VALUES
(1, 15, 10, 1, 1),
(1, 30, 25, 2, 2),
(2, 8, 5, 3, 3),
(3, 12, 8, 4, 4),
(2, 20, 15, 5, 5),
(1, 7, 4, 6, 6),
(4, 18, 12, 7, 7),
(2, 13, 9, 8, 8),
(3, 25, 20, 9, 9),
(1, 10, 7, 10, 10);



