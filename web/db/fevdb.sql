-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 21 juin 2021 à 23:02
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

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`idAdministrateur`, `nom`, `prenom`, `numTel`, `email`, `statut`, `idsuperAdministrateur`, `idUtilisateur`) VALUES
(1, 'PERE LOLO JACQUE', '', '0677453618', 'lolojacques@gmail.com', ' ', 1, 2),
(2, '222222', '22222', '222222', '222@gmail.com', ' ', 1, 56);

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

--
-- Déchargement des données de la table `annonces`
--

INSERT INTO `annonces` (`idAnnonces`, `titreAnnonces`, `corpsAnnonces`, `datePublication`, `auteurAnnonces`, `idContenus`) VALUES
(1, 'Premier annonce', 'Rencontre entre les jeunes de pitoare', '2021-05-10', 'LOLO', 1),
(2, 'deuxieme annonce', '123', '2021-05-12', 'LOLO', 5),
(3, 'Annonce Lorem Ipsum', 'Occaecat reprehenderit consectetur consectetur minim quis fugiat excepteur est cillum ut sunt aute laboris. Adipisicing consectetur minim exercitation id nostrud ad cillum nostrud enim ipsum veniam. Eiusmod culpa pariatur et duis reprehenderit non aliqua ex fugiat esse consequat proident nisi consequat.Occaecat reprehenderit consectetur consectetur minim quis fugiat excepteur est cillum ut sunt aute laboris. Adipisicing consectetur minim exercitation id nostrud ad cillum nostrud enim ipsum veniam. Eiusmod culpa pariatur et duis reprehenderit non aliqua ex fugiat esse consequat proident nisi consequat.', '2021-05-12', 'LOLO', 6),
(4, 'Annonce Lorem Ipsum 2', 'Occaecat reprehenderit consectetur consectetur minim quis fugiat excepteur est cillum ut sunt aute laboris. Adipisicing consectetur minim exercitation id nostrud ad cillum nostrud enim ipsum veniam. Eiusmod culpa pariatur et duis reprehenderit non aliqua ex fugiat esse consequat proident nisi consequat.', '2021-05-12', 'LOLO', 7),
(5, 'Annonce Lorem Ipsum 3', 'Minim et ut laborum consequat officia deserunt eu.Minim et ut laborum consequat officia deserunt eu.Minim et ut laborum consequat officia deserunt eu.\r\nMinim et ut laborum consequat officia deserunt eu.', '2021-05-12', 'PERE LOLO JACQUE', 8),
(6, '111111111111111111111111111', '111111111111111111111111111111111', '2021-06-01', 'PERE LOLO JACQUE', 19),
(7, '44444444444444454545545454', 'dedkjehkdhekdehkdjehdkjehekhdekdedhkjehdkejdhekhdkdede', '2021-06-01', 'PERE LOLO JACQUE', 20),
(8, 'wallahhh', 'boxxxx', '2021-06-02', 'PERE LOLO JACQUE', 21),
(9, 'Premier annonce', '    Do dolore proident cillum deserunt ea deserunt ullamco commodo fugiat.\r\n', '2021-06-02', 'PERE LOLO JACQUE', 22),
(10, 'Annonce Lorem Ipsum', '                                                Amet laborum deserunt ex veniam laborum excepteur duis dolore culpa enim.\r\n', '2021-06-02', 'PERE LOLO JACQUE', 23);

-- --------------------------------------------------------

--
-- Structure de la table `contenus`
--

CREATE TABLE `contenus` (
  `idContenus` int(255) NOT NULL,
  `typeContenus` varchar(50) NOT NULL,
  `idAdministrateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `contenus`
--

INSERT INTO `contenus` (`idContenus`, `typeContenus`, `idAdministrateur`) VALUES
(1, 'annonces', 1),
(2, 'podcasts', 1),
(3, 'podcasts', 1),
(4, 'podcasts', 1),
(5, 'annonces', 1),
(6, 'annonces', 1),
(7, 'annonces', 1),
(8, 'annonces', 1),
(9, 'podcasts', 1),
(10, 'podcasts', 1),
(11, 'podcasts', 1),
(12, 'podcasts', 1),
(13, 'podcasts', 1),
(14, 'Video Youtube', 1),
(15, 'Podcast', 1),
(16, 'Podcast', 1),
(17, 'Podcast', 1),
(18, 'Podcast', 1),
(19, 'annonces', 1),
(20, 'annonces', 1),
(21, 'annonces', 1),
(22, 'annonces', 1),
(23, 'annonces', 1),
(24, 'Video Youtube', 1),
(25, 'Podcast', 1);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE `notification` (
  `id` int(255) NOT NULL,
  `type` varchar(250) NOT NULL,
  `body` varchar(3000) NOT NULL,
  `time` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `type`, `body`, `time`) VALUES
(8, 'Premier annonce', '    Do dolore p', '2021-06-02 02:00:00.0'),
(9, 'Annonce Lorem Ipsum', 'Annonces : Annonce Lorem Ipsum', '2021-06-02 02:00:00.0'),
(10, 'La fin de la vie de Marie.', 'YoutubeVideo : La fin de la vie de Marie.', '2021-06-02 02:00:00.0'),
(11, 'La-Reine du ciel Diane et la sainte vierge Marie', 'Podcast : La-Reine du ciel Diane et la sainte vierge Marie', '2021-06-02 02:00:00.0');

-- --------------------------------------------------------

--
-- Structure de la table `podcasts`
--

CREATE TABLE `podcasts` (
  `idPodcast` int(255) NOT NULL,
  `titrePodcast` varchar(50) NOT NULL,
  `linkPodcast` varchar(500) NOT NULL,
  `idContenus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `podcasts`
--

INSERT INTO `podcasts` (`idPodcast`, `titrePodcast`, `linkPodcast`, `idContenus`) VALUES
(6, 'La-Reine du ciel Diane et la sainte vierge Marie', '21212', 25);

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
(1, 'admin', 'admin', 'superAdmin'),
(2, 'lolojacques', '123', 'admin'),
(3, 'user', 'user', 'utilisateurMobile'),
(4, 'sali', 'sali', 'utilisateurMobile'),
(5, 'sali2', 'sali2', 'utilisateurMobile'),
(6, '123', '123', 'utilisateurMobile'),
(7, 'salie', 'salie', 'utilisateurMobile'),
(16, '34', '34', 'utilisateurMobile'),
(17, '1212', '1212', 'utilisateurMobile'),
(18, '4343', '4343', 'utilisateurMobile'),
(19, 'sali2f', 'sali2f', 'utilisateurMobile'),
(20, 'adminee', 'adminee', 'utilisateurMobile'),
(22, 'ella', 'ella', 'utilisateurMobile'),
(23, '7837', '7837', 'utilisateurMobile'),
(24, '7837zz', '7837zz', 'utilisateurMobile'),
(25, 'rrrrrrrrrrr', 'rrrrrrrrrrr', 'utilisateurMobile'),
(26, 'ratpi', 'ratt', 'utilisateurMobile'),
(29, 'ez', 'ez', 'utilisateurMobile'),
(32, 'saliee', 'user', 'utilisateurMobile'),
(33, 'ezeeeeee', 'ezeeeee', 'utilisateurMobile'),
(35, 'ezeeeeeee', 'ezeeeee', 'utilisateurMobile'),
(36, 'ezeeeeeee4', 'ezeeeee', 'utilisateurMobile'),
(37, 'ds', 'ezeeeee', 'utilisateurMobile'),
(39, 'dse', 'ezeeeee', 'utilisateurMobile'),
(40, 'fd', 'fd', 'utilisateurMobile'),
(41, 'cc', 'cccc', 'utilisateurMobile'),
(42, 'fede', 'fede', 'utilisateurMobile'),
(43, 'fedet', 'fede', 'utilisateurMobile'),
(44, 'cv', 'c', 'utilisateurMobile'),
(45, '145', 'art', 'utilisateurMobile'),
(46, 'Wanie', '123', 'utilisateurMobile'),
(47, 'rrt', 'y', 'utilisateurMobile'),
(48, 'only', 'only', 'utilisateurMobile'),
(49, 'onlyk', 'only', 'utilisateurMobile'),
(50, 'onlI', 'only', 'utilisateurMobile'),
(51, 'ff', 'ff', 'utilisateurMobile'),
(52, 'oki', 'oki', 'utilisateurMobile'),
(53, 'rt', 'rt', 'utilisateurMobile'),
(54, 'dotd', 'dotd', 'utilisateurMobile'),
(56, '12222', '2222', 'admin');

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

--
-- Déchargement des données de la table `utilisateurmobile`
--

INSERT INTO `utilisateurmobile` (`idUtilisateurMobile`, `nom`, `prenom`, `numTel`, `email`, `idUtilisateur`) VALUES
(1, 'SALI', 'EMMANUEL', '1265', 'saliemmanuel3304@gmail.com', 3),
(2, 'SALI', 'EMMANUEL', '698066896', 'saliemmanuel3@gmail.com', 4),
(3, 'SALI2', 'EMMANUEL2', '6980668962', 'saliemmanuel3@gmail.com2', 5),
(4, '123', '123', '123', '123', 6),
(14, '43', '43', '43', '43', 16),
(15, '1212', '1212', '1212', '1212', 17),
(20, 'ella', 'ella', '4555', 'emam', 22),
(24, 'sali', 'ratpi', '34', 'eee', 26),
(27, 'ez', 'ez', '2', 'ez', 29),
(30, 'ez', 'ez', 'ez', 'ez', 32),
(31, 'ezeeeeeeeeee', 'ezeeeeeeeeee', '2', 'ezeee', 33),
(33, 'ezeeeeeeeeee', 'ezeeeeeeeeee', '2', 'ezeee', 35),
(34, 'ezeeeeeeeeee', 'ezeeeeeeeeee', '2', 'ezeee', 36),
(35, 'ezeeeeeeeeee', 'ezeeeeeeeeee', '2', 'ezeee', 37),
(37, 'ezeeeeeeeeee', 'ezeeeeeeeeee', '2', 'ezeee', 39),
(38, 'fd', 'fd', 'fd', 'fd', 40),
(39, 'cccc', 'ccccc', 'cc', 'cc', 41),
(40, 'ert', 'ert', '45', 'df', 42),
(41, 'ert', 'ert', '45', 'df', 43),
(42, 'c', 'c', 'c', 's,', 44),
(43, 'hdh', 'bbd', 'thys', 'bbd', 45),
(44, 'Wanie ', 'Peter', 'ok', 'okw', 46),
(45, 'y', 'y', '56', 'ghj', 47),
(46, 'only', 'only', '5', '\'DSDS', 50),
(47, 'ff', 'ff', '111', 'EMAIL', 51),
(48, 'oki', 'oki', '695234567', 'okigmail@gmail.com', 52),
(49, 'rt', 'rt', '(', 'rrr', 53),
(50, 'dotDev', 'dotDev', '69832', 'dodot@gmail.com', 54);

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

--
-- Déchargement des données de la table `webradio`
--

INSERT INTO `webradio` (`idWebRadio`, `titreWebRadio`, `descriptionWebRadio`, `imageWebRadio`, `linkWebRadio`, `idContenus`) VALUES
(1, 'premiere web radio', 'description web radio', '', 'www.webradio.com', 3);

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
-- Déchargement des données de la table `youtubevideo`
--

INSERT INTO `youtubevideo` (`idVideoYoutube`, `titreVideoYoutube`, `linkVideoYoutube`, `descriptionVideoYoutube`, `idContenus`) VALUES
(1, 'Premiere video ', 'http://127.0.0.5/foi%20et%20verite/pages/screens/a', 'Description', 4),
(2, 'Les vertus et les défauts de Marie.', 'https://www.youtube.com/watch?v=YgBn_kdBKtU', 'Comme tous les êtres humains sur la terre, Marie la mère de Jésus avait ses qualités et ses défauts, ses forces et ses faiblesses. Marie n’était parfaite ni avant la naissance de Jésus Christ, ni vécu parfaite toute sa vie terrestre. C’est une doctrine de démon de l’enseigner ou de le croire. La Bible fait largement mention des caractères de Marie. Enseignement foi et vérité pour étude biblique par le père Jacques Lolo.\r\n', 9),
(3, 'La fin de la vie de Marie.', 'https://www.youtube.com/watch?v=YCaxsw_22JA', 'La dernière fois où la Bible fait mention nommément de Marie la mère de Jésus est dans les actes des apôtres au chapitre 1. Après cela, aucune autre mention n’est faite d’elle. La mort de Marie n’est pas relatée dans la Bible et donc pas importante pour le salut ; de ce fait, elle n’est pas un sujet biblique. Les chrétiens devraient donc faire très attention de tomber dans ce piège du diable qui n’est que fables et mensonge. Enseignement foi et vérité pour étude biblique par le père Jacques Lolo.\r\n', 10),
(4, 'Les généalogies de Jésus et de Marie.', 'https://www.youtube.com/watch?v=rmdBG1ddT5M', 'Le nouveau testament s’ouvre avec la généalogie de Jésus. Quant à Marie sa mère, la Bible ne dit rien et absolument rien quant à sa généalogie. Etudier la Parole de Dieu, s’en tenir à elle et la mettre en pratique est la seule voie du salut. La fausse généalogie de Marie n’est que doctrine de démon. Enseignement foi et vérité pour étude biblique par le père Jacques LOLO.\r\n', 11),
(5, 'Les erreurs ou péchés de Marie.', 'https://www.youtube.com/watch?v=ltAJM1SnzTc', 'Marie la mère de Jésus avait ses faiblesses, ses erreurs et es péchés comme tout être humain. La Bible fait mention de certains égarements et péchés de la mère de Jésus. Elle a souvent fait des reproches injustifiés et mal inspirés à Jésus. Marie n’a pas vécu sans péché car elle était humaine. Cet enseignement ou étude biblique a pour but d’aider les chrétiens à sortir de l’idolâtrie abominable de la sainte vierge Marie. Enseignement foi et vérité par le père LOLO Jacques.\r\n', 12),
(6, 'Les erreurs ou péchés de Marie.', 'www.youtube.com/watch?v=ltAJM1SnzTc', 'Marie la mère de Jésus avait ses faiblesses, ses erreurs et es péchés comme tout être humain. La Bible fait mention de certains égarements et péchés de la mère de Jésus. Elle a souvent fait des reproches injustifiés et mal inspirés à Jésus. Marie n’a pas vécu sans péché car elle était humaine. Cet enseignement ou étude biblique a pour but d’aider les chrétiens à sortir de l’idolâtrie abominable de la sainte vierge Marie. Enseignement foi et vérité par le père LOLO Jacques.', 13),
(7, 'Les erreurs ou péchés de Marie.', 'Les erreurs ou péchés de Marie.', 'Les erreurs ou péchés de Marie.', 14),
(8, 'La fin de la vie de Marie.', '444444444444444444444444444444444444444444444444', '45555555555555555', 24);

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
-- Index pour la table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `idAdministrateur` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `annonces`
--
ALTER TABLE `annonces`
  MODIFY `idAnnonces` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `contenus`
--
ALTER TABLE `contenus`
  MODIFY `idContenus` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `podcasts`
--
ALTER TABLE `podcasts`
  MODIFY `idPodcast` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `superadministrateur`
--
ALTER TABLE `superadministrateur`
  MODIFY `idsuperAdministrateur` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `utilisateurmobile`
--
ALTER TABLE `utilisateurmobile`
  MODIFY `idUtilisateurMobile` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `webradio`
--
ALTER TABLE `webradio`
  MODIFY `idWebRadio` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `youtubevideo`
--
ALTER TABLE `youtubevideo`
  MODIFY `idVideoYoutube` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
