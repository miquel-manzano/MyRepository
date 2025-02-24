-- Exercici 1 BBDD training

SELECT c.num_clie, c.empresa
FROM clientes c WHERE c.limite_credito < ( SELECT SUM(p.importe)
FROM pedidos p
WHERE p.clie = c.num_clie);




-- Exercici 2 BBDD training

SELECT * FROM oficinas
WHERE (SELECT SUM(importe) FROM pedidos) < ALL(SELECT ventas
FROM repventas
WHERE oficina_rep = oficina);



-- Exercici 3 BBDD training

SELECT empresa, rep_clie, nombre,oficina_rep,ciudad
FROM clientes
INNER JOIN repventas ON rep_clie=num_empl
LEFT JOIN oficinas ON oficina_rep=oficina;



-- Exercici 4 BBDD training

SELECT employee_id,
CASE
WHEN employee_id =100 THEN (SELECT last_name FROM employees WHERE employee_id =100)
WHEN employee_id =120 THEN (SELECT last_name FROM employees WHERE employee_id =120)
ELSE 'Other'
END
FROM employees;




/*Utilitza el CASE per mostrar el següent:
Si el client amb el nom 'Zetacorp' ha fet més de 10 comandes mostra el missatge 'Gran Client'.
Si ha fet entre 5 i 10 comandes mostra el missatge 'Client Mitjà'.
Si ha fet menys de 5 comades mostra el missatge 'Petit Client'.
S’ha de mostrar el número de comades que ha fet aquest client i el missatge corresponent.*/


SELECT COUNT(*),
CASE
WHEN COUNT(*) > 10 THEN 'Gran Client'
WHEN COUNT(*) >= 5 AND COUNT(*) <= 10 THEN 'Client mitja'
ELSE 'Petit Client'
END
FROM pedidos
WHERE clie = (SELECT num_clie

FROM clientes
WHERE LOWER(empresa) LIKE 'zetacorp');