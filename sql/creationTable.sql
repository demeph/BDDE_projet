Drop table laDate;
Drop table adresse;
Drop table etablissement;
Drop table lesCommunes;
drop table tabledefait2;
drop table tableDeFait;

Create Table laDate (
	idDate date primary key,
	annee varchar2(4),
	mois varchar2(2),
	jour varchar2(2)
);

Create Table adresse(
	idAdress integer primary key,
	adresse varchar2(100),
	codePostale varchar2(5),
	commune varchar2(50)
);

Create table etablissement(
	idEtablissement integer primary key,
	nomCommercial varchar2(200),
	numTelephone varchar2(25),
	adresseMel varchar2(75),
	siteInternet varchar2(250),
	mention varchar2(50),
	typeSejour varchar2(30)
);

Create table tableDeFait(
	idAdress integer,
	idEtablissement integer,
	datePublication date,
	dateClassement date,
	typologie varchar2(30),
	classement integer,
	categorie varchar2(20),
	capaciteAccPersonne integer,
	nbChambre integer,
	nbEmplacement integer,
	nbHabitationResidences integer,
	nbHabitationVillage integer,
	primary key(idEtablissement,idAdress,datePublication,dateClassement)
);


Create table lesCommunes (
	codeInsee varchar2(5),
	codePostale varchar(5),
	commune varchar2(50),
	altitude float,
	statut varchar2(35),
	geo_point_2d varchar2(50),
	id_geofla integer,
	codeCommune varchar2(10),
	codeCanton varchar2(15),
	codeArondissement integer,
	codeDepartement varchar2(5),
	codeRegion varchar2(5)
);

create table tabledefait2 (
  	idEtablissement integer,
  	codeInsee integer,
  	region varchar2(50),
  	population float,
  	superficie float,
  	departement varchar2(50),
  	typologie varchar2(30),
  	classement integer,
  	categorie varchar2(20),
	primary key(idEtablissement)
);