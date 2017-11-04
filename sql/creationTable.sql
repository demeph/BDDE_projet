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