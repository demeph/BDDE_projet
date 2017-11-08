-- Requete 1
--- Moyenne du nombre d'étoile par an et par type d'établissement,
-- par an, par type, moyenne générale
SELECT dt.annee, f.typologie, avg(f.classement),
	grouping(dt.annee) as annee,
	grouping(f.typologie) as typeEtablissement
FROM laDate dt, tableDeFait f
WHERE dt.idDate  = f.dateClassement
GROUP BY CUBE (dt.annee, f.typologie);


--Requete 2
-- Moyenne du nombre d'étoile par an, par type d'établissement
SELECT dt.annee, f.typologie, avg(f.classement),grouping(dt.annee) as annee,grouping(f.typologie) as typeEtablissement
FROM laDate dt, tableDeFait f
WHERE dt.idDate = f.dateClassement
GROUP BY GROUPING SETS ((dt.annee), (f.typologie));


-- Requete 3
-- Fonctionne
-- Total du nombre de places par an par commune et par typo, 
-- par commune et par typo
-- avec au moins 3 étoiles
SELECT dt.annee, at.commune, f.typologie, sum(f.classement)
FROM laDate dt, adresse at, tableDeFait f
WHERE f.dateClassement = dt.idDate AND f.idAdress = at.idAdress AND classement >= 3 
GROUP BY ROLLUP (at.commune, f.typologie, dt.annee);


-- Requete 4
-- Fonctionne 
-- Pour chaque catégorie: classement des communes par moyenne 	
SELECT f.categorie, at.commune, avg(f.classement),
	dense_rank() over (PARTITION BY f.categorie 
				ORDER BY avg(f.classement) desc) rank
FROM laDate dt, adresse at, tableDeFait f
WHERE f.idAdress = at.idAdress
GROUP BY f.categorie, at.commune;


SELECT f.categorie, at.commune, avg(f.classement),
	rank() over (PARTITION BY f.categorie
				ORDER BY avg(f.classement) desc) rank
FROM laDate dt, adresse at, tableDeFait f
WHERE f.idAdress = at.idAdress
GROUP BY f.categorie, at.commune



-- Pour chaque département le classement des établissements par type de séjour
SELECT f.departement, f.typologie, avg(f.classement),
	dense_rank() over (PARTITION BY e.typeSejour ORDER BY avg(f.classement) desc) rank	
FROM tableDeFait2 f
GROUP BY f.departement, f.typologie

-- Nombre d'hôtels par habitants
SELECT lc.commune, (count(f.typologie) / f.population)
FROM tableDeFait2 f, lesCommunes lc
WHERE f.codeInsee = lc.codeInsee and typologie = "HÔTEL"
GROUP BY lc.commune, f.typologie


-- Augmentation dans le temps des places d'hébergements
SELECT ld.annee, sum(f.nbChambres), sum(sum(f.nbChambres)) over (order by ld.annee rows unbounded preceding)
FROM tableDeFait f, laDate ld
WHERE f.dateClassement = ld.idDate


select avg(avg(f.population*1000/f.superficie*10)) as average
from TABLEDEFAIT2 f
group by f.POPULATION,f.SUPERFICIE;