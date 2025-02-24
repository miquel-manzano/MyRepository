-- EXERCICI 1

SELECT nom_empresa, ciutat_empresa, activitat
FROM EmpresaProductora
WHERE nif_empresa IN
(SELECT DISTINCT NIF_EMPRESA
FROM RESIDU_CONSTITUENT
WHERE COD_CONSTITUENT = 9912)
ORDER BY NOM_EMPRESA;

-- El resultat mostra 15 files



-- EXERCICI 2

select e.nom_empresa, r.quantitat_residu
from empresaproductora e JOIN residu r
ON e.nif_empresa = r.nif_empresa
WHERE r.quantitat_residu = (select max(quantitat_residu) from residu);
--o sense el JOIN
select e.nom_empresa, r.quantitat_residu
from empresaproductora e,residu r
where e.nif_empresa = r.nif_empresa
and r.quantitat_residu = (select max(quantitat_residu) from residu);

-- El resultat mostra 1 fila.



-- EXERCICI 3

select max(quantitat_trasllat) as "max_quantitat", min(quantitat_trasllat) as "min_quantitat",
tractament as "tractament"
from trasllat
group by tractament
having min(quantitat_trasllat) > 1
order by 3;

-- El resultat mostra 2 files



-- EXERCICI 4

SELECT nom_desti "Destí", ciutat_desti "Ciutat de destí"
FROM Desti
WHERE cod_desti IN
(SELECT DISTINCT cod_desti
FROM TRASLLAT_EMPRESATRANSPORT
WHERE nif_emptransport = 'A-22300325' AND kms > 4297);

-- El resultat mostra 2 files



-- EXERCICI 5

select distinct et.nom_emptransport, (sum(tet.kms))
from trasllat_empresatransport tet, empresatransportista et
where tet.nif_emptransport=et.nif_emptransport and tet.data_enviament between '01/10/16' and
'30/11/16'
group by et.nom_emptransport
having sum(tet.kms) > 3400
order by 2 desc;

-- El resultat mostra 11 files