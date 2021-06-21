CREATE TABLE utilisateur(
   idUtilisateur INT(255) NOT NULL AUTO_INCREMENT,
   login VARCHAR(50) NOT NULL,
   pass VARCHAR(50) NOT NULL,
   grade VARCHAR(50) NOT NULL,
   PRIMARY KEY(idUtilisateur)
);

CREATE TABLE superAdministrateur(
   idsuperAdministrateur INT(255) NOT NULL AUTO_INCREMENT,
   nom VARCHAR(250) NOT NULL,
   prenom VARCHAR(250) NOT NULL,
   numTel VARCHAR(10) NOT NULL,
   email VARCHAR(50) NOT NULL,
   idUtilisateur INT NOT NULL,
   PRIMARY KEY(idsuperAdministrateur),
   UNIQUE(idUtilisateur),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur)
);

CREATE TABLE administrateur(
   idAdministrateur INT(255) NOT NULL AUTO_INCREMENT,
   nom VARCHAR(120) NOT NULL,
   prenom VARCHAR(250) NOT NULL,
   numTel VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   idsuperAdministrateur INT NOT NULL,
   idUtilisateur INT NOT NULL,
   PRIMARY KEY(idAdministrateur),
   UNIQUE(idUtilisateur),
   FOREIGN KEY(idsuperAdministrateur) REFERENCES superAdministrateur(idsuperAdministrateur),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur)
);

CREATE TABLE contenus(
   idContenus INT(255) NOT NULL AUTO_INCREMENT,
   typeContenus VARCHAR(50) NOT NULL,
   idAdministrateur INT NOT NULL,
   PRIMARY KEY(idContenus),
   FOREIGN KEY(idAdministrateur) REFERENCES administrateur(idAdministrateur)
);

CREATE TABLE annonces(
   idAnnonces INT(255) NOT NULL AUTO_INCREMENT,
   titreAnnonces VARCHAR(250) NOT NULL,
   corpsAnnonces VARCHAR(800) NOT NULL,
   datePublication DATE NOT NULL,
   auteurAnnonces VARCHAR(50) NOT NULL,
   idContenus INT NOT NULL,
   PRIMARY KEY(idAnnonces),
   UNIQUE(idContenus),
   FOREIGN KEY(idContenus) REFERENCES contenus(idContenus)
);

CREATE TABLE podcasts(
   idPodcast INT(255) NOT NULL AUTO_INCREMENT,
   titrePodcast VARCHAR(50) NOT NULL,
   linkPodcast VARCHAR(50) NOT NULL,
   idContenus INT NOT NULL,
   PRIMARY KEY(idPodcast),
   UNIQUE(idContenus),
   FOREIGN KEY(idContenus) REFERENCES contenus(idContenus)
);

CREATE TABLE youtubeVideo(
   idVideoYoutube INT(255) NOT NULL AUTO_INCREMENT,
   titreVideoYoutube VARCHAR(50) NOT NULL,
   linkVideoYoutube VARCHAR(50) NOT NULL,
   descriptionVideoYoutube VARCHAR(550) NOT NULL,
   idContenus INT NOT NULL,
   PRIMARY KEY(idVideoYoutube),
   UNIQUE(idContenus),
   FOREIGN KEY(idContenus) REFERENCES contenus(idContenus)
);

CREATE TABLE webRadio(
   idWebRadio INT(255) NOT NULL AUTO_INCREMENT,
   titreWebRadio VARCHAR(50) NOT NULL,
   descriptionWebRadio VARCHAR(700) NOT NULL,
   imageWebRadio VARCHAR(50) NOT NULL,
   linkWebRadio VARCHAR(50) NOT NULL,
   idContenus INT NOT NULL,
   PRIMARY KEY(idWebRadio),
   UNIQUE(idContenus),
   FOREIGN KEY(idContenus) REFERENCES contenus(idContenus)
);

CREATE TABLE utilisateurMobile(
   idUtilisateurMobile INT(255) NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50) NOT NULL,
   numTel VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL, 
   idUtilisateur INT NOT NULL,
   PRIMARY KEY(idUtilisateurMobile),
   UNIQUE(idUtilisateur),
   FOREIGN KEY(idUtilisateur) REFERENCES utilisateur(idUtilisateur)
);
