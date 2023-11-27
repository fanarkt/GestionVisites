-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 27 nov. 2023 à 20:36
-- Version du serveur : 10.6.12-MariaDB-0ubuntu0.22.04.1
-- Version de PHP : 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ensitech_projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `id` int(10) NOT NULL,
  `libelle` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `id` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `tel` varchar(10) NOT NULL,
  `specialiteComplementaire` varchar(255) NOT NULL,
  `departement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id` int(10) NOT NULL,
  `nomCommercial` varchar(255) NOT NULL,
  `idFamille` int(10) NOT NULL,
  `composition` varchar(255) NOT NULL,
  `effets` varchar(255) NOT NULL,
  `contreindications` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `offrir`
--

CREATE TABLE `offrir` (
  `idRapport` int(10) NOT NULL,
  `idMedicament` int(10) NOT NULL,
  `quantite` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `id` int(10) NOT NULL,
  `date` datetime NOT NULL,
  `motif` varchar(255) NOT NULL,
  `bilan` varchar(255) NOT NULL,
  `idVisiteur` int(10) NOT NULL,
  `idMedecin` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` int(10) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `ville` varchar(25) NOT NULL,
  `dateEmbauche` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `liaisonFamille` (`idFamille`);

--
-- Index pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD PRIMARY KEY (`idRapport`),
  ADD KEY `liaisonMedicament` (`idMedicament`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVisiteur` (`idVisiteur`),
  ADD KEY `liaisonMedecin` (`idMedecin`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `liaisonFamille` FOREIGN KEY (`idFamille`) REFERENCES `famille` (`id`);

--
-- Contraintes pour la table `offrir`
--
ALTER TABLE `offrir`
  ADD CONSTRAINT `liaisonMedicament` FOREIGN KEY (`idMedicament`) REFERENCES `medicament` (`id`),
  ADD CONSTRAINT `liaisonRapport` FOREIGN KEY (`idRapport`) REFERENCES `rapport` (`id`);

--
-- Contraintes pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD CONSTRAINT `liaisonMedecin` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`id`),
  ADD CONSTRAINT `liaisonVisiteur` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
