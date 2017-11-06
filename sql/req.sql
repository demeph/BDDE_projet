-- Moyenne du nombre d'étoile par an et par type d'établissement,
-- par an, par type, moyenne générale
SELECT dt.annee, f.typologie, avg(f.classement),
	grouping(dt.annee) as annee,
	grouping(f.typologie) as typeEtablissement
FROM laDate dt, tableDeFait f
WHERE dt.idDate  = f.dateClassement
GROUP BY CUBE (dt.annee, f.typologie)



-- Moyenne du nombre d'étoile par an, par type d'établissement
SELECT dt.annee, f.typologie, avg(f.classement),
	grouping(dt.annee) as annee,
	grouping(f.typologie) as typeEtablissement
FROM laDate dt, tableDeFait f
WHERE dt.idDate = f.dateClassement
GROUP BY GROUPING SETS ((dt.annee), (f.typologie))



-- Total du nombre de places par an par commune et par typo, 
-- par commune et par typo
-- avec au moins 3 étoiles
SELECT dt.annee, at.commune, f.typologie, sum(f.classement)
FROM laDate dt, adresse at, tableDeFait f
WHERE f.idDate = dt.idDate AND f.idAdress = at.idAdress AND classement >= 3 
GROUP BY ROLLUP (commune, f.typologie, dt.annee)



-- Pour chaque catégorie: classement des communes par moyenne 	
SELECT f.categorie, at.commune, avg(f.classement),
	dense_rank() over (PARTITION BY at.commune 
				ORDER BY avg(f.classement) desc) rank
FROM laDate dt, adresse at, tableDeFait f
WHERE f.idAdress = at.idAdress
GROUP BY f.categorie, at.commune
