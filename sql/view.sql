-- Vue 1 :
-- jointure sur les locations -> code postal, commune, departement, region

CREATE MATERIALIZED VIEW detailLocation
AS SELECT a.commune, a.codePostale, f2.departement,f2.region
FROM tabledefait2 f2, lesCommunes lc, adresse a
WHERE a.codePostale = lc.codePostale and  f2.CODEINSEE = lc.codeInsee
group by  a.commune, a.codePostale, f2.departement,f2.region;


-- Vue 2 :
-- tableau des sommes
-- CREATE MATERIALIZED VIEW Somme
-- AS SELECT f2.region, sum(f.nbChambres), department, sum(f.nbChambres), commune, sum(f.nbChambres) 
-- FROM tableDeFait f, tableDeFait2 f2, detailLocation
-- WHERE 
-- Group by 

-- Vue 3 :
-- tableau des moyennes
CREATE MATERIALIZED VIEW Moyenne
AS SELECT categorie, AVG(f.classement)
FROM  tableDeFait f 
GROUP BY categorie;