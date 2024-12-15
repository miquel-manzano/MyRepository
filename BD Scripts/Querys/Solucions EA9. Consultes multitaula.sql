
/* 1.	Mostra el nom del departament, el nom i el cognom dels empleats que el seu departament sigui 'Sales'.*/
select d.department_name, e.first_name, e.last_name
from employees e, departments d
where d.department_id=e.department_id and lower(department_name) like 'sales';

/* 2. Mostra el nom del departament i totes les dades dels empleats que no treballen en el departament 'IT' ni 'Purchasing' */
select d.department_name , e.* 
from employees e, departments d
where e.department_id=d.department_id and d.department_name not in ('IT', 'Purchasing');

/* 3. Mostra els noms de les ciutats que els noms dels departaments tinguin una u en la segona posició. */
select city
from locations l, departments d
where l.location_id =d.location_id and d.department_name like '_u%';

/* 4. Mostra la ciutat i totes les dades dels departaments que es troben al codi postal '98199'. */
select l.city, d.*
from departments d, locations l
where l.location_id=d.location_id and  l.postal_code like '98199';

/* 5. Mostra el job_title i totes les dades dels empleats que el seu job_title sigui Programmer.*/
select j.job_title, e.* 
from employees e, jobs j
where e.job_id=j.job_id and lower(j.job_title) like 'programmer%';

/* 6. Mostra els noms dels països (country_name) i el nom del continent (region_name) d'Àsia i Europa.*/
select country_name, region_name
from countries c, regions r
where r.region_id=c.region_id and lower(r.region_name) in ('asia','europe');

/* 7. Mostra els departaments que tinguin empleats que hagin finalitzat el seu contracte a l'any 1993*/
select distinct department_name
from departments d, job_history j
where d.department_id=j.department_id and to_char(end_date,'yy')='93';

/* 8. Mostra el nom, el cognom i el nom del departament i la ciutat dels empleats que treballen a Seattle.*/
select e.first_name, e.last_name, d.department_name, l.city
from employees e, departments d, locations l
where l.location_id=d.LOCATION_ID and d.DEPARTMENT_ID=e.department_id and lower(l.city)='seattle';

/* 9. Mostra els noms de tots els departaments i la ciutat i país on estiguin ubicats.*/
select d.department_name, l.city, c.country_name
from departments d, locations l, countries c
where l.location_id=d.location_id and l.country_id=c.country_id;

/* 10. Mostra el cognom i el job_id dels empleats que tinguin el mateix ofici que el seu cap i mostra el nom del cap.*/
select e.last_name, e.job_id, m.first_name 
from employees e, employees m
where m.employee_id=e.manager_id and m.job_id=e.job_id;

/* 11. Mostra el cognom dels empleats que tinguin el mateix ofici que el seu cap, el nom del cap i mostra també el nom de l'ofici (job_title).*/
select e.last_name "Empleat", m.last_name "Cap" , j.job_title "Ofici"
from employees e, employees m, jobs j
where e.manager_id= m.employee_id and e.job_id= j.job_id AND e.job_id= m.job_id;









