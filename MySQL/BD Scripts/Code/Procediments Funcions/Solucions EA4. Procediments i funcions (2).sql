/*Exercici 1 - Realitzar un procediment anomenat proc_baixa_emp que dongui de baixa un empleat i que tingui com a paràmetre l'id de l'empleat.
S'ha de programar un bloc anònim que cridi el procediment i se li passi com a paràmetre l'id de l'empleat que l'usuari introdueixi per teclat.
Prova el procediment en una taula que sigui còpia de la taula «employees».*/

CREATE OR REPLACE PROCEDURE proc_baixa_emp (par_codi_emp EMPLOYEES.EMPLOYEE_ID%TYPE) language  plpgsql AS $$
BEGIN
    DELETE FROM EMPLOYEES
    WHERE EMPLOYEE_ID = par_codi_emp;
    RAISE NOTICE 'Empleat eliminat correctament';
    COMMIT;
END;$$;

DO $$
DECLARE
	var_codi_emp EMPLOYEES.EMPLOYEE_ID%TYPE = :vcodi_emp;	
    BEGIN
        CALL proc_baixa_emp(var_codi_emp);
END; $$ language  plpgsql;

/*Exercici 2 - Realitzar un programa que contingui una funció que retorni quants empleats hi ha a un departament. L'id del departament es passarà com a paràmetre de la funció. La funció s’anomenarà func_num_emp i es cridarà des d’un bloc anònim  o principal. El paràmetre que se li passa a la funció se li preguntarà a l’usuari i per tant, s’ha d’introduir per teclat.*/

CREATE OR REPLACE FUNCTION func_num_emp (par_codi_dept DEPARTMENTS.DEPARTMENT_ID%TYPE) RETURNS NUMERIC LANGUAGE plpgsql AS $$
DECLARE
  var_resul NUMERIC;
BEGIN
	SELECT COUNT(EMPLOYEE_ID)
	INTO var_resul
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = par_codi_dept;
	RETURN var_resul;
END; $$;

DO $$
DECLARE
	var_codi_dept DEPARTMENTS.DEPARTMENT_ID%TYPE := :vcodi_dept;
	var_resultat NUMERIC := 0;
BEGIN
	var_resultat= (select (func_num_emp(var_codi_dept)));
	RAISE NOTICE 'Al departament número % hi ha % treballadors', var_codi_dept, var_resultat;
END; $$ LANGUAGE plpgsql;

/*Exercici 3 - Realitzar un programa que contingui una funció anomenada func_cost_dept que retorni la suma total dels salaris dels empleats d’un departament en concret. La funció es cridarà des d’un bloc anònim o principal. El paràmetre que se li passa a la funció és l’id del departament i se li preguntarà a l’usuari, i per tant, s’ha d’introduir pel teclat*/

CREATE OR REPLACE FUNCTION func_cost_dept (par_codi_dept DEPARTMENTS.DEPARTMENT_ID%TYPE) RETURNS NUMERIC LANGUAGE plpgsql AS $$
DECLARE
 var_resultat NUMERIC;
BEGIN
 SELECT SUM(SALARY)
 INTO var_resultat
 FROM EMPLOYEES
 WHERE DEPARTMENT_ID=par_codi_dept;
RETURN var_resultat;
END;$$;

DO $$
BEGIN
  RAISE NOTICE 'El resultat es: %',(SELECT (func_cost_dept(:vcodi_dept)));
END; $$ language  plpgsql;

/*Exercici 4 - Realitzar un procediment anomenat proc_mod_com que modifiqui el valor de la comissió d’un empleat que s’introdueixi l'id per teclat.
Per a modificar aquesta comissió hem de tenir en compte que:
• Si el salari és menor a 3000, la nova comissió és 0.1.
• Si el salari està entre 3000 i 7000, la nova comissió és 0.15.
• Si el salari és més gran que 7000, la nova comissió és 0.2.
S'ha de programar un bloc anònim que cridi el procediment i se li passi com a paràmetre l'id de
l'empleat que l'usuari introdueixi pel teclat.
Provem el procediment amb els empleats 100, 116 i 113
*/

--Primer el resolem amb l'estructura de control de flux IF...ELSIF...
CREATE OR REPLACE PROCEDURE proc_mod_com (par_codi_emp EMPLOYEES.EMPLOYEE_ID%TYPE) LANGUAGE plpgsql as $$
DECLARE
  var_salari EMPLOYEES.SALARY%TYPE;
  var_comissio EMPLOYEES.COMMISSION_PCT%TYPE;
BEGIN
  SELECT SALARY
  INTO var_salari
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID=par_codi_emp;
  IF var_salari<3000 THEN
    var_comissio:=0.1;
  ELSIF var_salari BETWEEN 3000 AND 7000 THEN
    var_comissio:=0.15;
  ELSIF var_salari>7000 THEN
    var_comissio:=0.2;
  END IF;
  UPDATE EMPLOYEES
  SET COMMISSION_PCT=var_comissio
  WHERE EMPLOYEE_ID=par_codi_emp;
	RAISE NOTICE 'La nova comissió és: %', var_comissio;
  RAISE NOTICE 'Comissió modificada correctament';
END; $$;


DO $$
DECLARE
	var_codi_emp EMPLOYEES.EMPLOYEE_ID%TYPE = :vcodi_emp;	
    BEGIN
        CALL proc_mod_com (var_codi_emp);
END; $$ language  plpgsql;


--Solució utilitzanta l'estructura de control de flux CASE
CREATE OR REPLACE PROCEDURE proc_mod_com (par_codi_emp EMPLOYEES.EMPLOYEE_ID%TYPE) LANGUAGE plpgsql as $$
DECLARE
  var_salari EMPLOYEES.SALARY%TYPE;
  var_comissio EMPLOYEES.COMMISSION_PCT%TYPE;
BEGIN
  SELECT SALARY
  INTO var_salari
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID=par_codi_emp;
  CASE
  WHEN var_salari<3000 THEN
     var_comissio:=0.1;
  WHEN var_salari BETWEEN 3000 AND 7000 THEN
     var_comissio:=0.15;
  ELSE  var_comissio:=0.2;
  END CASE;
  UPDATE EMPLOYEES
  SET COMMISSION_PCT=var_comissio
  WHERE EMPLOYEE_ID=par_codi_emp;
	RAISE NOTICE 'La nova comissió és: %', var_comissio;
  RAISE NOTICE 'Comissió modificada correctament';
END; $$;


DO $$
DECLARE
	var_codi_emp EMPLOYEES.EMPLOYEE_ID%TYPE = :vcodi_emp;	
    BEGIN
        CALL proc_mod_com (var_codi_emp);
END; $$ language  plpgsql;



