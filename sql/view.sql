-- Vue 1 :
-- jointure sur les locations -> code postal, commune, departement, region
CREATE MATERIALIZED VIEW detailLocation
AS SELECT f2.codeInsee,a.commune, a.codePostale, f2.departement,f2.region
FROM tabledefait2 f2, lesCommunes lc, adresse a
WHERE a.codePostale = lc.codePostale AND f2.CODEINSEE = lc.codeInsee
GROUP BY  a.commune, a.codePostale, f2.departement,f2.region;


-- Vue 2 :
-- tableau des sommes des capacités d'accueil pour les hotels
CREATE MATERIALIZED view somme
AS (SELECT f2.region AS Nom, sum(f.NBCHAMBRE) AS sum
FROM TABLEDEFAIT f, TABLEDEFAIT2 f2
WHERE f.IDETABLISSEMENT = f2.IDETABLISSEMENT
GROUP BY f2.region
UNION
SELECT f2.departement AS Nom, sum(f.NBCHAMBRE) AS sum
FROM TABLEDEFAIT f, TABLEDEFAIT2 f2
WHERE f.IDETABLISSEMENT = f2.IDETABLISSEMENT
GROUP BY f2.departement
UNION 
SELECT a.commune AS Nom, sum(f.NBCHAMBRE) AS sum
FROM TABLEDEFAIT f, adresse a 
WHERE f.idAdress =  a.idAdress
GROUP BY a.commune;);


-- Vue 3 :
-- tableau sur la moyenne des classements par catégorie d'hébergement
CREATE MATERIALIZED VIEW Moyenne
AS SELECT categorie, AVG(f.classement)
FROM  tableDeFait f 
GROUP BY categorie;


-- Vue 4
-- tableau du nombre d'habitant par superficie pour chaque commune
CREATE materialized view densite
AS SELECT f2.codeINSEE, f2.population,f.superficie,(f2.population*1000/f2.superficie*10) AS rapport
FROM tabledefait2 f2
GROUP BY f2.codeINsee,f2.population,f2.superficie;
