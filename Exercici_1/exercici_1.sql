-- 1) Crear una base de dades amb el nom BOTIGA
DROP DATABASE IF EXISTS BOTIGA;
CREATE DATABASE BOTIGA;
USE BOTIGA;

-- 2) Afexeix lasTAULES FABRICANTS i ARTICLES
CREATE TABLE FABRICANTS(
	ID_FABRICANT INT PRIMARY KEY AUTO_INCREMENT,
    NOM VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE ARTICLES(
	ID_ARTICULO INT AUTO_INCREMENT,
    NOM VARCHAR(30) NOT NULL,
    PREU INT NOT NULL,
    ID_FABRICANT INT,
    PRIMARY KEY(ID_ARTICULO),
    CONSTRAINT FK_FABRICANT FOREIGN KEY(ID_FABRICANT) REFERENCES FABRICANTS(ID_FABRICANT)
)ENGINE=InnoDB;

-- 3) Afeixir registres a les taules
INSERT INTO FABRICANTS VALUES(DEFAULT, "Kingston"),
							 (DEFAULT, "HP"),
                             (DEFAULT, "Logitech"),
                             (DEFAULT, "Nvidia"),
                             (DEFAULT, "Seagate");
                             
INSERT INTO ARTICLES VALUES(DEFAULT, "Teclat", 20, 3),
						   (DEFAULT, "Disc Dur 3 TB", 200, 5),
                           (DEFAULT, "Mouse", 15, 3),
						   (DEFAULT, "Alataveu", 50, 3),
                           (DEFAULT, "Memoria RAM", 180, 1),
						   (DEFAULT, "Disc Extern 1 TB", 180, 2),
                           (DEFAULT, "Pendriva", 35, 1),
						   (DEFAULT, "Targeta de Xarxa", 40, 5),
                           (DEFAULT, "Targeta Video", 181, 4),
						   (DEFAULT, "Pantalla 21''", 230, 2);