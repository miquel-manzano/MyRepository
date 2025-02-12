/*Exercici 1 - Realitzar un programa que contingui una funció que dupliqui la quantitat rebuda com a paràmetre. La funció rebrà el nom de FUNC_DUPLICAR_QUANTITAT. S’ha de programar un bloc principal que demani per teclat la quantitat i que cridi a la funció FUNC_DUPLICAR_QUANTITAT
passant el paràmetre corresponent.*/

CREATE OR REPLACE FUNCTION func_duplicar_quantitat(param_num NUMERIC)
    RETURNS NUMERIC AS $$
DECLARE
    var_resul NUMERIC;
BEGIN
    var_resul:=param_num*2;
    RETURN(var_resul);
END; $$ language plpgsql;

DO $$
    DECLARE
        var_num NUMERIC:=:vnum;
		var_dup NUMERIC;
    BEGIN
        var_dup:=(select func_duplicar_quantitat(var_num));
        RAISE NOTICE 'EL NUMERO %  DUPLICAT= %', var_num,var_dup;
END; $$ language plpgsql;

/* Exercici 2 - RRealitzar un programa que contingui una funció que calculi el factorial d’un número que es passa com a paràmetre. La funció rebrà el nom de FUNC_FACTORIAL. S’ha de programar un bloc principal que pregunti a l’usuari pel número a calcular i cridi a la funció FUNC_FACTORIAL,
passant el paràmetre corresponent.*/

-- Exercici 2 (amb FOR):
CREATE OR REPLACE FUNCTION  func_factorial(param_num NUMERIC) RETURNS NUMERIC as $$ 
DECLARE
 var_res NUMERIC :=1; 
BEGIN 
 FOR i IN 1..param_num LOOP  
  var_res := i*var_res; 
 END LOOP; 
 RETURN (var_res);  
END;$$ LANGUAGE plpgsql; 

DO $$
DECLARE 
 var_fac NUMERIC := :vfac; 
BEGIN 
 IF var_fac < 0 THEN 
  raise notice 'El número no pot ser negatiu!';  
 ELSE 
  RAISE NOTICE  'El factorial del número que has introduit és  %' ,(select func_factorial(var_fac));     
 END IF; 
END;$$ LANGUAGE plpgsql; 


-- Exercici 2 (amb While incrementant):
CREATE OR REPLACE FUNCTION func_factorial_while(param_num NUMERIC) RETURNS NUMERIC language plpgsql as $$
DECLARE
  var_resul NUMERIC:=1;
  var_i NUMERIC :=1;
BEGIN
  WHILE var_i<=param_num LOOP
    var_resul:=var_resul*var_i;
	raise notice '%', var_i;
    var_i:=var_i+1;    
    END LOOP;
  RETURN(var_resul);
END; $$;

DO $$
DECLARE
  var_resultat NUMERIC;
BEGIN
    var_resultat:= (select func_factorial_while(:vnum));
    RAISE NOTICE  'El factorial del número % és %', :vnum, var_resultat;
END;$$ LANGUAGE plpgsql;


-- Exercici 2 (amb LOOP):
CREATE OR REPLACE FUNCTION func_factorial_loop(param_num NUMERIC) RETURNS NUMERIC language plpgsql as $$
DECLARE
  var_resul NUMERIC:=1;
  var_i NUMERIC :=1;
BEGIN
  LOOP
	IF var_i<=param_num THEN
     var_resul:=var_resul*var_i;
	raise notice '%', var_i;
	ELSE	
	 EXIT;
	END IF;	
	var_i:=var_i+1;
   END LOOP;
  RETURN(var_resul);
END; $$;

DO $$
DECLARE
  var_resultat NUMERIC;
BEGIN
    var_resultat:= (select func_factorial_loop(:vnum));
    RAISE NOTICE  'El factorial del número % és %', :vnum, var_resultat;
END;$$ LANGUAGE plpgsql;


/* Exercici 3. Realitzar un procediment que s’anomeni PROC_EMP_INFO i que es passi com a paràmetre l’Id d’un empleat i mostri el seu ID, el seu nom, el seu càrrec (job_title) i el seu salari. Has de canviar els nom de les columnes perquè sigui (codi_empleat, nom_empleat, càrrec, salari). Per realitzar aquest exercici has de fer servir una variable de tipus %rowtype. S’ha de programar un bloc principal que pregunti a l’usuari pel ID de l’empleat i cridi al procediment PROC_EMP_INFO, passant el paràmetre corresponent*/

/* Exercici 3a - En comptes de mostrar el JOB_TITLE, mostrarem el JOB_ID, així posem un exemple d'utilitzar una sola taula.*/
CREATE OR REPLACE PROCEDURE proc_emp_info(param_codi EMPLOYEES.EMPLOYEE_ID%TYPE) language plpgsql as $$
DECLARE
  var_emp EMPLOYEES%ROWTYPE;
BEGIN
  SELECT *
  INTO var_emp
  FROM EMPLOYEES 
  WHERE EMPLOYEE_ID = param_codi;
  RAISE NOTICE  'CODI  NOM  FEINA  SALARI';
  RAISE NOTICE  '%  % % %', var_emp.EMPLOYEE_ID,var_emp.FIRST_NAME,var_emp.JOB_ID, var_emp.SALARY;
END; $$ 

DO $$
DECLARE
var_codi EMPLOYEES.EMPLOYEE_ID%TYPE := :vcodi;
BEGIN
 CALL proc_emp_info(var_codi);
END; $$

/* Exercici 3b - Aquí si que mostrem les dades de l'empleat i el JOB_TITLE, i cal consultar dues taules i fem servir una variable 
tipus %ROWTYPE i una variable %TYPE.*/
CREATE OR REPLACE PROCEDURE proc_emp_info(param_codi EMPLOYEES.EMPLOYEE_ID%TYPE) language plpgsql as $$
DECLARE
  var_emp EMPLOYEES%ROWTYPE;
  var_title JOBS.JOB_TITLE%TYPE;
BEGIN
  SELECT e.EMPLOYEE_ID, e.FIRST_NAME,j.JOB_TITLE, e.SALARY
  INTO var_emp.EMPLOYEE_ID, var_emp.FIRST_NAME, var_title, var_emp.SALARY
  FROM EMPLOYEES E NATURAL JOIN JOBS j
  WHERE EMPLOYEE_ID=param_codi;
  RAISE NOTICE  'CODI  NOM  FEINA  SALARI';
  RAISE NOTICE  '%  % % %', var_emp.EMPLOYEE_ID,var_emp.FIRST_NAME,var_title, var_emp.SALARY;
END; $$ 

DO $$
DECLARE
var_codi EMPLOYEES.EMPLOYEE_ID%TYPE := :vcodi;
BEGIN
 CALL proc_emp_info(var_codi);
END; $$ 

/* Exercici 3c. Ara mostrem les dades de l'empleat i el JOB_TITLE utilitzanr un variable tipus REGISTRE (RECORD) - */
CREATE OR REPLACE PROCEDURE proc_emp_info(param_codi EMPLOYEES.EMPLOYEE_ID%TYPE) language plpgsql as $$
DECLARE
  var_emp RECORD;
BEGIN
  SELECT e.EMPLOYEE_ID, e.FIRST_NAME,j.JOB_TITLE, e.SALARY
  INTO var_emp
  FROM EMPLOYEES E NATURAL JOIN JOBS j
  WHERE EMPLOYEE_ID=param_codi;
  RAISE NOTICE  'CODI  NOM  FEINA  SALARI';
  RAISE NOTICE  '%  % % %', var_emp.EMPLOYEE_ID,var_emp.FIRST_NAME,var_emp.JOB_TITLE, var_emp.SALARY;
END; $$ 

DO $$
DECLARE
var_codi EMPLOYEES.EMPLOYEE_ID%TYPE := :vcodi;

BEGIN
 CALL proc_emp_info(var_codi);
END; $$ 

/*Exercici 4a - Realitzar un programa que contingui un procediment anomenat PROC_ALTA_JOB que doni d’alta un nou ofici (JOB) a la taula jobs. Totes les dades del nou ofici s’han de passat com com a paràmetre. S’ha de programar un bloc principal que pregunti a l’usuari totes les dades del nou ofici i cridi el procediment PROC_ALTA_JOB. Abans d’inserir s’ha de comprovar que el valor màxim i mínim del salari no sigui negatiu i a més, que el salari mínim sigui més petit que el salari màxim. Mostra el missatges d’error corresponents.*/

CREATE OR REPLACE PROCEDURE proc_alta_job(param_codi JOBS.JOB_ID%TYPE,
param_title JOBS.JOB_TITLE%TYPE,
par_min_salary JOBS.MIN_SALARY%TYPE,
par_max_salary JOBS.MAX_SALARY%TYPE
) language plpgsql AS $$
BEGIN
 INSERT INTO JOBS
 VALUES(param_codi,param_title,par_min_salary,par_max_salary);
 RAISE NOTICE  'INSERIT CORRECTAMENT';
 COMMIT;
END;$$;

DO $$
DECLARE
var_codi JOBS.JOB_ID%TYPE := :vcodi;
var_title JOBS.JOB_TITLE%TYPE := :vtitle;
var_min_salary JOBS.MIN_SALARY%TYPE := :vmin_salary;
var_max_salary JOBS.MAX_SALARY%TYPE := :vmax_salary;
BEGIN
IF (var_min_salary <0) OR (var_max_salary <0) OR (var_min_salary > var_max_salary) THEN
 RAISE NOTICE  'El salari no és vàlid';
ELSE
 CALL proc_alta_job(var_codi,var_title,var_min_salary,var_max_salary);
END IF;
END; $$ language plpgsql;


/*Exercici 4b. Ara farem servir una funció per comprovar si el valor màxim i mínim del salari no siguin negatius i que també comprovi que
el salari mínim sigui més petit que el salari màxim*/

CREATE OR REPLACE FUNCTION func_comprovar_sals (par_sal_minim NUMERIC, par_sal_maxim NUMERIC) RETURNS BOOLEAN
    language  plpgsql AS $$
BEGIN
 IF par_sal_minim >= par_sal_maxim THEN
 RAISE NOTICE  'El salari mínim no pot ser més gran que el salari màxim';
 RETURN(FALSE);
ELSIF par_sal_minim < 0 OR par_sal_maxim <0 THEN
 RAISE NOTICE  'Els salaris no poden ser negatius';
 RETURN(FALSE);
ELSE
  RETURN(TRUE);
END IF;
END;$$;

--O sense nom als paràmetres
CREATE OR REPLACE FUNCTION func_comprovar_sals (NUMERIC, NUMERIC) RETURNS BOOLEAN
    language  plpgsql AS $$
BEGIN
 IF $1 >= $2 THEN
 RAISE NOTICE  'El salari mínim no pot ser més gran que el salari màxim';
 RETURN(FALSE);
ELSIF $1 < 0 OR $2 <0 THEN
 RAISE NOTICE  'Els salaris no poden ser negatius';
 RETURN(FALSE);
ELSE
  RETURN(TRUE);
END IF;
END;$$;

--En el bloc anònim demanem les dades a l'usuari, cridem la funció per comprovar si els salaris són correctes i cridem el procediment
--d'inserció de l'ofici.
DO $$
DECLARE
var_codi JOBS.JOB_ID%TYPE := :vcodi;
var_title JOBS.JOB_TITLE%TYPE := :vtitle;
var_min_salary JOBS.MIN_SALARY%TYPE := :vmin_salary;
var_max_salary JOBS.MAX_SALARY%TYPE := :vmax_salary;
BEGIN
IF (func_comprovar_sals(var_min_salary,var_max_salary)) THEN
 CALL proc_alta_job(var_codi,var_title,var_min_salary,var_max_salary);
ELSE
 RAISE NOTICE  'Els salaris no són vàlids';
END IF;
END; $$ language plpgsql;


--O també podem fer:
CREATE OR REPLACE FUNCTION func_comprovar_sals (par_sal_minim NUMERIC, par_sal_maxim NUMERIC) RETURNS BOOLEAN
    language  plpgsql AS $$
BEGIN
 IF par_sal_minim >= par_sal_maxim THEN
 RETURN(FALSE);
ELSIF par_sal_minim < 0 OR par_sal_maxim <0 THEN
 RETURN(FALSE);
ELSE
  RETURN(TRUE);
END IF;
END;$$;

DO $$
DECLARE
var_codi JOBS.JOB_ID%TYPE := :vcodi;
var_title JOBS.JOB_TITLE%TYPE := :vtitle;
var_min_salary JOBS.MIN_SALARY%TYPE := :vmin_salary;
var_max_salary JOBS.MAX_SALARY%TYPE := :vmax_salary;
BEGIN
IF (func_comprovar_sals(var_min_salary,var_max_salary) = FALSE) THEN
 RAISE NOTICE  'El salari no és vàlid';
ELSE
 CALL proc_alta_job(var_codi,var_title,var_min_salary,var_max_salary);
END IF;
END; $$ language plpgsql;


