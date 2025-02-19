
/*	Exercici 1. Crea un bloc anònim amb tres variables de tipus NUMBER. Aquestes variables han de tenir un valor inicial de 
15, 40 i 35 respectivament. El bloc ha de sumar aquestes tres variables i mostrar per pantalla ‘LA SUMA TOTAL ÉS: (la suma de les variables)’.*/

DO $$
    DECLARE
        V_NUM1 NUMERIC := 15;
        V_NUM2 NUMERIC := 40;
        V_NUM3 NUMERIC := 35;
		V_RESUL NUMERIC;
    BEGIN
		V_RESUL =  V_NUM1 + V_NUM2 + V_NUM3;
        RAISE NOTICE 'LA SUMA TOTAL ÉS: %',V_RESUL;
    end;
$$



/*	Exercici 2. Crea un bloc anònim que ha d'imprimir el cognom de l'empleat en majúscules amb codi número 104 de la taula (EMPLOYEES), 
on has de declarar una variable de tipus last_name.*/

DO $$
    DECLARE
        V_COGNOM EMPLOYEES.LAST_NAME%TYPE;
    BEGIN
        SELECT LAST_NAME INTO V_COGNOM
        FROM EMPLOYEES
        WHERE employee_id = '104';
        RAISE NOTICE 'El cognom del empleat 104 és %',UPPER(V_COGNOM);
    end;
$$

/*	Exercici 3. Crea un bloc anònim que ha d'imprimir el cognom en majúscules de l'empleat amb l’id introduït per pantalla. .*/

DO $$
    DECLARE
        V_COGNOM EMPLOYEES.LAST_NAME%TYPE;
        V_ID EMPLOYEES.EMPLOYEE_ID%TYPE :=:v_employeeid;
    BEGIN
        SELECT LAST_NAME INTO V_COGNOM
        FROM EMPLOYEES
        WHERE employee_id = V_ID;
        RAISE NOTICE 'El cognom del empleat % és %', ID, UPPER (V_COGNOM);
    end;
$$

/*	Exercici 4. Crea un bloc anònim amb variables PL/SQL que mostri el salari de l'empleat amb id=120, has de declarar una variable de tipus salary.*/

DO $$
    DECLARE
        V_SALARI EMPLOYEES.SALARY%TYPE;
    BEGIN
        SELECT SALARY INTO V_SALARI
        FROM EMPLOYEES
        WHERE employee_id = '120';
        RAISE NOTICE 'El salari del empleat 120 és %', V_SALARI;
    end;
$$

/*	Exercici 5. Crea un bloc anònim amb una variable PL/SQL que imprimeixi el salari més alt dels treballadors que treballen al departament 'SALES'.*/


DO $$
	DECLARE
        V_SALARI EMPLOYEES.SALARY%TYPE;
	BEGIN
	SELECT MAX(e.SALARY)
	INTO V_SALARI
	FROM DEPARTMENTS d
	JOIN EMPLOYEES e
	ON e.DEPARTMENT_ID =d.DEPARTMENT_ID 
	WHERE UPPER(d.DEPARTMENT_NAME)='SALES';
	RAISE NOTICE 'El salari màxim del departament SALES és %', V_SALARI;
	END;
$$

--o
	
DO $$
    DECLARE
        V_SALARI EMPLOYEES.SALARY%TYPE;
    BEGIN
        SELECT MAX(SALARY) INTO V_SALARI
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID IN (
            SELECT DEPARTMENT_ID
            FROM DEPARTMENTS
            WHERE UPPER(DEPARTMENT_NAME) LIKE 'SALES'
            ) ;
        RAISE NOTICE 'El salari màxim del departament SALES és %', V_SALARI;
    end;
$$

