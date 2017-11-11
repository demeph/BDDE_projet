-- Vue 1 :
-- jointure sur les locations -> code postal, commune, departement, region

CREATE MATERIALIZED VIEW detailLocation
AS SELECT a.commune, a.codePostale, f2.departement,f2.region
FROM tabledefait2 f2, lesCommunes lc, adresse a
WHERE a.codePostale = lc.codePostale and  f2.CODEINSEE = lc.codeInsee
group by  a.commune, a.codePostale, f2.departement,f2.region;


-- Vue 2 :
-- tableau des sommes
create MATERIALIZED view somme
as (select f2.region as Nom, sum(f.NBCHAMBRE )
from TABLEDEFAIT f, TABLEDEFAIT2 f2
where f.IDETABLISSEMENT = f2.IDETABLISSEMENT
group by f2.region
union
select f2.departement as Nom, sum(f.NBCHAMBRE)
from TABLEDEFAIT f, TABLEDEFAIT2 f2
where f.IDETABLISSEMENT = f2.IDETABLISSEMENT
group by f2.departement
union 
select a.commune as Nom, sum(f.NBCHAMBRE)
from TABLEDEFAIT f, adresse a 
where f.idAdress =  a.idAdress
group by a.commune;);

-- Vue 3 :
-- tableau des moyennes
CREATE MATERIALIZED VIEW Moyenne
AS SELECT categorie, AVG(f.classement)
FROM  tableDeFait f 
GROUP BY categorie;

create materialized view densite
asselect f2.codeINSEE, f2>population,f.superficie,(f2.population*1000/f2.superficie*10) as rapport
from tabledefait2 f2
group by f2.codeINsee,f2.population,f2.superficie;