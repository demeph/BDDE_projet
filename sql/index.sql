CREATE BITMAP INDEX bitmap_Index_Annee ON laDate ("annee");

CREATE BITMAP INDEX bitmap_Index_StatutCommune ON lesCommunes("statut");

CREATE BITMAP INDEX bitmap_Index_Categorie ON TableDeFait ("categorie");
CREATE BITMAP INDEX bitmap_Index_Categorie2 ON TableDeFait2 ("categorie"); 

CREATE BITMAP INDEX bitmap_Index_Typologie ON TableDeFait ("typologie");
CREATE BITMAP INDEX bitmap_Index_Typologie2 ON TableDeFait2 ("typologie");

CREATE BITMAP INDEX bitmap_Index_Classement ON TableDeFait ("classement");
CREATE BITMAP INDEX bitmap_Index_Classement2 ON TableDeFait2 ("classement");

CREATE BITMAP INDEX bitmap_Index_Departement ON TableDeFait2("departement");
CREATE BITMAP INDEX bitmap_Index_Region ON TableDeFait2("region");

CREATE BITMAP INDEX bij_Annee 
	ON TableDeFait(laDate.idDate) 
	FROM TableDeFait, laDate
	WHERE TableDeFait.dateClassement = laDate.idDate
;

CREATE BITMAP INDEX bij_codeInsee
	ON TableDeFait2(lesCommunes.codeInsee) 
	FROM TableDeFait, lesCommunes
	WHERE TableDeFait.codeInsee = lesCommunes.codeInsee
;

