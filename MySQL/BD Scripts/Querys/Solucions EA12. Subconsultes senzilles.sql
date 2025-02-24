
/*1.	Mostra els noms dels oficis (job_title) dels empleats que treballen al departament 80.*/
select job_title
from jobs
where job_id IN (select job_id from employees where department_id = 80);


/*2.	Mostra els noms de departaments que tinguin empleats.*/
select department_name
from departments
where department_id IN (select employees.department_id from employees);


/*3.	Mostra els cognoms els empleats que tenen un salari inferior al salari mitjà dels empleats que són 
representants de vendes (job_id=’SA_MAN’).*/
select last_name
from employees
where salary < (select avg(salary) from employees where lower(job_id)='sa_man');


/*4.	Mostra els noms països que estan al mateix continent que Argentina.*/
select country_name 
from countries 
where region_id =(select region_id from countries
where lower (country_name) like 'arg%');


/*5.	Mostra el noms i els cognoms de tots els empleats amb el mateix ofici que David Austin.*/
select first_name, last_name from employees 
where job_id = (select job_id from employees where first_name= 'David' and last_name='Austin');


/*6.	Mostra els noms dels països d'Àsia o Europa.*/

-- Amb subconsulta
select country_name 
from countries
where region_id in (select region_id 
						from regions
						where region_name in ('Asia', 'Europe'));					
												
--Amb consulta multitaula  
select country_name, region_name
from countries c, regions r
where r.region_id=c.region_id and lower(r.region_name) in ('asia','europe');


/*7.	Mostra els cognoms dels empleats que el seu nom comença per H i el seu salari 
és més gran que algun empleat del departament 100.*/

-- Amb subconsulta
select last_name
from employees 
where lower(first_name) like 'h%' and salary > any (select salary from employees where department_id=100);

--Amb consulta multitaula
select distinct e.last_name
from employees e, employees e1
where lower(e.first_name) like 'h%' and e.salary > e1.salary and e1.department_id=100;


/*8.	Mostra els cognoms d'aquells empleats que no treballen al departament de Marketing ni al de vendes.*/

-- Amb subconsulta
select last_name 
from employees 
where department_id in (select department_id 
						from departments 
						where department_name not in ('Sales', 'Marketing'));

--Amb consulta multitaula  
select e.last_name, d.department_name
from employees e, departments d
where e.department_id=d.department_id and d.department_name not in ('Marketing', 'Sales');




