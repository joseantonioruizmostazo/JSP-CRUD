-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2018 a las 12:36:19
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clubes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `CodEqui` int(11) NOT NULL,
  `NomEqui` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FunEqui` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`CodEqui`, `NomEqui`, `FunEqui`) VALUES
(1, 'Real Madrid', 1902),
(2, 'F.C. Barcelona', 1901),
(3, 'Sevilla F.C.', 1904),
(4, 'Valencia C.F.', 1919),
(5, 'Atl. Madrid', 1903),
(6, 'Málaga C.F', 1920),
(7, 'Alavés C.F.', 1927),
(8, 'Leganés C.F', 1922),
(9, 'Betis C.F', 1916),
(10, 'Getafe C.F', 1913),
(11, 'R.C. Deportivo', 1923),
(12, 'C.D. Celta', 1920),
(13, 'Real Sociedad', 1929),
(14, 'Ath. Bilbao', 1930),
(15, 'R.C.D Espanyol', 1911),
(16, 'Eibar', 1931),
(17, 'U.D Levante', 1914),
(18, 'Girona', 1934),
(19, 'Villarreal', 1934),
(20, 'Las Palmas', 1922);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `CodJug` int(2) NOT NULL,
  `NomJug` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EdaJug` int(2) DEFAULT NULL,
  `PosJug` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AltJug` int(3) DEFAULT NULL,
  `PesJug` int(2) DEFAULT NULL,
  `PieJug` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CodEqui` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`CodJug`, `NomJug`, `EdaJug`, `PosJug`, `AltJug`, `PesJug`, `PieJug`, `CodEqui`) VALUES
(1, 'Messi', 30, 'Delantero', 167, 68, 'Izquierdo', 2),
(2, 'Cristiano Ronaldo', 33, 'Delantero', 182, 80, 'Derecho', 1),
(3, 'Sergio Ramos', 31, 'Defensa', 182, 81, 'Derecho', 1),
(4, 'Simone Zaza', 26, 'Delantero', 186, 84, 'Derecho', 4),
(5, 'Luis Muriel', 25, 'Delantero', 170, 65, 'Izquierdo', 3),
(6, 'Antonio Adán', 29, 'Portero', 189, 87, 'Derecho', 9),
(7, 'Gabriel Pires', 24, 'Centrocampista', 174, 74, 'Derecho', 8),
(8, 'Filipe Luis', 32, 'Defensa', 181, 78, 'Izquierdo', 5),
(9, 'Manuel Iturra', 31, 'Centrocampista', 169, 70, 'Derecho', 6),
(10, 'Munir El Haddadi', 22, 'Delantero', 175, 72, 'Derecho', 7),
(11, 'Bruno González', 26, 'Defensa', 177, 80, 'Derecho', 10),
(12, 'Lucas Pérez', 28, 'Delantero', 174, 75, 'Derecho', 11),
(13, 'Iago Aspas', 26, 'Delantero', 170, 71, 'Derecho', 12),
(14, 'Asier Illarramendi', 27, 'Centrocampista', 178, 76, 'Derecho', 13),
(15, 'Kepa Arrizabalaga', 20, 'Portero', 192, 86, 'Izquierdo', 14),
(16, 'Esteban Granero', 28, 'Centrocampista', 180, 78, 'Derecho', 15),
(17, 'Pedro Leon', 29, 'Centrocampista', 176, 76, 'Derecho', 16),
(18, 'Marc Muniesa', 25, 'Defensa', 177, 75, 'Derecho', 18),
(19, 'Carlos Bacca', 28, 'Delantero', 170, 70, 'Izquierdo', 19),
(20, 'Vicente Gómez', 28, 'Centrocampista', 170, 72, 'Derecho', 20),
(21, 'Oier Olazábal', 30, 'Portero', 191, 89, 'Derecho', 17);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`CodEqui`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`CodJug`),
  ADD KEY `FK_CodEqui` (`CodEqui`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `CodEqui` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `FK_CodEqui` FOREIGN KEY (`CodEqui`) REFERENCES `equipo` (`CodEqui`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
