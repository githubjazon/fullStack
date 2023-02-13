DROP DATABASE IF EXISTS `afpa`;

CREATE DATABASE `afpa`;

USE `afpa`;

CREATE TABLE client(
    cli_num           INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_nom           VARCHAR(50) NOT NULL,
    cli_adresse       VARCHAR(50),
    cli_tel           VARCHAR(30)
);

CREATE TABLE commande(
    com_num           INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cli_num           INT NOT NULL,
    com_date          DATE NOT NULL,
    com_obs           VARCHAR(50)
);

CREATE TABLE detail(
    com_num          INT NOT NULL,
    pro_num          INT NOT NULL,
    det_qte          INT NOT NULL
);

ALTER TABLE detail ADD PRIMARY KEY (com_num, pro_num);

CREATE TABLE produit(
    pro_num          INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pro_libelle      VARCHAR(50),
    pro_description  VARCHAR(50)
);
