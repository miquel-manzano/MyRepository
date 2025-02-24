
-- Crea un base de dades anomenada proveidors
CREATE DATABASE proveidors;
-- Crea un usuari anomenat proveidors amb la contrasenya 'proveidors' i perfil de superusuari
CREATE USER proveidors WITH SUPERUSER CREATEROLE ENCRYPTED PASSWORD 'proveidors';
-- Assigna l'usuari proveidors com a propietari de la BBDD proveidors
ALTER DATABASE proveidors OWNER TO proveidors;
-- Assigna tots els privilegis a l'usuari proveidors sobre la BBDD proveidors
GRANT ALL PRIVILEGES ON DATABASE proveidors TO proveidors;


--Creem les taules amb les restriccions

CREATE TABLE FABRICANT (
    COD_FABRICANT NUMERIC (3) NOT NULL,
    NOM VARCHAR (15) NOT NULL,
    PAIS VARCHAR (15) NOT NULL,

        CONSTRAINT PK_Fabricant PRIMARY KEY (COD_FABRICANT), 
        CONSTRAINT CK_NOM CHECK (NOM = UPPER(NOM)),
        CONSTRAINT CK_PAIS CHECK (PAIS = UPPER(PAIS))  
  
);     
 
        

CREATE TABLE ARTICLE(
    COD_ARTICLE VARCHAR(20) NOT NULL,
    COD_FABRICANT NUMERIC(3) NOT NULL,
    PES NUMERIC(3) NOT NULL,
    CATEGORIA VARCHAR(10) NOT NULL,
    PREU_VENDA DECIMAL(6,2) NOT NULL,
    PREU_COST DECIMAL(6,2) NOT NULL,
    STOCK NUMERIC(5) NOT NULL,

        CONSTRAINT PK_Article PRIMARY KEY (COD_ARTICLE, COD_FABRICANT, PES, CATEGORIA),
        CONSTRAINT FK_Fabricant FOREIGN KEY (COD_FABRICANT) REFERENCES FABRICANT(COD_FABRICANT), 
        CONSTRAINT CK_PREU_VENDA CHECK (PREU_VENDA>0),
        CONSTRAINT CK_PREU_COST CHECK (PREU_COST>0),
        CONSTRAINT CK_PES CHECK (PES>0),
        CONSTRAINT CK_CATEGORIA CHECK (CATEGORIA IN('Primera', 'Segona', 'Tercera'))

);