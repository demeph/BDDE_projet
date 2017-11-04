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
);


Create table lesCommunes (
	codeInsee integer,
	codePostale integer,
	commune varchar2(50),
	departement varchar2(50),
	region varchar2(50),
	superficie float,
	population integer,
	primary key(codeInsee,codePostale)
);

Create table tabletemp(
	id integer primary key,
	datePublication date,
	dateClassement date,
	typologie varchar2(30),
	classement varchar2(15),
	categorie varchar2(20),	
	codePostale integer
);


create table tableDeFait2 as (
	select typologie,classement,categorie,a.codePostale,departement,region,superficie,population 
	from tabletemp a right join lesCommunes b on a.codePostale = b.codePostale
	);