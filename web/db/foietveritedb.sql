-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 mai 2021 à 13:59
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fevdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `idAdministrateur` int(255) NOT NULL,
  `nom` varchar(120) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `numTel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `idsuperAdministrateur` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `annonces`
--

CREATE TABLE `annonces` (
  `idAnnonces` int(255) NOT NULL,
  `titreAnnonces` varchar(250) NOT NULL,
  `corpsAnnonces` varchar(800) NOT NULL,
  `datePublication` date NOT NULL,
  `auteurAnnonces` varchar(50) NOT NULL,
  `idContenus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contenus`
--

CREATE TABLE `contenus` (
  `idContenus` int(255) NOT NULL,
  `typeContenus` varchar(50) NOT NULL,
  `idAdministrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `podcasts`
--

CREATE TABLE `podcasts` (
  `idPodcast` int(255) NOT NULL,
  `titrePodcast` varchar(50) NOT NULL,
  `linkPodcast` varchar(50) NOT NULL,
  `idContenus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `superadministrateur`
--

CREATE TABLE `superadministrateur` (
  `idsuperAdministrateur` int(255) NOT NULL,
  `nom` varchar(250) NOT NULL,
  `prenom` varchar(250) NOT NULL,
  `numTel` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `superadministrateur`
--

INSERT INTO `superadministrateur` (`idsuperAdministrateur`, `nom`, `prenom`, `numTel`, `email`, `statut`, `idUtilisateur`) VALUES
(1, 'Père LOLO ', 'Jacques', '23', 'jacques@gmail.com', '0', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(255) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `grade` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `login`, `pass`, `grade`) VALUES
(1, 'admin', 'admin', 'superAdmin');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurmobile`
--

CREATE TABLE `utilisateurmobile` (
  `idUtilisateurMobile` int(255) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `numTel` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idUtilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `webradio`
--

CREATE TABLE `webradio` (
  `idWebRadio` int(255) NOT NULL,
  `titreWebRadio` varchar(50) NOT NULL,
  `descriptionWebRadio` varchar(700) NOT NULL,
  `imageWebRadio` varchar(50) NOT NULL,
  `linkWebRadio` varchar(50) NOT NULL,
  `idContenus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `youtubevideo`
--

CREATE TABLE `youtubevideo` (
  `idVideoYoutube` int(255) NOT NULL,
  `titreVideoYoutube` varchar(50) NOT NULL,
  `linkVideoYoutube` varchar(50) NOT NULL,
  `descriptionVideoYoutube` varchar(550) NOT NULL,
  `idContenus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`idAdministrateur`),
  ADD UNIQUE KEY `idUtilisateur` (`idUtilisateur`),
  ADD KEY `idsuperAdministrateur` (`idsuperAdministrateur`);

--
-- Index pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD PRIMARY KEY (`idAnnonces`),
  ADD UNIQUE KEY `idContenus` (`idContenus`);

--
-- Index pour la table `contenus`
--
ALTER TABLE `contenus`
  ADD PRIMARY KEY (`idContenus`),
  ADD KEY `idAdministrateur` (`idAdministrateur`);

--
-- Index pour la table `podcasts`
--
ALTER TABLE `podcasts`
  ADD PRIMARY KEY (`idPodcast`),
  ADD UNIQUE KEY `idContenus` (`idContenus`);

--
-- Index pour la table `superadministrateur`
--
ALTER TABLE `superadministrateur`
  ADD PRIMARY KEY (`idsuperAdministrateur`),
  ADD UNIQUE KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Index pour la table `utilisateurmobile`
--
ALTER TABLE `utilisateurmobile`
  ADD PRIMARY KEY (`idUtilisateurMobile`),
  ADD UNIQUE KEY `idUtilisateur` (`idUtilisateur`);

--
-- Index pour la table `webradio`
--
ALTER TABLE `webradio`
  ADD PRIMARY KEY (`idWebRadio`),
  ADD UNIQUE KEY `idContenus` (`idContenus`);

--
-- Index pour la table `youtubevideo`
--
ALTER TABLE `youtubevideo`
  ADD PRIMARY KEY (`idVideoYoutube`),
  ADD UNIQUE KEY `idContenus` (`idContenus`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur`
--
ALTER TABLE `administrateur`
  MODIFY `idAdministrateur` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `idAnnonces` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `contenus`
--
ALTER TABLE `contenus`
  MODIFY `idContenus` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `podcasts`
--
ALTER TABLE `podcasts`
  MODIFY `idPodcast` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `superadministrateur`
--
ALTER TABLE `superadministrateur`
  MODIFY `idsuperAdministrateur` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateurmobile`
--
ALTER TABLE `utilisateurmobile`
  MODIFY `idUtilisateurMobile` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `webradio`
--
ALTER TABLE `webradio`
  MODIFY `idWebRadio` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `youtubevideo`
--
ALTER TABLE `youtubevideo`
  MODIFY `idVideoYoutube` int(255) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `administrateur_ibfk_1` FOREIGN KEY (`idsuperAdministrateur`) REFERENCES `superadministrateur` (`idsuperAdministrateur`),
  ADD CONSTRAINT `administrateur_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `annonces`
--
ALTER TABLE `annonces`
  ADD CONSTRAINT `annonces_ibfk_1` FOREIGN KEY (`idContenus`) REFERENCES `contenus` (`idContenus`);

--
-- Contraintes pour la table `contenus`
--
ALTER TABLE `contenus`
  ADD CONSTRAINT `contenus_ibfk_1` FOREIGN KEY (`idAdministrateur`) REFERENCES `administrateur` (`idAdministrateur`);

--
-- Contraintes pour la table `podcasts`
--
ALTER TABLE `podcasts`
  ADD CONSTRAINT `podcasts_ibfk_1` FOREIGN KEY (`idContenus`) REFERENCES `contenus` (`idContenus`);

--
-- Contraintes pour la table `superadministrateur`
--
ALTER TABLE `superadministrateur`
  ADD CONSTRAINT `superadministrateur_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `utilisateurmobile`
--
ALTER TABLE `utilisateurmobile`
  ADD CONSTRAINT `utilisateurmobile_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `webradio`
--
ALTER TABLE `webradio`
  ADD CONSTRAINT `webradio_ibfk_1` FOREIGN KEY (`idContenus`) REFERENCES `contenus` (`idContenus`);

--
-- Contraintes pour la table `youtubevideo`
--
ALTER TABLE `youtubevideo`
  ADD CONSTRAINT `youtubevideo_ibfk_1` FOREIGN KEY (`idContenus`) REFERENCES `contenus` (`idContenus`);
COMMIT;
