/*1.	Calcular el nombre empleats que realitzen cada ofici a cada departament. 
Les dades que es visualitzen són: codi del departament, ofici i nombre empleats.*/
select department_id, job_id, count(*) as "Empleats/Departament"
from employees
group by department_id, job_id
order by 1, 2;

/*2.	Mostra el nom del departament i el número d'emplets que té cada departament. */
SELECT  d.department_name "Nom Departament", COUNT(*) "Num Empleats"
FROM employees e, departments d
WHERE e.department_id=d.department_id
GROUP BY d.department_name;

/*3.	Mostra el número d'empletas del departmant de 'SALES'. */
select d.department_name, count(*) as "Nom_empleats" 
from employees e, departments d
where e.department_id=d.department_id 
group by d.department_name
having lower(d.department_name) like 'sales';

--També és pot fer

select d.department_name, count(*) as "Nom_empleats" 
from employees e, departments d
where e.department_id=d.department_id  and lower(d.department_name) like 'sales'
group by d.department_name;

/*4.	Mostra quants departaments diferents hi ha a Seattle. */
select l.city, count(*) as "Total Departaments" 
from departments d, locations l
where d.location_id=l.location_id
group by l.city
having lower(l.city) like 'seattl%';

--També és pot fer

select l.city, count(*) as "Total Departaments" 
from departments d, locations l
where d.location_id=l.location_id and lower(l.city) like 'seattl%'
group by l.city;

/*5.	Mostra per cada cap (manager_id), la suma dels salaris dels seus empleats, però només, per aquells
casos en els quals la suma del salari dels seus empleats sigui més gran que 50000.*/
SELECT manager_id "Id Manager", SUM(salary) "Suma Salari"
FROM employees
GROUP BY manager_id
HAVING SUM(salary)>50000;

/*6.	Mostra per cada cap (manager_id) quants empleats tenen al seu carrec i quin és el salari màxim, però
només per aquells caps amb més de 6 empleats al seu càrrec.*/
SELECT manager_id "Id Manager" , COUNT(*) "Num Empleats", MAX(salary) "Màxim Salari"
FROM employees
GROUP BY manager_id
HAVING COUNT(*)>6;

/*7.	Fes al mateix que a la consulta anterior, però només per aquells caps que tinguin com a id_manager_id 100, 121 o 122. Ordena els resultats
per manager_id*/
SELECT manager_id "Id Manager" , COUNT(*) "Num Empleats", MAX(salary) "Màxim Salari"
FROM employees
WHERE manager_id IN (100, 121, 122)
GROUP BY manager_id
HAVING COUNT(*)>6
ORDER BY manager_id;
