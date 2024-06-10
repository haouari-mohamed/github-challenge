-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 10 juin 2024 à 20:10
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `challenge db`
--

-- --------------------------------------------------------

--
-- Structure de la table `indices`
--

CREATE TABLE `indices` (
  `id_indice` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `id_room` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invites`
--

CREATE TABLE `invites` (
  `id_invite` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `statut` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `invites`
--

INSERT INTO `invites` (`id_invite`, `nom`, `statut`) VALUES
(1, 'Jean Dupont', 'Suspect'),
(2, 'Marie Curie', 'Innocent'),
(3, 'Albert Einstein', 'Suspect'),
(4, 'Isaac Newton', 'Innocent'),
(5, 'Niels Bohr', 'Suspect');

-- --------------------------------------------------------

--
-- Structure de la table `movements`
--

CREATE TABLE `movements` (
  `id` int(11) NOT NULL,
  `id_invite` int(11) DEFAULT NULL,
  `id_room` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `objects`
--

CREATE TABLE `objects` (
  `id_objet` int(11) NOT NULL,
  `nom_objet` varchar(255) NOT NULL,
  `id_room` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rooms`
--

CREATE TABLE `rooms` (
  `id_room` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rooms`
--

INSERT INTO `rooms` (`id_room`, `nom`) VALUES
(1, 'Salle de Bal'),
(2, 'Bibliothèque'),
(3, 'Cuisine'),
(4, 'Salon'),
(5, 'Jardin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `indices`
--
ALTER TABLE `indices`
  ADD PRIMARY KEY (`id_indice`),
  ADD KEY `id_room` (`id_room`);

--
-- Index pour la table `invites`
--
ALTER TABLE `invites`
  ADD PRIMARY KEY (`id_invite`);

--
-- Index pour la table `movements`
--
ALTER TABLE `movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_invite` (`id_invite`),
  ADD KEY `id_room` (`id_room`);

--
-- Index pour la table `objects`
--
ALTER TABLE `objects`
  ADD PRIMARY KEY (`id_objet`),
  ADD KEY `id_room` (`id_room`);

--
-- Index pour la table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id_room`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `indices`
--
ALTER TABLE `indices`
  ADD CONSTRAINT `indices_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`);

--
-- Contraintes pour la table `movements`
--
ALTER TABLE `movements`
  ADD CONSTRAINT `movements_ibfk_1` FOREIGN KEY (`id_invite`) REFERENCES `invites` (`id_invite`),
  ADD CONSTRAINT `movements_ibfk_2` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`);

--
-- Contraintes pour la table `objects`
--
ALTER TABLE `objects`
  ADD CONSTRAINT `objects_ibfk_1` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
