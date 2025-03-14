 -- Crea un base de dades anomenada institut 
CREATE DATABASE institut ;
-- Crea un usuari anomenat institut  amb la contrasenya 'institut ' i perfil de superusuari
CREATE USER institut  WITH SUPERUSER CREATEROLE ENCRYPTED PASSWORD 'institut ';
-- Assigna l'usuari institut  com a propietari de la BBDD institut 
ALTER DATABASE institut  OWNER TO institut ;
-- Assigna tots els privilegis a l'usuari institut  sobre la BBDD institut 
GRANT ALL PRIVILEGES ON DATABASE institut  TO institut ;

 
 --Creem les taules 
 CREATE TABLE IF NOT EXISTS PERSONA (
 DNI  NUMERIC(9)  NOT NULL,
 NOM     VARCHAR(20) NOT NULL,
 COGNOM1 VARCHAR(20) NOT NULL,
 COGNOM2 VARCHAR(20) NOT NULL,
 ADREÇA     VARCHAR(45),
 TELEFON    VARCHAR (9),
 CONSTRAINT PK_PERSONA PRIMARY KEY (DNI));
 

CREATE TABLE IF NOT EXISTS PROFESSOR(
 DNI_PROF  NUMERIC(9) NOT NULL,
 ESPECIALITAT VARCHAR(20) NOT NULL,
 CONSTRAINT PK_PROFESSOR PRIMARY KEY (DNI_PROF),
 CONSTRAINT FK_PROF_PERS FOREIGN KEY (DNI_PROF) REFERENCES PERSONA(DNI)); 

 
 CREATE TABLE IF NOT EXISTS ALUMNE (
 DNI_ALUM  NUMERIC(9) NOT NULL,
 DATA_NAIX DATE NOT NULL,
 DNI_DELEGAT NUMERIC(9),
 CONSTRAINT PK_ALUMNE PRIMARY KEY (DNI_ALUM),
 CONSTRAINT FK_ALUM_PERS FOREIGN KEY (DNI_ALUM) REFERENCES PERSONA(DNI),
 CONSTRAINT FK_ALUM_DEL FOREIGN KEY (DNI_DELEGAT) REFERENCES ALUMNE(DNI_ALUM)); 
 
 
CREATE TABLE IF NOT EXISTS ASSIGNATURA(
CODI    NUMERIC(6) NOT NULL,
NOM     VARCHAR(25),
CONSTRAINT PK_ASSIGNATURA PRIMARY KEY (CODI));
 
CREATE TABLE IF NOT EXISTS AULA (
NUMERO  NUMERIC(6) NOT NULL,
M2     NUMERIC(6),
CONSTRAINT PK_AULA PRIMARY KEY (NUMERO));

CREATE TABLE IF NOT EXISTS MODUL (
CODI    NUMERIC(6)  NOT NULL,
NOM     VARCHAR(25),
NUM_AULA  NUMERIC(6),
CONSTRAINT PK_MODUL PRIMARY KEY (CODI),
CONSTRAINT FK_MOD_AUL FOREIGN KEY (NUM_AULA) REFERENCES AULA(NUMERO)); 

CREATE TABLE IF NOT EXISTS PERTANY (
CODI_MODUL    NUMERIC(6) NOT NULL,
CODI_ASSIG    NUMERIC(6) NOT NULL,
CONSTRAINT PK_PERTANY PRIMARY KEY (CODI_MODUL,CODI_ASSIG),
CONSTRAINT FK_PERT_MOD FOREIGN KEY (CODI_MODUL) REFERENCES MODUL(CODI),
CONSTRAINT FK_PERT_ASS FOREIGN KEY (CODI_ASSIG) REFERENCES ASSIGNATURA(CODI)); 


CREATE TABLE IF NOT EXISTS ENSENYA (
DNI_PROFE     NUMERIC(9) NOT NULL,
CODI_ASSIG    NUMERIC(6) NOT NULL,
CONSTRAINT PK_ENSENYA PRIMARY KEY (DNI_PROFE,CODI_ASSIG),
CONSTRAINT FK_ENS_PROF FOREIGN KEY (DNI_PROFE) REFERENCES PROFESSOR(DNI_PROF),
CONSTRAINT FK_ENS_ASS FOREIGN KEY (CODI_ASSIG) REFERENCES ASSIGNATURA(CODI));

CREATE TABLE IF NOT EXISTS MATRICULA (
DNI_ALUMNE    NUMERIC(9) NOT NULL,
CODI_ASSIG    NUMERIC(6) NOT NULL,
CONSTRAINT PK_MATRICULA PRIMARY KEY (DNI_ALUMNE,CODI_ASSIG),
CONSTRAINT FK_MAT_ALU FOREIGN KEY (DNI_ALUMNE) REFERENCES ALUMNE(DNI_ALUM),
CONSTRAINT FK_MAT_ASS FOREIGN KEY (CODI_ASSIG) REFERENCES ASSIGNATURA(CODI));


