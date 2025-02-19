 
/*1.	Mostra els departaments que el salari mitja dels seus treballadors és més gran o igual que la mitja de tots els salaris.*/

SELECT department_id, ROUND (AVG(salary),2) AS "Mitja Salary"  
FROM employees
GROUP BY department_id
HAVING AVG(salary) >=(SELECT AVG(salary) FROM employees)
ORDER BY 1;

 
/*2.	Mostra l'identificador i el nom del departament que gasta més diners en les nòmines dels seus empleats i 
quants són aquests diners.*/

--Fent servir una subconsulta
SELECT d.department_id, d.department_name, SUM(e.salary) AS "Total Salary"
FROM employees e, departments d
WHERE e.department_id=d.department_id
GROUP BY e.department_id, d.department_name
HAVING SUM(salary)=(SELECT MAX(c) from (SELECT SUM(salary) AS c
FROM employees GROUP BY department_id) AS a);

--o, sense subconsulta, fent servir LIMIT 1

SELECT e. department_id, department_name, SUM(e.salary) AS "Total Salary"
FROM employees e, departments d
WHERE e.department_id=d.department_id
GROUP BY e.department_id, d.department_name
ORDER BY 3 desc
LIMIT 1;


/*3.	Mostra els noms i cognoms dels empleats més antics de cada departament*/

SELECT first_name, last_name, department_id
FROM employees
WHERE employee_id IN ( SELECT employee_id FROM employees WHERE ( hire_date,
department_id)in (SELECT MIN(hire_date),department_id FROM employees
GROUP BY department_id))
ORDER BY 3;

--També es pot fer

SELECT first_name, last_name, department_id 
FROM employees 
WHERE ( hire_date,department_id) IN (select min(hire_date),department_id FROM employees
GROUP BY department_id)
ORDER BY 3;


/*4.	Mostra totes les dades d'aquells departaments que tinguin empleats que hagin finalitzat el seu contracte entre 
el gener de l'any 1992 i el desembre de l'any 2001.*/

--Utilitzant el test d'existència i subconsulta correlacionada
SELECT * 
FROM departments d 
WHERE EXISTS (SELECT * 
FROM job_history j 
WHERE end_date BETWEEN '01-JAN-92' AND '31-DEC-01' 
AND d.department_id= j.department_id);
