
/*1.	Mostra el nom de l’empleat, el nom del departament on treballa i l'id del seu cap. 
Primer ho resols fent servir JOIN ON i després fent servir JOIN USING*/
SELECT first_name, d.department_name, d.manager_id
FROM employees e JOIN departments d ON e.department_id = d.department_id;

--o

SELECT first_name, d.department_name, d.manager_id
FROM employees e JOIN departments d USING (department_id);


/*2.	Mostra la ciutat i el nom del departament de la localització 1400 (LOCATION_ID=1400). 
Primer ho resols fent servir JOIN ON i després fent servir JOIN USING.*/
SELECT l.city "Ciutat", d.department_name "Nom Departament"  
FROM locations l JOIN departments d  ON l.location_id=d.location_id 
WHERE l.location_id=1400;

--o

SELECT l.city "Ciutat", d.department_name "Nom Departament" 
FROM locations l JOIN departments d  USING(location_id)
WHERE location_id=1400;


/*3.	Mostra el cognom i la data de contractació de qualsevol empleat contractat després de l’empleat Davies. Fes servir JOIN.*/
SELECT DISTINCT(e.last_name), e.hire_date
FROM employees e JOIN employees d
ON (e.hire_date > d.hire_date) AND UPPER(d.last_name) = 'DAVIES';


/*4.	Mostra el nom i cognom dels empleats, el nom del departament on treballen i el nom de la ciutat on es troba el departament. 
Fes servir primer JOIN i USING i després o resols amb JOIN ON.*/
SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees e
JOIN departments d USING (department_id)
JOIN locations l USING (location_id);

--o 

SELECT e.first_name, e.last_name, d.department_name, l.city
FROM employees e JOIN departments d  ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;


/*5.	Mostra l'id del departament i el cognom de l’empleat de tots els empleats que treballin al mateix departament 
que un empleat donat. Assignar a cada columna una etiqueta adequada. Fes servir JOIN.*/
SELECT e.department_id "Num departament", e.last_name "Empleat", c.last_name "Company"
FROM employees e JOIN employees c
ON (e.department_id = c.department_id) AND
e.last_name != c.last_name; 



