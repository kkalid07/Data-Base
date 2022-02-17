-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 16 fév. 2022 à 17:59
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `alphabase`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE `candidature` (
  `Id_Offre` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `date_postulation` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `certification`
--

CREATE TABLE `certification` (
  `Id_certif` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Type_certif` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `Id_comm` int(11) NOT NULL,
  `Id_pub` int(11) NOT NULL,
  `contenu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `Id_entreprise` int(11) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Add_mail` varchar(30) NOT NULL,
  `Num_tel` int(11) NOT NULL,
  `Adresse` varchar(30) NOT NULL,
  `Categorie` varchar(255) NOT NULL,
  `Region` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pub-offre`
--

CREATE TABLE `pub-offre` (
  `Id_Offre` int(11) NOT NULL,
  `Id_entreprise` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

CREATE TABLE `publication` (
  `Id_Pub` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Contenu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `Id_Q` int(11) NOT NULL,
  `Id_Certif` int(11) NOT NULL,
  `Question` text NOT NULL,
  `rep1` text NOT NULL,
  `rep2` text NOT NULL,
  `rep3` text NOT NULL,
  `Rep-correct` text NOT NULL,
  `Score` int(11) NOT NULL,
  `Resultat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reclamation`
--

CREATE TABLE `reclamation` (
  `Id_Rec` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Id_entreprise` int(11) NOT NULL,
  `Type_rec` text NOT NULL,
  `Description` text NOT NULL,
  `Titre_Rep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reponse_rec`
--

CREATE TABLE `reponse_rec` (
  `Id_Rec` int(11) NOT NULL,
  `Id_entreprise` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reseau`
--

CREATE TABLE `reseau` (
  `Id_reseau` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `Id_user` int(11) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Prenom` varchar(30) NOT NULL,
  `Num_tel` int(11) NOT NULL,
  `Add_mail` varchar(30) NOT NULL,
  `Date_naissance` date NOT NULL,
  `Region` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD PRIMARY KEY (`Id_user`,`Id_Offre`),
  ADD KEY `Id_Offre` (`Id_Offre`);

--
-- Index pour la table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`Id_certif`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`Id_comm`),
  ADD KEY `Id_pub` (`Id_pub`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`Id_entreprise`);

--
-- Index pour la table `pub-offre`
--
ALTER TABLE `pub-offre`
  ADD PRIMARY KEY (`Id_Offre`),
  ADD KEY `Id_entreprise` (`Id_entreprise`);

--
-- Index pour la table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`Id_Pub`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`Id_Q`),
  ADD KEY `Id_Certif` (`Id_Certif`);

--
-- Index pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD PRIMARY KEY (`Id_Rec`),
  ADD KEY `Id_entreprise` (`Id_entreprise`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Index pour la table `reponse_rec`
--
ALTER TABLE `reponse_rec`
  ADD PRIMARY KEY (`Id_Rec`,`Id_user`,`Id_entreprise`),
  ADD KEY `Id_entreprise` (`Id_entreprise`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Index pour la table `reseau`
--
ALTER TABLE `reseau`
  ADD PRIMARY KEY (`Id_reseau`),
  ADD KEY `Id_user` (`Id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id_user`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `certification`
--
ALTER TABLE `certification`
  MODIFY `Id_certif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `Id_comm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pub-offre`
--
ALTER TABLE `pub-offre`
  MODIFY `Id_Offre` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `publication`
--
ALTER TABLE `publication`
  MODIFY `Id_Pub` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `Id_Q` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reclamation`
--
ALTER TABLE `reclamation`
  MODIFY `Id_Rec` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reseau`
--
ALTER TABLE `reseau`
  MODIFY `Id_reseau` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `candidature_ibfk_1` FOREIGN KEY (`Id_Offre`) REFERENCES `pub-offre` (`Id_Offre`),
  ADD CONSTRAINT `candidature_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`);

--
-- Contraintes pour la table `certification`
--
ALTER TABLE `certification`
  ADD CONSTRAINT `certification_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`);

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `commentaire_ibfk_1` FOREIGN KEY (`Id_pub`) REFERENCES `publication` (`Id_Pub`);

--
-- Contraintes pour la table `pub-offre`
--
ALTER TABLE `pub-offre`
  ADD CONSTRAINT `pub-offre_ibfk_1` FOREIGN KEY (`Id_entreprise`) REFERENCES `entreprise` (`Id_entreprise`);

--
-- Contraintes pour la table `publication`
--
ALTER TABLE `publication`
  ADD CONSTRAINT `publication_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Id_Certif`) REFERENCES `certification` (`Id_certif`);

--
-- Contraintes pour la table `reclamation`
--
ALTER TABLE `reclamation`
  ADD CONSTRAINT `reclamation_ibfk_1` FOREIGN KEY (`Id_entreprise`) REFERENCES `entreprise` (`Id_entreprise`),
  ADD CONSTRAINT `reclamation_ibfk_2` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`);

--
-- Contraintes pour la table `reponse_rec`
--
ALTER TABLE `reponse_rec`
  ADD CONSTRAINT `reponse_rec_ibfk_1` FOREIGN KEY (`Id_Rec`) REFERENCES `reclamation` (`Id_Rec`),
  ADD CONSTRAINT `reponse_rec_ibfk_2` FOREIGN KEY (`Id_entreprise`) REFERENCES `entreprise` (`Id_entreprise`),
  ADD CONSTRAINT `reponse_rec_ibfk_3` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`);

--
-- Contraintes pour la table `reseau`
--
ALTER TABLE `reseau`
  ADD CONSTRAINT `reseau_ibfk_1` FOREIGN KEY (`Id_user`) REFERENCES `user` (`Id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
