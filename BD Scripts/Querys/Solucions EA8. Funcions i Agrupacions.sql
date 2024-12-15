

/*1.	Mostra el nom i cognom dels empleats de tots els empleats. S'ha de mostrar amb la primera lletra en majúsculas i la resta en minúscules.*/
SELECT INITCAP(FIRST_NAME), INITCAP(LAST_NAME) FROM EMPLOYEES;
	
	
/*2.	Mostra els empleats que han sigut contractas durant el més de maig.*/
SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'MON')= 'MAY';

--també es pot fer

SELECT * FROM EMPLOYEES WHERE EXTRACT(month FROM HIRE_DATE) = 05;
	
	
/*3.	Mostra els codis d'oficis job_id) diferents que hi ha a la taula EMPLOYEES.*/
SELECT distinct job_id as "OFICIS" FROM EMPLOYEES;
	

/*4.	Calcula quants empleats hi ha en  cada departament.*/
SELECT department_id, count (*)
FROM EMPLOYEES
GROUP BY department_id;


/*5.	Calcula quants empleats hi ha de cada tipus d'ocupació (JOB_ID).*/
SELECT job_id, count (*)
FROM EMPLOYEES
GROUP BY job_id;


/*6.	Mostra el número de països que tenen cadascun dels continents que tinguin com identificador de regió 1,2 o 3.*/
select region_id, count(*) as "Total_Països"
from countries
where region_id in (1,2,3)
group by region_id;


/*7.	 Mostra per cada manager el manager_id, el nombre d'emplets que té al seu carrec i la mitja dels salaris d'aquests empleats.*/
Select manager_id, count(*) as "Total empleats", avg(salary) as "Mitja salari"
From employees
where manager_id is not null
Group by manager_id
order by 1;


/*8.	Mostra l’id del departament i el número d’empleats dels departaments amb més de 4 empleats*/
Select department_id, count(*) as "Total empleats"
From employees
Group by department_id
Having count(*)>4
order by 2;

