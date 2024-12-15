
/*1.	Crea una consulta per mostrar el cognom i el salari dels empleats que guanyen més de 12.000.*/
SELECT LAST_NAME, FIRST_NAME, SALARY
FROM EMPLOYEES
where salary >12000;


 /*2.	Crea una consulta per a mostrar el cognom de l’empleat i el número de departament d’empleat amb id 176*/
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
where employee_id='176';


/*3.	 Crea una consulta per a mostrar el cognom i el número de departament de tots els empleats que els seus salari no estiguin dins del rang 5000 i 12000.*/
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
where salary not between 5000 and 12000;


/*4.	Crea una consulta per mostrar el cognom de l’empleat, l’identificador del càrrec (JOB:ID) i la data de contractació
dels empleats contractats entre el 20 de febrer de 1998 i l'1 de maig de 1998. Ordenar la consulta en ordre ascendent per data de contractació.*/
SELECT LAST_NAME, JOB_ID, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '20/02/1998' AND '1/5/1998'
ORDER BY HIRE_DATE;


/*5.	Crea una consulta per mostrar el cognom i el número de departament de tots els empleats dels departaments 20 i 50,
ordena per ordre alfabètic per cognom.*/
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMPLOYEES 
WHERE DEPARTMENT_ID IN ('20','50')
ORDER BY LAST_NAME;


/*6.	Crea una consulta per mostrar el cognom i la data de contractació de tots els empleats contractats l'any 1998*/
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE, 'YYYY') LIKE '1998'
ORDER BY HIRE_DATE;


/*7.	Crea una consulta per mostrar el cognom i el càrrec (JOB_ID) de tots els empleats que no tenen director assignat.*/
SELECT LAST_NAME, JOB_ID
FROM EMPLOYEES
where manager_id is NULL;


/*8.	Crea  una consulta per a mostrar el cognom, el salari i la comissió de tots els empleats que tenen comissions. Ordenar les dades en ordre 
descendent de salaris i comissions.*/
SELECT LAST_NAME, SALARY, COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY SALARY, COMMISsION_PCT desc;


/*9.	Crea una consulta per mostrar el cognom de tots els empleats que tingui una a como tercera lletra (en aquest camp cognom).*/
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE ('__a%');


/*10.	Crea una consulta per mostrar el cognom de tots els empleats que tinguin una a i una e (en aquest camp cognom). */
SELECT LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE ('%a%e%');


/*11.	Crea una consulta per a mostrar el cognom, el càrrec (JOB_ID) i el salari de tots els empleats on els càrrecs siguin 
representants de vendes (AC_ACCOUNT) o encarregats de stock (AD_ASST) i els salaris no siguin iguals a 2500, 3500 ni 7000*/
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
where (job_id='AC_ACCOUNT' or job_id='AD_ASST') and (salary not in ('2500','3500','7000'));

