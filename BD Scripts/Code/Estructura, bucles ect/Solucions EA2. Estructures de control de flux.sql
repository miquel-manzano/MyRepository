/*1)	Escriu un programa PL/SQL que introduirem per teclat dos números. Els dos números han de ser positius, en cas contrari s’ha de mostrar a 
l’usuari el missatge corresponent. S’ha de realitzar una operació amb aquest números: dividir entre ells i sumar-li el segon i mostrar el 
resultat de l'operació.*/

DO $$
DECLARE
	var1 INTEGER := :v1;
    var2 INTEGER := :v2;
    var_res INTEGER;
BEGIN
	IF var1 <0 or var2<0 THEN
        RAISE NOTICE 'El número no pot ser negatiu!';
     ELSE
		var_res=(var1/var2) + var2;
    RAISE NOTICE 'El resultat és: % ', var_res;
	 END IF;
END;
$$ LANGUAGE PLPGSQL;


/*2)	Escriu el mateix programa PL/SQL de l’exercici 1, però ara també s’ha de controlar que el número primer sigui més gran que el segon. 
En cas contrari ha de mostrar el següent missatge: Error! el primer número ha de ser més gran que el segon.*/

DO $$
DECLARE
	var1 INTEGER := :v1;
    var2 INTEGER := :v2;
    var_res INTEGER;
BEGIN
	IF var1 <0 OR var2 < 0 THEN
        RAISE NOTICE 'El número no pot ser negatiu!';
    ELSIF var2 > var1 THEN
	    RAISE NOTICE 'El primer número ha de ser mes gran que el segón';
     ELSE
		var_res=(var1/var2)+var2;
    RAISE NOTICE 'El resultat és: % ', var_res;
	 END IF;
END;
$$ LANGUAGE PLPGSQL;



/*3)	Escriu un programa PL/SQL que demani a l’usuari la seva edat i mostri el missatge corresponent, si:
a) Entre 0 i 17 mostres 'Ets menor de edat!'
b) Entre 18 i 40 mostres 'Ja ets major de edat!'
d) > 40 mostres 'ja ets força gran'
e) Si és negatiu (<0) mostres 'L´edat no pot ser negativa'.*/

DO $$
DECLARE
var_edat INTEGER :=:vedat;
BEGIN
IF var_edat BETWEEN 0 AND 17 THEN
  RAISE NOTICE 'Ets menor d"edat!';
ELSIF var_edat BETWEEN 18 AND 40 THEN
  RAISE NOTICE 'Ja ets major d`edat!';
ELSIF var_edat > 40 THEN
  RAISE NOTICE 'ja ets força gran!';
ELSIF var_edat <0 THEN
  RAISE NOTICE 'Error ! L´edat no pot ser negativa';
END IF;
END;
$$ LANGUAGE PLPGSQL;
 
  
-- o només utilitzant una variable no plsql

DO $$
BEGIN
IF :vedat BETWEEN 0 AND 17 THEN
  RAISE NOTICE 'Ets menor d edat!';
ELSIF :vedat BETWEEN 18 AND 40 THEN
  RAISE NOTICE 'Ja ets major d"edat!';
ELSIF :vedat > 40 THEN
  RAISE NOTICE 'ja ets força gran!';
ELSIF :vedat <0 THEN
  RAISE NOTICE 'Error ! L´edat no pot ser negativa';
END IF;
END;
$$ LANGUAGE PLPGSQL;


/*4)	Escriu un programa PL/SQL que demani quina operació es farà: opció 1 SUMAR, opció 2 RESTAR, opció 3 MULTIPLICAR, opció 4 DIVIDIR . 
Després el programa també demana dos números i ha de realitzar la operació escollida amb els dos números introduits per teclat. 
S’ha de mostrar l’operació escollida, els números introduïts i el resultat.*/

DO $$
DECLARE
    var_menu NUMERIC := :vmenu;
    var_resul NUMERIC;
    var_num1 NUMERIC := :vnum1;
    var_num2 NUMERIC := :vnum2;
BEGIN
    IF var_menu=1 THEN
     var_resul=(var_num1 + var_num2);
     RAISE NOTICE 'Has triat l´operació SUMAR: % + % = %', var_num1, var_num2, var_resul;
    ELSIF var_menu=2 THEN
     var_resul= var_num1- var_num2;
     RAISE NOTICE 'Has triat l´operació RESTAR: % - % = %', var_num1, var_num2, var_resul;
    ELSIF var_menu=3 THEN
     var_resul=var_num1*var_num2;
    RAISE NOTICE 'Has triat l´operació MULTIPLICAR: % * % = %', var_num1, var_num2, var_resul;
    ELSIF var_menu =4 THEN
     IF var_num2=0 THEN
        RAISE NOTICE '  x ERROR..!! NO ES POT DIVIDIR CAP NÚMERO PER 0';
     ELSE
        var_resul= var_num1/var_num2;
        RAISE NOTICE 'Has triat l´operació DIVIDIR % / % = %:', var_num1, var_num2, var_resul;
     END IF;
    ELSE
      RAISE NOTICE '  x ERROR NO EXISTEIX CAP OPCIÓ..!!';
    END IF;
END;
$$ LANGUAGE plpgsql;

--o utlitzant CASE

DO $$
DECLARE
    var_menu NUMERIC := :vmenu;
    var_resul NUMERIC;
    var_num1 NUMERIC := :vnum1;
    var_num2 NUMERIC := :vnum2;
BEGIN
CASE var_menu 
  	WHEN 1 THEN
 	 var_resul=(var_num1+var_num2);
     RAISE NOTICE 'Ha triat l´operació SUMAR: % + % = %', var_num1, var_num2, var_resul;
 	 WHEN 2 THEN
 	 var_resul= var_num1-var_num2;
     RAISE NOTICE 'Ha triat l´operació RESTAR: % - % = %', var_num1, var_num2, var_resul;
 	 WHEN 3 THEN
	 var_resul= var_num1*var_num2;
     RAISE NOTICE 'Ha triat l´operació MULTIPLICAR: % * % = %', var_num1, var_num2, var_resul;
	 WHEN 4 THEN
	 IF var_num2=0 THEN
        RAISE NOTICE '  x ERROR..!! NO ES POT DIVIDIR CAP NÚMERO PER 0';
     ELSE
        var_resul=var_num1/var_num2;
        RAISE NOTICE 'Ha triat l´operació DIVIDIR % / % = %:', var_num1, var_num2, var_resul;
	 END IF;
	ELSE
  	RAISE NOTICE 'Opció no vàlida';
END CASE;
END;
$$


/*5)	Escriu un programa PL/SQL que ens mostri els números entre un rang. El rang mínim és 1 i el màxim se li ha de preguntar a l’usuari i 
no pot ser menor que 2. Si no és 2 o més gran mostra un missatge a l'usuari i finalitza el programa.
a. Utilitza l’estructura FOR.
b. Utilitza l’estructura WHILE. */

--Programa a) amb FOR i utilitzant una variable no plsql

DO $$
BEGIN
	IF :vnum < 2 THEN
		raise notice 'El número introduit ha de ser més gran de 1';
	ELSE
	FOR i IN 1..:vnum LOOP
		raise notice 'El valor de i és: %',i;
	END LOOP;
	END IF;
END;
$$

--Programa b) amb WHILE, utilitzant una variable plsql que servirà d'index i una variable no plsql

DO $$
DECLARE
	var_index INTEGER:=1;
BEGIN
	IF :vnum < 2  THEN
		RAISE NOTICE 'El número introduit ha de ser més gran de 1';
	ELSE
	WHILE var_index <=:vnum LOOP
		RAISE NOTICE 'El valor de i és: % ', var_index;
		var_index :=var_index +1;
	END LOOP;
	END IF;
END;
$$


/*6)	Escriu un programa PL/SQL que mostri els números entre un rang amb un salt. Tant el rang mínim, com el màxim i el salt se li ha 
de preguntar a l’usuari. A més, s’ha de tenir en compte que el rang mínim sempre ha de ser més petit que el rang màxim i que el el salt ha 
de ser més gran que 1. En cas contrari s’ha de mostrar el missatge corresponent i acabar el programa.*/

DO $$
DECLARE
 var_rangmin INTEGER:=:rangmin;
 var_rangmax INTEGER:=:rangmax;
 var_salt INTEGER := :vsalt;
 var_index INTEGER := 1;
BEGIN
  --COMPROVAR QUE EL SALT NO SIGUI NEGATIU
  IF var_salt < 1 THEN
    RAISE NOTICE 'Error, ola k ase?!, has posat una xifra negativa';
  ELSIF var_rangmin > var_rangmax THEN
    RAISE NOTICE'Error, però k fas!!! el rang mínim ha de ser més petit que el màxim';
  ELSE
  LOOP --INICI DO
    RAISE NOTICE 'Volta número: % amb el número: %', var_index, var_rangmin;
    var_index = var_index+1;
    var_rangmin = var_rangmin + var_salt;
    IF var_rangmin > var_rangmax THEN
      EXIT;
    END IF;
  END LOOP;
  END IF;
END;
$$ LANGUAGE plpgsql;



