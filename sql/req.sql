-- Requete 1
-- Moyenne du nombre d'étoile par an et par type d'établissement, par an, par type, moyenne générale
SELECT dt.annee, f.typologie, avg(f.classement),
	grouping(dt.annee) AS annee,
	grouping(f.typologie) AS typeEtablissement
FROM laDate dt, tableDeFait f
WHERE dt.idDate  = f.dateClassement
GROUP BY CUBE (dt.annee, f.typologie);


-- Requete 2
-- Moyenne du nombre d'étoile par an, par type d'établissement
SELECT dt.annee, f.typologie, avg(f.classement),grouping_id(dt.annee,f.typologie) as GRP
FROM laDate dt, tableDeFait f
WHERE dt.idDate = f.dateClassement
GROUP BY GROUPING SETS ((dt.annee), (f.typologie));


-- Requete 3
-- Total du nombre de places par an par commune et par typo, par commune et par typo avec au moins 3 étoiles
SELECT dt.annee, at.commune, f.typologie, sum(f.classement)
FROM laDate dt, adresse at, tableDeFait f
WHERE f.dateClassement = dt.idDate AND f.idAdress = at.idAdress AND classement >= 3 
GROUP BY ROLLUP (at.commune, f.typologie, dt.annee);


-- Requete 4
-- Pour chaque catégorie: classement des communes par moyenne
-- version 1
SELECT f.categorie, at.commune, avg(f.classement),
	dense_rank() over (PARTITION BY f.categorie 
				ORDER BY avg(f.classement) DESC) rank
FROM laDate dt, adresse at, tableDeFait f
WHERE f.idAdress = at.idAdress
GROUP BY f.categorie, at.commune;

-- version 2
SELECT f.categorie, at.commune, avg(f.classement),
	rank() over (PARTITION BY f.categorie
				ORDER BY avg(f.classement) DESC) rank
FROM laDate dt, adresse at, tableDeFait f
WHERE f.idAdress = at.idAdress
GROUP BY f.categorie, at.commune


-- Requete 5
-- Pour chaque département le classement des établissements par type de séjour
SELECT f2.departement, f.typologie, avg(f.classement),
	dense_rank() over (PARTITION BY etab.typeSejour ORDER BY avg(f.classement) DESC) rank	
FROM tableDeFait f, ETABLISSEMENT etab,tabledefait2 f2
WHERE etab.IDETABLISSEMENT = f.IDETABLISSEMENT AND f2.IDETABLISSEMENT = f.IDETABLISSEMENT
GROUP BY f2.departement, f.typologie,f.CLASSEMENT,etab.typesejour;


-- Requete 6
-- Nombre d'hôtels par habitants modifie et fonctionne
SELECT lc.commune, (COUNT(f.typologie) / f.population)
FROM tableDeFait2 f, DETAILLOCATION lc
WHERE f.codeInsee = lc.codeInsee AND f.typologie = 'HÔTEL' AND f.population != 0
GROUP BY lc.commune, f.typologie,f.population;


-- Requete 7
-- Augmentation dans le temps des places d'hébergements
SELECT ld.annee, sum(f.nbChambre), sum(sum(f.nbChambre)) over (ORDER BY ld.annee rows unbounded preceding)
FROM tableDeFait f, laDate ld
WHERE f.dateClassement = ld.idDate
GROUP BY ld.annee;


-- Requete 8
-- Affiche la population moyenne des communes en fonction de la superficie des communes
SELECT avg(rapport) 
FROM densite;


-- Requête 9
--



-- Requete 10
-- Classement des regions ayant les hôtels qui ont la plus grande capacité d'accueil
SELECT s.region, s.sum
FROM sommme s
ORDER BY sum
