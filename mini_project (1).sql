-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 08 nov 2021 om 14:22
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_project`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestelling`
--

CREATE TABLE `bestelling` (
  `artikelcode` int(11) NOT NULL,
  `winkelcode` int(11) NOT NULL,
  `aantal` int(11) DEFAULT NULL,
  `klantcode` int(11) NOT NULL,
  `medewerkerscode` int(11) NOT NULL,
  `afgehaald` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

CREATE TABLE `gebruikers` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(100) NOT NULL,
  `achternaam` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `straatnaam` varchar(50) NOT NULL,
  `huisnummer` varchar(50) NOT NULL,
  `postcode` varchar(50) NOT NULL,
  `stad` varchar(50) NOT NULL,
  `usertype_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gebruikers`
--

INSERT INTO `gebruikers` (`id`, `voornaam`, `achternaam`, `username`, `password`, `straatnaam`, `huisnummer`, `postcode`, `stad`, `usertype_id`, `created_at`) VALUES
(3, '', '', 'lucas', '$2y$10$O5blYxbq5DdO4YS2362lvua/NdLFUud0g1sNTMBuIGRbluly654jy', '', '', '', '', 1, '2021-11-01 18:07:22'),
(4, 'form', 'test', 'formtest', '$2y$10$tJE0hg9xM.I4QJoUt.qCQe8QcVQTG2UV0kbz.YDV/Bpfc7WRB8De6', 'hahastraat', '1234', '3', '3', 3, '2021-11-03 21:59:43');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `producten`
--

CREATE TABLE `producten` (
  `artikelcode` int(11) NOT NULL,
  `artikel` varchar(100) NOT NULL,
  `prijs` decimal(6,2) NOT NULL,
  `voorraad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `producten`
--

INSERT INTO `producten` (`artikelcode`, `artikel`, `prijs`, `voorraad`) VALUES
(1, 'Hengel', '65.00', '20'),
(2, 'Hengel - Start', '85.00', '14');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'Eigenaar'),
(2, 'Filiaalmanager'),
(3, 'Personeel'),
(4, 'Klant');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD KEY `artikelcode` (`artikelcode`),
  ADD KEY `winkelcode` (`winkelcode`),
  ADD KEY `klantcode` (`klantcode`),
  ADD KEY `medewerkerscode` (`medewerkerscode`);

--
-- Indexen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gebruikersnaam` (`username`),
  ADD KEY `usertype_id` (`usertype_id`);

--
-- Indexen voor tabel `producten`
--
ALTER TABLE `producten`
  ADD PRIMARY KEY (`artikelcode`);

--
-- Indexen voor tabel `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `producten`
--
ALTER TABLE `producten`
  MODIFY `artikelcode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`artikelcode`) REFERENCES `artikel` (`artikelcode`),
  ADD CONSTRAINT `bestelling_ibfk_2` FOREIGN KEY (`winkelcode`) REFERENCES `winkel` (`winkelcode`),
  ADD CONSTRAINT `bestelling_ibfk_3` FOREIGN KEY (`klantcode`) REFERENCES `klant` (`klantcode`),
  ADD CONSTRAINT `bestelling_ibfk_4` FOREIGN KEY (`medewerkerscode`) REFERENCES `medewerker` (`medewerkerscode`);

--
-- Beperkingen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD CONSTRAINT `gebruikers_ibfk_1` FOREIGN KEY (`usertype_id`) REFERENCES `usertype` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
