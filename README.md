# BDDE_projet

Analyse des hébergements collectifs en France par catégorie, départements, classement etc.
###Description du depot GitHub

​	Dans ce depot Github, vous troverez different dossier qui les information concernant la realisation du projet entrepot de donnees. Voyons plus pret les dossier

- **[Data](https://github.com/loic44650/BDDE_projet/tree/master/data)** : contient des fichiers csv, que nous avons utilisé pour l'integration des donnés :




| Dataset                                  | Description                              |
| ---------------------------------------- | ---------------------------------------- |
| [Premiere Dataset](https://public.opendatasoft.com/explore/dataset/hebergements-classes/information/) | La liste des hebergement collectifs de la France cad les hotels, les campings etc. |
| [Deuxieme Dataset](https://public.opendatasoft.com/explore/dataset/correspondance-code-insee-code-postal/information/?flg=fr/) | La liste des communes avec les information sur la superficie et la population |

- **[Schema en etoile](https://github.com/loic44650/BDDE_projet/tree/master/Schema%20en%20etoile)** : contient le schema en etoile du projet

- **[talend_Workspace/BDD3](https://github.com/loic44650/BDDE_projet/tree/master/talend_Workspace/BDD3)** : Contient la configuration de workspace ***Talend*** que nous avons utilise pour la nettoyage des données; puis l'integration des ces données dans la base des données Oracle

- **[SQL](https://github.com/loic44650/BDDE_projet/tree/master/sql)** : les fichiers contenants :

  -  les requetes pour la creation des tables; 
  -  10 requêtes sur notre base des données couvrant les deux tables de fait
  -  indexation des attributs de notre base des données sur lesquelles il y aurait souvent les requêtes
  -  Les vues materialisés contenant les infrormations critiques
