Drop table laDate;
Drop table adresse;
Drop table etablissement;

Create Table laDate (
	idDate integer primary key,
	datePublication date,
	dateClassement date
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
	idDate integer references laDate  on delete cascade,
	idAdress integer references adresse  on delete cascade,
	idEtablissement integer references etablissement  on delete cascade,
	typologie varchar2(30),
	classement integer,
	categorie varchar2(20),
	capaciteAccPersonne integer,
	nbChambre integer,
	nbEmplacement integer,
	nbHabitationResidences integer,
	nbHabitationVillage integer,
	primary key(idEtablissement,idAdress,idDate)
);


Create table lesCommunes (
	codeInsee integer,
	codePostale integer,
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
  	idEtablissement references etablissement,
  	codeInsee integer,
  	codePostale varchar2(5),
  	region varchar2(50),
  	population integer,
  	superficie float,
  	departement varchar2(50),
  	typologie varchar2(30),
  	classement integer,
  	categorie varchar2(20),
	primary key(idEtablissement)
);