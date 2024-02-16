-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 27, 2023 alle 11:47
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lab`
--
CREATE DATABASE IF NOT EXISTS `lab` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lab`;

-- --------------------------------------------------------

--
-- Struttura della tabella `annunci_club`
--

DROP TABLE IF EXISTS `annunci_club`;
CREATE TABLE IF NOT EXISTS `annunci_club` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `type_ann` varchar(11) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `esp` varchar(255) NOT NULL,
  `prov` enum('Genova','Imperia','Savona','La Spezia') NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `sede` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `annunci_play`
--

DROP TABLE IF EXISTS `annunci_play`;
CREATE TABLE IF NOT EXISTS `annunci_play` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `type_ann` varchar(11) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `descr` varchar(999) NOT NULL,
  `esp` varchar(999) NOT NULL,
  `prov` enum('Genova','Savona','Imperia','La Spezia') NOT NULL,
  `posizione` enum('Portiere','Difensore','Centrocampista','Attaccante') NOT NULL,
  `piede` enum('Destro','Sinistro') NOT NULL,
  `altezza` int(3) NOT NULL,
  `peso` int(3) NOT NULL,
  `date_insert` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `annunci_play`
--

INSERT INTO `annunci_play` (`id`, `email`, `type_ann`, `titolo`, `descr`, `esp`, `prov`, `posizione`, `piede`, `altezza`, `peso`, `date_insert`) VALUES
(1, 'ale@gmail.com', 'calciatore', 'Cerco squadra', 'Sono un ragazzo di 23 anni che cerca una squadra. Ho smesso a causa di un infortunio e ora voglio rimettermi in gioco.', 'Ho giocato solo in terza categoria nel campionato di chiavari nell\'entella e nel leivi (fallita)', 'Genova', 'Centrocampista', 'Destro', 172, 71, '2023-03-21'),
(2, 'fed.tame@gmail.com', 'calciatore', 'ciao1', 'ciao2', 'ciao3', 'La Spezia', 'Attaccante', 'Destro', 50, 50, '2023-03-22');

-- --------------------------------------------------------

--
-- Struttura della tabella `calciatore`
--

DROP TABLE IF EXISTS `calciatore`;
CREATE TABLE IF NOT EXISTS `calciatore` (
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `sesso` enum('Maschio','Femmina') NOT NULL,
  `nascita` date NOT NULL,
  `prov` enum('Genova','Savona','Imperia','La Spezia') NOT NULL,
  `posizione` enum('Portiere','Difensore','Centrocampista','Attaccante') NOT NULL,
  `piede` enum('Destro','Sinistro') NOT NULL,
  `altezza` int(3) NOT NULL,
  `peso` int(3) NOT NULL,
  `stato` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `conf` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `calciatore`
--

INSERT INTO `calciatore` (`email`, `firstname`, `lastname`, `sesso`, `nascita`, `prov`, `posizione`, `piede`, `altezza`, `peso`, `stato`, `pass`, `conf`) VALUES
('ale@gmail.com', 'Alessandro', 'Simoni', 'Maschio', '2000-12-18', 'Genova', 'Centrocampista', 'Destro', 172, 71, 'Svincolato', '$2y$10$Gsuf4I8i.9xcRLsWssTsJO7UhXN3warNNbjozioT8VFoLeIoX6LHS', '$2y$10$Gsuf4I8i.9xcRLsWssTsJO7UhXN3warNNbjozioT8VFoLeIoX6LHS'),
('fed.tame@gmail.com', 'Fede', 'Tame', 'Femmina', '2001-09-03', 'La Spezia', 'Attaccante', 'Destro', 50, 50, 'Svincolato', '$2y$10$gp2q.urwwPeL6CQXGaA2muBVACoV45xNgAbzvZdjq12NBN2QXtOAy', '$2y$10$gp2q.urwwPeL6CQXGaA2muBVACoV45xNgAbzvZdjq12NBN2QXtOAy');

-- --------------------------------------------------------

--
-- Struttura della tabella `classifica_ge`
--

DROP TABLE IF EXISTS `classifica_ge`;
CREATE TABLE IF NOT EXISTS `classifica_ge` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `squadra` varchar(255) NOT NULL,
  `punti` int(3) NOT NULL,
  `partite_giocate` int(2) NOT NULL,
  `vittorie` int(2) NOT NULL,
  `sconfitte` int(2) NOT NULL,
  `pareggi` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `classifica_ge`
--

INSERT INTO `classifica_ge` (`id`, `squadra`, `punti`, `partite_giocate`, `vittorie`, `sconfitte`, `pareggi`) VALUES
(1, 'Morandi', 42, 18, 13, 2, 3),
(2, 'Centro Pol Sant Eusebio', 42, 17, 13, 1, 3),
(3, 'Polisportiva Rivarolese', 38, 17, 12, 3, 3),
(4, 'San Giorgio', 37, 17, 11, 2, 4),
(5, 'Sturla', 37, 18, 11, 3, 4),
(6, 'C.E.P', 36, 18, 11, 4, 3),
(7, 'Uragano Genova', 30, 18, 10, 8, 0),
(8, 'Ponente F.C', 28, 18, 9, 8, 1),
(9, 'San Bernardo', 23, 18, 6, 7, 5),
(10, 'Don Bosco Sq. B', 21, 18, 6, 9, 3),
(11, 'San Teodoro Ketzmaja Sq. B', 18, 18, 5, 10, 3),
(12, 'G. S. Granarolo Sq. B', 17, 17, 5, 10, 2),
(13, 'Campo Ligure Il Borgo Sq. B', 14, 18, 4, 12, 2),
(14, 'Ceis Genova Sport', 10, 18, 3, 14, 1),
(15, 'Boca Zena', 10, 18, 3, 14, 1),
(16, 'San Siro di Struppa', 4, 18, 1, 16, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `squadra`
--

DROP TABLE IF EXISTS `squadra`;
CREATE TABLE IF NOT EXISTS `squadra` (
  `email` varchar(255) NOT NULL,
  `club_name` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `sede` varchar(255) NOT NULL,
  `colori` varchar(255) NOT NULL,
  `prov` enum('Genova','Savona','Imperia','La Spezia') NOT NULL,
  `stadio` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `conf` varchar(255) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `squadra`
--

INSERT INTO `squadra` (`email`, `club_name`, `telefono`, `sede`, `colori`, `prov`, `stadio`, `facebook`, `instagram`, `pass`, `conf`) VALUES
('squadra@gmail.com', 'Squadra Fc', '3201533353', 'Corso Gastaldi, 25', 'Nero e azzurro', 'Genova', 'Corso Gastaldi, 25', '', 'https://www.instagram.com/alessandrosimoni64/', '$2y$10$xyGBQjf676acho4GKHhEluVjpyZzs2QRL0rfe22A.DDvnOCBjOoHq', '$2y$10$xyGBQjf676acho4GKHhEluVjpyZzs2QRL0rfe22A.DDvnOCBjOoHq');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
