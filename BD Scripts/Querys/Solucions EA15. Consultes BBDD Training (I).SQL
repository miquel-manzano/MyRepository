

/*1- Mostra els noms dels venedors i les seves quotes dels venedors amb quotes que siguin iguals o superiors a 
l'objectiu de la seva oficina de vendes. Fes-ho primer amb una subconsulta i després amb un JOIN.*/

--Amb Subconsulta correlacionada
SELECT r.nombre, r.cuota
	FROM repventas r
	WHERE r.cuota
	      >=
	      (SELECT o.objetivo
			FROM oficinas o
			WHERE o.oficina = r.oficina_rep
		  );

--Amb JOIN
SELECT r.nombre, r.cuota, o.objetivo
FROM repventas r
	 JOIN oficinas o
	 ON(o.oficina = r.oficina_rep) AND r.cuota >= o.objetivo;


/*2- Mostra l'identificador de l'oficina i la ciutat de les oficines on l'objectiu de vendes 
de l'oficina excedeix la suma de quotes dels venedors d'aquella oficina. (Utilitza la subconsulta)*/

--Amb Subconsulta correlacionada
SELECT o.oficina, o.ciudad
    FROM oficinas o
    WHERE o.objetivo > (
--la suma de quotes dels venedors individuals (d'aquella oficina)
		SELECT SUM(r.cuota)
                FROM repventas r
                WHERE r.oficina_rep = o.oficina
     );

/*3- Mostra el nom i l'edat de tots els venedors que no dirigeixen una oficina. 
Utilitza el test d'existència.*/

--Test d'existència i consulta correlacionada
SELECT r.nombre, r.edad
	FROM repventas r
	WHERE NOT EXISTS (SELECT * FROM oficinas o 
									WHERE r.num_empl = o.dir);
									

/*4- Mostra l'identificador del fabricant com a "Fabricant", l'identificador del profucte com a
"codi Producte", la descripció i les existèncie dels productes del fabricant amb identificador
"aci" que les existències superen les existències del producte amb identificador de producte
"41004". (Utilitza la subconsulta).
*/	  
SELECT 	p.id_fab AS "Fabricant",p.id_producto AS "codi Producte", p.descripcion, p.existencias
FROM 	productos p
WHERE 	p.id_fab = 'aci' 
AND existencias > (	SELECT p.existencias
					FROM productos p
					WHERE id_producto = '41004');
									
									
/*5- Mostra Tots els clients, identificador i nom de l'empresa, que han estat atesos per 
(que han fet comanda amb) Bill Adams. (Utilitza només subconsultes).*/
SELECT c.num_clie,c.empresa
    FROM clientes c
    WHERE c.num_clie IN
            (-- clients atesos per Bill Adams
				SELECT p.clie
				FROM pedidos p
				WHERE p.rep IN
				            (-- num_empl de Bill Adams
							 SELECT r.num_empl
							 FROM repventas r
				             WHERE r.nombre = 'Bill Adams'
							));
							

/*6- Mostra l’identificador d’empleat i el nom dels venedors que han acceptat una comanda que representa més del 10% de la seva quota. Ordena els resultats per codi de venedor. Fes-ho primer amb una subconsulta i després amb un consulta multitaula (sense el JOIN).*/

--Amb Subconsulta correlacionada
SELECT r.num_empl, r.nombre
    FROM repventas r
    WHERE r.cuota * 0.10 < ANY (SELECT p.importe
                                FROM pedidos p
                                WHERE p.rep = r.num_empl
                             )
	ORDER BY r.num_empl;

-- Amb consulta multitaula 
SELECT r.num_empl, r.nombre
	FROM repventas r, pedidos p
	WHERE p.rep = r.num_empl 
	AND P.importe > 0.10*cuota
	ORDER BY r.num_empl;

							