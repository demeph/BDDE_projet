-- Vue 1 :
-- jointure sur les locations -> code postal, commune, departement, region

CREATE MATERIALIZED VIEW detailLocation
AS SELECT commune, code codePostale, departement, codeDepartement, region, codeRegion
FROM adresse a, lesCommunes lc
WHERE a.codePostale = lc.codePostale and a.commune = lc.commune
Group by region, departement, codePostale, commune;


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
AS SELECT AVG(f.classement)
	grouping(dt.annee) as annee,
	grouping(f.categorie) as categorie
FROM  tableDeFait f;