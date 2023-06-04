CREATE DATABASE IF NOT EXISTS compta2 COLLATE utf8mb4_general_ci;
USE compta2;

CREATE TABLE IF NOT EXISTS ARTICLES (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ref VARCHAR(50),
    designation VARCHAR(100),
    prix DECIMAL(6 , 2 ),
    id_fou INT
);

CREATE TABLE IF NOT EXISTS FOURNISSEUR (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS BON (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    date_cmde TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    delai INT,
    id_fou INT
);
CREATE TABLE IF NOT EXISTS COMPO (
    id_article INT PRIMARY KEY AUTO_INCREMENT,
    qte INT,
    CONSTRAINT fk_numArticle FOREIGN KEY (id_article)
        REFERENCES ARTICLES (id)
);

alter table ARTICLES
	add constraint fk_articles_num_fournisseur foreign key (id_fou) REFERENCES FOURNISSEUR(id);
    
ALTER TABLE BON
	add constraint fk_bon_num_fournisseur foreign key(id_fou) REFERENCES FOURNISSEUR(id);
ALTER TABLE COMPO
	add id_bon int;
    
ALTER TABLE COMPO
	add constraint fk_compo_num_bon FOREIGN KEY(id_bon) references BON(id);
    
INSERT into FOURNISSEUR(nom) values("Française d'imports");
INSERT into FOURNISSEUR(nom) values
	("FDM SA"),
    ("Dubois & Fils");
    
INSERT INTO ARTICLES(ref, designation,prix,id_fou) values
	("A01","Perceuse P1",74.99,1);
INSERT INTO ARTICLES(ref, designation,prix,id_fou) values
	("F01","Boulon laiton 4 x 40 mm (sachet de 10)",2.25,2),
	("F02","Boulon laiton 5 x 40 mm (sachet de 10)",4.45,2),
	("D01","Boulon laiton 5 x 40 mm (sachet de 10)",4.40,3),
	("A02","Meuleuse 125mm)",37.85,1),
	("D03","Boulon acier zingué 4 x 40mm (sachet de 10)",1.8,3),
	("A03","Perceuse à colonne",185.25,1),
	("F03","Coffret mêches plates",6.25,2),
	("F04","Fraises d’encastrement",8.14,2);
    
INSERT INTO BON(numero,delai,id_fou) values (1,3,1);

INSERT INTO COMPO(id_article,qte,id_bon) values (1,3,1);
insert into COMPO(id_article,qte,id_bon) values
	(5,4,1),
    (7,1,1);
    
    
-- Début du TP4
SELECT * FROM ARTICLES; 
SELECT 
    ref, designation
FROM
    ARTICLES
WHERE prix>2;

SELECT * 
FROM ARTICLES
WHERE PRIX
BETWEEN 2 AND 6.25;

SELECT *
FROM ARTICLES
WHERE prix>=2
AND prix<=6.25;

SELECT * 
FROM ARTICLES
WHERE id_fou = 1
AND (prix <2 OR prix>6.25);

SELECT *
FROM ARTICLES
WHERE id_fou = 1
OR id_fou = 3;

SELECT *
FROM ARTICLES
WHERE id_fou in(1,3);

SELECT *
FROM ARTICLES
WHERE id_fou NOT in(1,3);

SELECT *
FROM BON
WHERE date_cmde
BETWEEN "2019-02-01" AND "2019-04-30";








