insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'85967412', 'Lorenzo', 'Pérez', 'Rodríguez', 'Calle Lepanto', '627789905');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'32569875','Daniel','Martín','Sánchez','Calle Navas',	'652314562');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'25967412', 'Sofia', 'Pérez', 'Vargas', 'Calle Mallorca', '685689905');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'78569879','Joan',	'Mañas','Ibarra','Calle Vaencia','66784562');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'96369879','Alex',	'López','Solas','Calle Bilbao','60084562');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'26541336', 'Alicia', 'Pérez', 'Rodríguez', 'Calle Pardo', '62779985');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'54123789','Clara','Martín','Sánchez','Calle Navas',	'652314563');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'45612371', 'Elena', 'Pérez', 'Vargas', 'Calle Mallorca', '685689954');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'52136923','Carla',	'Mañas','Ibarra','Calle Vaencia','667845622');
insert into PERSONA (DNI, NOM, COGNOM1, COGNOM2, ADREÇA, TELEFON) values (
'42598765','Mireia','López','Solas','Calle Bilbao','600845620');


insert into ALUMNE (DNI_ALUM, DATA_NAIX, DNI_DELEGAT) values (
'85967412', '1990-03-11','85967412');
insert into ALUMNE (DNI_ALUM, DATA_NAIX,DNI_DELEGAT) values (
'32569875', '1992-08-12','85967412');
insert into ALUMNE (DNI_ALUM, DATA_NAIX, DNI_DELEGAT) values (
'25967412', '1989-10-07','85967412');
insert into ALUMNE (DNI_ALUM, DATA_NAIX, DNI_DELEGAT) values (
'78569879', '1988-08-02','85967412');
insert into ALUMNE (DNI_ALUM, DATA_NAIX, DNI_DELEGAT) values (
'96369879', '1989-02-20','85967412');



insert into PROFESSOR (DNI_PROF, ESPECIALITAT) values (
'26541336', 'ciencias');
insert into PROFESSOR (DNI_PROF, ESPECIALITAT) values (
'54123789', 'idiomas');
insert into PROFESSOR (DNI_PROF, ESPECIALITAT) values (
'45612371', 'matematicas');
insert into PROFESSOR (DNI_PROF, ESPECIALITAT) values (
'52136923', 'tecnologia');
insert into PROFESSOR (DNI_PROF, ESPECIALITAT) values (
'42598765', 'literatura');



insert into ASSIGNATURA (CODI, NOM) values (
'2354', 'Matemáticas');
insert into ASSIGNATURA (CODI, NOM) values (
'1254', 'Literatura');
insert into ASSIGNATURA (CODI, NOM) values (
'0654', 'Ciencias');
insert into ASSIGNATURA (CODI, NOM) values (
'7554', 'Economía');
insert into ASSIGNATURA (CODI, NOM) values (
'1954', 'Inglés');



insert into MATRICULA (DNI_ALUMNE, CODI_ASSIG) values (
'85967412', '2354');
insert into MATRICULA (DNI_ALUMNE, CODI_ASSIG) values (
'32569875', '1254');
insert into MATRICULA (DNI_ALUMNE, CODI_ASSIG) values (
'25967412', '0654');
insert into MATRICULA (DNI_ALUMNE, CODI_ASSIG) values (
'78569879', '7554');
insert into MATRICULA (DNI_ALUMNE, CODI_ASSIG) values (
'96369879', '1954');



insert into AULA (NUMERO, M2) values (
'1', '40');
insert into AULA (NUMERO, M2) values (
'2', '41');
insert into AULA (NUMERO, M2) values (
'3', '42');
insert into AULA (NUMERO, M2) values (
'4', '43');
insert into AULA (NUMERO, M2) values (
'5', '44');



insert into MODUL (CODI, NOM, NUM_AULA) values (
'2013', 'Entornos', '1');
insert into MODUL (CODI, NOM, NUM_AULA) values (
'2014', 'Datos', '2');
insert into MODUL (CODI, NOM, NUM_AULA) values (
'2015', 'Programacion', '3');
insert into MODUL (CODI, NOM, NUM_AULA) values (
'2016', 'Lenguaje', '4');
insert into MODUL (CODI, NOM, NUM_AULA) values (
'2017', 'Derivadas', '5');



insert into ENSENYA (DNI_PROFE, CODI_ASSIG) values (
'26541336', '2354');
insert into ENSENYA (DNI_PROFE, CODI_ASSIG) values (
'54123789', '1254');
insert into ENSENYA (DNI_PROFE, CODI_ASSIG) values (
'45612371', '0654');
insert into ENSENYA (DNI_PROFE, CODI_ASSIG) values (
'52136923', '7554');
insert into ENSENYA (DNI_PROFE, CODI_ASSIG) values (
'42598765', '1954');



insert into PERTANY (CODI_MODUL, CODI_ASSIG) values (
'2013', '2354');
insert into PERTANY (CODI_MODUL, CODI_ASSIG) values (
'2014', '1254');
insert into PERTANY (CODI_MODUL, CODI_ASSIG) values (
'2015', '0654');
insert into PERTANY (CODI_MODUL, CODI_ASSIG) values (
'2016', '7554');
insert into PERTANY (CODI_MODUL, CODI_ASSIG) values (
'2017', '1954');


