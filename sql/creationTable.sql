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
	classement varchar2(15),
	categorie varchar2(20),
	capaciteAccPersonne integer,
	nbChambre integer,
	nbEmplacement integer,
	nbHabitationResidences integer,
	nbHabitationVillage integer,
	primary key(idEtablissement,idAdress,idDate)
)